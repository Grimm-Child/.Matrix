#-- START ZCACHE GENERATED FILE
#-- GENERATED: Fri 12 Feb 2021 10:45:22 AM EST
#-- ANTIGEN develop
_antigen () {
	local -a _1st_arguments
	_1st_arguments=('apply:Load all bundle completions' 'bundle:Install and load the given plugin' 'bundles:Bulk define bundles' 'cleanup:Clean up the clones of repos which are not used by any bundles currently loaded' 'cache-gen:Generate cache' 'init:Load Antigen configuration from file' 'list:List out the currently loaded bundles' 'purge:Remove a cloned bundle from filesystem' 'reset:Clears cache' 'restore:Restore the bundles state as specified in the snapshot' 'revert:Revert the state of all bundles to how they were before the last antigen update' 'selfupdate:Update antigen itself' 'snapshot:Create a snapshot of all the active clones' 'theme:Switch the prompt theme' 'update:Update all bundles' 'use:Load any (supported) zsh pre-packaged framework') 
	_1st_arguments+=('help:Show this message' 'version:Display Antigen version') 
	__bundle () {
		_arguments '--loc[Path to the location <path-to/location>]' '--url[Path to the repository <github-account/repository>]' '--branch[Git branch name]' '--no-local-clone[Do not create a clone]'
	}
	__list () {
		_arguments '--simple[Show only bundle name]' '--short[Show only bundle name and branch]' '--long[Show bundle records]'
	}
	__cleanup () {
		_arguments '--force[Do not ask for confirmation]'
	}
	_arguments '*:: :->command'
	if (( CURRENT == 1 ))
	then
		_describe -t commands "antigen command" _1st_arguments
		return
	fi
	local -a _command_args
	case "$words[1]" in
		(bundle) __bundle ;;
		(use) compadd "$@" "oh-my-zsh" "prezto" ;;
		(cleanup) __cleanup ;;
		(update|purge) compadd $(type -f \-antigen-get-bundles &> /dev/null || antigen &> /dev/null; -antigen-get-bundles --simple 2> /dev/null) ;;
		(theme) compadd $(type -f \-antigen-get-themes &> /dev/null || antigen &> /dev/null; -antigen-get-themes 2> /dev/null) ;;
		(list) __list ;;
	esac
}
antigen () {
  local MATCH MBEGIN MEND
  [[ "$ZSH_EVAL_CONTEXT" =~ "toplevel:*" || "$ZSH_EVAL_CONTEXT" =~ "cmdarg:*" ]] && source "/home/cyriina/.lib/antigen/antigen.zsh" && eval antigen $@;
  return 0;
}
typeset -gaU fpath path
fpath+=(/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib /home/cyriina/.antigen/bundles/gretzky/auto-color-ls /home/cyriina/.antigen/bundles/chrissicool/zsh-256color /home/cyriina/.antigen/bundles/kiurchv/asdf.plugin.zsh /home/cyriina/.antigen/bundles/Tarrasch/zsh-autoenv /home/cyriina/.antigen/bundles/MichaelAquilina/zsh-autoswitch-virtualenv /home/cyriina/.antigen/bundles/unixorn/autoupdate-antigen.zshplugin /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/bower /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colorize /home/cyriina/.antigen/bundles/ptavares/zsh-direnv /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/django /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker-compose /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker-machine /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/dotenv /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/emoji /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/gulp /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/heroku /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/node /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/npm /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/nvm /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/postgres /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pyenv /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/python /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/screen /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/ssh-agent /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/systemd /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/virtualenv /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/vscode /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/yarn /home/cyriina/.antigen/bundles/zsh-users/zsh-syntax-highlighting) path+=(/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib /home/cyriina/.antigen/bundles/gretzky/auto-color-ls /home/cyriina/.antigen/bundles/chrissicool/zsh-256color /home/cyriina/.antigen/bundles/kiurchv/asdf.plugin.zsh /home/cyriina/.antigen/bundles/Tarrasch/zsh-autoenv /home/cyriina/.antigen/bundles/MichaelAquilina/zsh-autoswitch-virtualenv /home/cyriina/.antigen/bundles/unixorn/autoupdate-antigen.zshplugin /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/bower /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colorize /home/cyriina/.antigen/bundles/ptavares/zsh-direnv /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/django /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker-compose /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker-machine /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/dotenv /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/emoji /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/gulp /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/heroku /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/node /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/npm /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/nvm /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/postgres /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pyenv /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/python /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/screen /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/ssh-agent /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/systemd /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/virtualenv /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/vscode /home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/yarn /home/cyriina/.antigen/bundles/zsh-users/zsh-syntax-highlighting)
_antigen_compinit () {
  autoload -Uz compinit; compinit -i -d "/home/cyriina/.antigen/.zcompdump"; compdef _antigen antigen
  add-zsh-hook -D precmd _antigen_compinit
}
autoload -Uz add-zsh-hook; add-zsh-hook precmd _antigen_compinit
compdef () {}

if [[ -n "/home/cyriina/.oh-my-zsh" ]]; then
  ZSH="/home/cyriina/.oh-my-zsh"; ZSH_CACHE_DIR="/home/cyriina/.oh-my-zsh/cache/"
fi
#--- BUNDLES BEGIN
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/bzr.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/clipboard.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/cli.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/compfix.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/completion.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/correction.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/diagnostics.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/directories.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/functions.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/git.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/grep.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/history.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/key-bindings.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/misc.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/nvm.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/prompt_info_functions.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/spectrum.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/termsupport.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/theme-and-appearance.zsh';
source '/home/cyriina/.antigen/bundles/gretzky/auto-color-ls/auto-color-ls.plugin.zsh';
source '/home/cyriina/.antigen/bundles/chrissicool/zsh-256color/zsh-256color.plugin.zsh';
source '/home/cyriina/.antigen/bundles/kiurchv/asdf.plugin.zsh/asdf.plugin.zsh';
source '/home/cyriina/.antigen/bundles/Tarrasch/zsh-autoenv/autoenv.plugin.zsh';
source '/home/cyriina/.antigen/bundles/Tarrasch/zsh-autoenv/init.zsh';
source '/home/cyriina/.antigen/bundles/MichaelAquilina/zsh-autoswitch-virtualenv/autoswitch_virtualenv.plugin.zsh';
source '/home/cyriina/.antigen/bundles/unixorn/autoupdate-antigen.zshplugin/autoupdate-antigen.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/bower/bower.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colorize/colorize.plugin.zsh';
source '/home/cyriina/.antigen/bundles/ptavares/zsh-direnv/zsh-direnv.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/django/django.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker-compose/docker-compose.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker-machine/docker-machine.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/dotenv/dotenv.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/emoji/emoji.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/gulp/gulp.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/heroku/heroku.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/node/node.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/npm/npm.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/nvm/nvm.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip/pip.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/postgres/postgres.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pyenv/pyenv.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/python/python.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/screen/screen.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/ssh-agent/ssh-agent.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/systemd/systemd.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/virtualenv/virtualenv.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/vscode/vscode.plugin.zsh';
source '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/yarn/yarn.plugin.zsh';
source '/home/cyriina/.antigen/bundles/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh';

#--- BUNDLES END
typeset -gaU _ANTIGEN_BUNDLE_RECORD; _ANTIGEN_BUNDLE_RECORD=('https://github.com/robbyrussell/oh-my-zsh.git lib plugin true' 'https://github.com/gretzky/auto-color-ls.git / plugin true' 'https://github.com/chrissicool/zsh-256color.git / plugin true' 'https://github.com/kiurchv/asdf.plugin.zsh.git / plugin true' 'https://github.com/Tarrasch/zsh-autoenv.git / plugin true' 'https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git / plugin true' 'https://github.com/unixorn/autoupdate-antigen.zshplugin.git / plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/bower plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/colorize plugin true' 'https://github.com/ptavares/zsh-direnv.git / plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/django plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/docker plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/docker-compose plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/docker-machine plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/dotenv plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/emoji plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/git plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/gulp plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/heroku plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/node plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/npm plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/nvm plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/pip plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/postgres plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/pyenv plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/python plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/screen plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/ssh-agent plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/systemd plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/virtualenv plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/vscode plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/yarn plugin true' 'https://github.com/zsh-users/zsh-syntax-highlighting.git / plugin true')
typeset -g _ANTIGEN_CACHE_LOADED; _ANTIGEN_CACHE_LOADED=true
typeset -ga _ZCACHE_BUNDLE_SOURCE; _ZCACHE_BUNDLE_SOURCE=('/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/bzr.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/clipboard.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/cli.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/compfix.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/completion.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/correction.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/diagnostics.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/directories.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/functions.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/git.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/grep.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/history.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/key-bindings.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/misc.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/nvm.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/prompt_info_functions.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/spectrum.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/termsupport.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/lib/theme-and-appearance.zsh' '/home/cyriina/.antigen/bundles/gretzky/auto-color-ls//' '/home/cyriina/.antigen/bundles/gretzky/auto-color-ls///auto-color-ls.plugin.zsh' '/home/cyriina/.antigen/bundles/chrissicool/zsh-256color//' '/home/cyriina/.antigen/bundles/chrissicool/zsh-256color///zsh-256color.plugin.zsh' '/home/cyriina/.antigen/bundles/kiurchv/asdf.plugin.zsh//' '/home/cyriina/.antigen/bundles/kiurchv/asdf.plugin.zsh///asdf.plugin.zsh' '/home/cyriina/.antigen/bundles/Tarrasch/zsh-autoenv//' '/home/cyriina/.antigen/bundles/Tarrasch/zsh-autoenv///autoenv.plugin.zsh' '/home/cyriina/.antigen/bundles/Tarrasch/zsh-autoenv///init.zsh' '/home/cyriina/.antigen/bundles/MichaelAquilina/zsh-autoswitch-virtualenv//' '/home/cyriina/.antigen/bundles/MichaelAquilina/zsh-autoswitch-virtualenv///autoswitch_virtualenv.plugin.zsh' '/home/cyriina/.antigen/bundles/unixorn/autoupdate-antigen.zshplugin//' '/home/cyriina/.antigen/bundles/unixorn/autoupdate-antigen.zshplugin///autoupdate-antigen.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/bower' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/bower/bower.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colorize' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colorize/colorize.plugin.zsh' '/home/cyriina/.antigen/bundles/ptavares/zsh-direnv//' '/home/cyriina/.antigen/bundles/ptavares/zsh-direnv///zsh-direnv.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/django' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/django/django.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker-compose' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker-compose/docker-compose.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker-machine' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/docker-machine/docker-machine.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/dotenv' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/dotenv/dotenv.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/emoji' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/emoji/emoji.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/gulp' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/gulp/gulp.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/heroku' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/heroku/heroku.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/node' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/node/node.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/npm' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/npm/npm.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/nvm' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/nvm/nvm.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip/pip.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/postgres' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/postgres/postgres.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pyenv' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pyenv/pyenv.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/python' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/python/python.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/screen' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/screen/screen.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/ssh-agent' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/ssh-agent/ssh-agent.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/systemd' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/systemd/systemd.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/virtualenv' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/virtualenv/virtualenv.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/vscode' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/vscode/vscode.plugin.zsh' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/yarn' '/home/cyriina/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/yarn/yarn.plugin.zsh' '/home/cyriina/.antigen/bundles/zsh-users/zsh-syntax-highlighting//' '/home/cyriina/.antigen/bundles/zsh-users/zsh-syntax-highlighting///zsh-syntax-highlighting.plugin.zsh')
typeset -g _ANTIGEN_CACHE_VERSION; _ANTIGEN_CACHE_VERSION='develop'
typeset -g _ANTIGEN_THEME; _ANTIGEN_THEME=''

#-- END ZCACHE GENERATED FILE
