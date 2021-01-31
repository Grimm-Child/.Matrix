# Boot Scripts
This script is meant to be run in the background of WSL at Windows login, so that I don't have to manually start the services myself.

## How To
### The Script
If it doesn't already exist, create the directy `~/.local/bin/`.
```
mkdir -p ~/.local/bin/
touch ~/.local/bin/start_services.sh
```
Open `start_services.sh` in your editor of choice, and add the following lines:
```
#!/bin/bash
if ps ax |grep -v grep | grep 'postgresql' > /dev/null
then
  echo 'Postgres is already running'
else
  service postgresql start
fi

if ps ax |grep -v grep | grep 'docker' > /dev/null
then
  echo 'Docker is already running'
else
  service docker start
fi
```

Add whatever other services you need or want to add. When you're finished, save
the file. Then you need to grant it permission to run:
```
chmod +x ~/.local/bin/start_services.sh
```

### Sudo
But wait, running services requires `sudo` privledges... I'm lazy
and don't want to type my password in every time the script runs...
So let's fix that:
```
sudo visudo
```

Add the following to the bottom, replacing `<username>` with your own:
```
<username> ALL=(root) NOPASSWD: /home/<username>/.local/bin/start_services.sh
```

### The Windows Side
Open the start menu and type **"Task Scheduler"** to bring up the application.

Click on **"Task Scheduler Library"** on the left, followed by **"Create Task"** on the right.
- Name the task whatever you want
- Under **"Triggers"** tab, click *"New"*
- In the **"Begin the task"** dropdown, select *"At log on"*
- Select **"Any user"**
- Under the **"Actions"** tab, click *"New"*
- Select **"Start a program"** for the action type and enter `"C:\Windows\System32\bash.exe"` as the program to run.
- For **"Add arguments (optional)"**, enter `"-c "sudo ~/.local/bin/start_services.sh"`

> Note that this will run under your default WSL distribution.


## Option Number 2 (Everyone likes options)
### Create `/etc/profile.d/start-postgres.sh`. 
In that file, add the following:
```
#!/bin/bash
sudo /usr/bin/start-postgres
```

### Then create `/usr/bin/start-postgres`, which contains:
```
#!/bin/bash
if ps ax |grep -v grep | grep 'postgres' > /dev/null
then
  echo 'Postgres is running'
else
  sudo service postgres start
fi
```

### After that, run the following:
```
sudo chmod +x /usr/bin/start-postgres
```

### Finally
Make sure this is somewhere in your `~/.bashrc` or `~/.bash_profile`:
```
source /etc/profile
```

Repeat as necessary for whatever services you need.
