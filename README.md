<div align="center">
    
I break things. **A lot.** Between local web developement, virtual machines, and my habit of acting first, thinking later, I got *really* tired of setting up new OS installs. So I decided to make it easier on myself with this repository.

🦇 **DISCLAIMER** 🦇
==============================
This is a very, very, very much work-in-progress thing. I've Frankenstein'd a bunch of snippets from other people's dotfiles to create these. So many, in fact, that I'm not even sure of my sources, soooo if you see something you want to be credited for, let me know.

</div>

## Contents

- [First Steps](#first-steps)
- [Enable WSL](#enable-wsl)
- (Optional) [Windows Terminal](#windows-terminal)
- (Optional) [VSCode and WSL2](#vscode-and-wsl2)
- [Ubuntu Scripts](#ubuntu-scripts)
- [Auto Install](#auto-install)
- [Auto Cleanup](#auto-cleanup)
- [Manual Install](#manual-install)
- [Xfce4 and xRDP](#xfce4-and-xrdp)
- [Fonts](#fonts)
- [Helpful Links](#helpful-links)
- [License](#license)

## First Steps

I use Ubuntu | WSL2 running on Windows 10. Some of these scripts and options may not work out of the box for you. Sorry.

<details>
<summary>If you need to install WSL2 (or upgrade from WSL1), start here.</summary>
	
### Enable WSL

*[WSL development on GitHub](https://github.com/microsoft/WSL)*

Enable WSL 2 and update the linux kernel ([Source](https://docs.microsoft.com/en-us/windows/wsl/install-win10))

```powershell
# Open PowerShell as Administrator

# Enable WSL and VirtualMachinePlatform features
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Download and install the Linux kernel update package
$wslUpdateInstallerUrl = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
$downloadFolderPath = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
$wslUpdateInstallerFilePath = "$downloadFolderPath/wsl_update_x64.msi"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($wslUpdateInstallerUrl, $wslUpdateInstallerFilePath)
Start-Process -Filepath "$wslUpdateInstallerFilePath"

# Set WSL default version to 2
wsl --set-default-version 2
```

#### Choose an Ubuntu Distro from the Microsoft Store

- [Ubuntu](https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6)
- [Ubuntu 20.04](https://www.microsoft.com/en-us/p/ubuntu-2004-lts/9n6svws3rx71)
- [Ubuntu 18.04](https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q)
- [Ubuntu 16.04](https://www.microsoft.com/en-us/p/ubuntu-1604/9pjn388hp8c9)

#### Set Up Ubuntu User

Boot the Ubuntu app you just installed and follow any instructions to setup your Ubuntu user profile.

Update Ubuntu deps with: `sudo apt-get update && sudo apt-get upgrade`

#### Set Default Ubuntu Distro

If you installed more than one version of Ubuntu, or you plan on installing others in the future, go ahead and set the default distro you want being used.

```powershell
# Open PowerShell as Administrator

# wsl --set-version <Distro> <WSL Version>
wsl --set-version Ubuntu-20.04 2

# Validate the correct WSL version is being used:
wsl --list --verbose
```

#### Windows Terminal

*[Windows Terminal development on GitHub](https://github.com/microsoft/terminal)*

Microsoft's [Terminal app](https://www.microsoft.com/store/productId/9N0DX20HK701) is a modern terminal app designed for seamless integration between Windows and WSL, including support for different shells, custom themes, tabs and unicode (read emoji).

#### VSCode and WSL2
*[VSCode remote server development on GitHub](https://github.com/microsoft/vscode-remote-release)*
With VSCode's remote server feature, it has native support for WSL. You can run `code .` (or `code-insiders .` if you're using the Insiders version) from within a folder in any terminal, and VSCode makes the magic happen. See the [docs for further information](https://code.visualstudio.com/docs/remote/wsl).

#### Next Steps

At this point, you should have WSL2 working and an Ubunto distro installed. If your Ubuntu user is set up and your terminal is ready to go, follow the rest of the guide below.
</details>

## Ubuntu Scripts

Items installed in the following scripts include:

<div align="center">

**shell**
[`zsh`](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) ✰ [`oh-my-zsh`](https://github.com/ohmyzsh/ohmyzsh) ✰ [`powerline fonts`](https://github.com/powerline/fonts) ✰ [`starship cross-shell theme`](https://starship.rs/)

**cli tools**
[`asdf`](https://github.com/asdf-vm/asdf) ✰ [`navi`](https://github.com/denisidoro/navi) ✰ [`remote-share-cli`](https://github.com/marionebl/remote-share-cli) ✰ [`shellcheck`](https://github.com/koalaman/shellcheck) ✰ [`surge`](https://github.com/sintaxi/surge) ✰ [`tmux`](https://tmux.github.io/) ✰ [`z`](https://github.com/rupa/z)

**asdf plugins**
[`direnv`](https://github.com/asdf-community/asdf-direnv) ✰ [`docker-slim`](https://github.com/everpeace/asdf-docker-slim) ✰ [`dotenv-linter`](https://github.com/wesleimp/asdf-dotenv-linter) ✰ [`github-cli`](https://github.com/bartlomiejdanek/asdf-github-cli) ✰ [`github-markdown-toc`](https://github.com/skyzyx/asdf-github-markdown-toc) ✰ [`nodejs`](https://github.com/asdf-vm/asdf-nodejs) ✰ [`postgres`](https://github.com/smashedtoatoms/asdf-postgres) ✰ [`python`](https://github.com/danhper/asdf-python) ✰ [`shellcheck`](https://github.com/luizm/asdf-shellcheck) ✰ [`starship`](https://github.com/grimoh/asdf-starship) ✰ [`vim`](https://github.com/tsuyoshicho/asdf-vim) ✰ [`yarn`](https://github.com/twuni/asdf-yarn)

</div>

### Auto Install

<details>
<summary>If you like things easy, but possibly broken, start here</summary>

1. Clone the repository into the `sources` directory:
    ```shell
    cd ~ && git clone https://github.com/Grimm-Child/.Matrix ~/sources/dotfiles
    ```

2. Run the `setup-shell.bash` script:
    ```shell
    ~/sources/dotfiles/scripts/setup-shell.bash
    ```
*`exit` OMZSH shell once it is default. Then restart your shell.*

3. Update `config/asdf-plugins.txt` with your chosen plugins. Mine are the default list in the file.

4. Run the `setup-devtools.bash` script
    ```shell
    ~/sources/dotfiles/scripts/setup-devtools.bash
    ```

5. Restart your shell as required by `asdf`. Don't argue, just do it.

6. Run the `setup-devtools.bash` script again. No, I didn't stutter, run it again.
    ```shell
    ~/sources/dotfiles/scripts/setup-devtools.bash
    ```

#### Auto Cleanup

- Run the `cleanup.bash` script
```shell
~/sources/dotfiles/scripts/cleanup.bash
```
</details>

### Manual Installation

<details>
<summary>Don't want to break things? Here is a safe place to start</summary>

- Open `scripts/setup-shell.bash` and `scripts/setup-devtools.bash` and copy/paste the commands you wish to use from top to bottom. I mean, that's the simplest way I can put it.
</details>

### Xfce4 and xRDP

<details>
<summary>To access a Linux GUI from Windows with Xfce4 and xRDP, follow the instructions below</summary>

#### Download and install Xfce4
In a WSL terminal, run the following command:
```bash
sudo apt-get -y install xfce4 && sudo apt-get -y install xubuntu-desktop
```
This is going to take *awhile*. Patience is a virtue.

#### Install the xRDP server

Download and install xRDP with:
```bash
sudo apt-get -y install xrdp
```

#### Configure xRDP for xfce4 and restart

```bash
# configure
echo xfce4-session > ~/.xsession

# restart
sudo service xrdp restart
```

#### Note the WSL IP address

```bash
ifconfig | grep inet
```

At this point, you should be able to open an RDP session from Windows 10. 
Open up remote desktop connection window using `mstsc` and provide the WSL IP address found in the last step.
</details>

###### Fonts

- [Microsoft's Cascadia Code with Powerlines](https://github.com/microsoft/cascadia-code): mono, ligatures, free
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/#how-to-install): mono, ligatures, free
- [Fira Code](https://github.com/tonsky/FiraCode): mono, ligatures, free
- [Anomaly Mono](https://github.com/benbusby/anomaly-mono): mono, free
- [Hack](https://github.com/source-foundry/Hack): mono, free
- [Source Code Pro](https://www.1001fonts.com/source-code-pro-font.html): mono, ligatures, free
- [Anonymous Pro](https://www.1001fonts.com/anonymous-pro-font.html): mono, ligatures, free
- [Software Tester 7](https://www.1001fonts.com/software-tester-7-font.html): mono, free
- [NovaMono](https://www.1001fonts.com/novamono-font.html): mono, ligatures, free

###### Helpful Links

ZSH:

- [Bash 2 ZSH reference card](http://www.bash2zsh.com/zsh_refcard/refcard.pdf): Bash user's guide to ZSH
- [ZSH Lovers](http://grml.org/zsh/zsh-lovers.html): Z Shell tips and tricks

dotfiles:

- [Pimp My dotfiles](https://dssg.github.io/hitchhikers-guide/curriculum/programming_best_practices/pimp-my-dotfiles/): Lots of useful information regarding dotfiles

###### License

[MIT License](LICENSE) © [Cyriina Grimm](https://github.com/Grimm-Child/)
