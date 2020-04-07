###############################################################
# drofloh oh-my-zsh theme functions
# https://github.com/drofloh/oh-my-zsh-custom
################################################################

typeset -AHg ICONS

ICONS=(
  # Prompt separators
  flame_right        $'\ue0c0' # 
  flame_left         $'\ue0c2' # 
#  terminal           $'\u21b3' # ↳
  terminal           $'\u2b91' # ↳
  tarrow             $'\u279c' # ⮕
#  arrow              $'\u2b95' # ⮕
  arrow              $'\u27a9' # ⮕

  # OS logos
  apple_logo         $'\uf302' # 

  # directory icon
  folder             $'\ufc6e' # ﱮ

  # battery usage
  battery_full       $'\uf578' # 
  battery_80         $'\uf580' # 
  battery_60         $'\uf57e' # 
  battery_40         $'\uf57c' # 
  battery_20         $'\uf57a' # 
  battery_empty      $'\uf58d' # 
  battery_charging   $'\uf0e7' # 
  battery_plugged_in $'\uf583' # 

  # time / clock icon
  time               $'\uf49b' # 

  # ruby icon
  ruby               $'\ue21e' #  

  # git status icons
#  git_branch         $'\ue0a0' # 
  git_branch         $'\uf418' #  
  git_added          $'\uf457' # 
#  git_added          $'\ufe62' # ﹢
  git_modified       $'\uf459' # 
#  git_modified       $'\ufe12' # ︒
  git_deleted        $'\uf458' # 
#  git_deleted        $'\ufe63' # ﹣
  git_renamed        $'\uf45a' # 
  git_unmerged       $'\ue727' # 
#  git_untracked      $'\uf128' # 
  git_untracked      $'\uf440' # 
#  git_ahead          $'\uf061' # 
  git_ahead          $'\u21e1' # ⇡
#  git_behind         $'\uf060' # 
  git_behind         $'\u21e3' # ⇣
  git_remote_exists  $'\ufadf' # 﫟
  git_remote_missing $'\uf658' # 
)

COLORS=(
  # darkest backgrounds to lightest
  d0_bg	$BG[232]
  d1_bg	$BG[234]
  d2_bg $BG[238]

  # darkest foregrounds to lightest
  d0_fg	$FG[232]
  d1_fg	$FG[234]
  d2_fg	$FG[238]
)

function prompt_separator() {
  echo $ICONS[flame_right]
}

function rprompt_separator() {
  echo $ICONS[flame_left]
}

function prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
    echo "$user@%m "
  fi
}

function prompt_start() {
  local bg_col=%{$BG[232]%}
  local fg_col=%{$FG[232]%}
  
  local ret_status="%(?:%{$fg[green]%} $ICONS[apple_logo] :%{$fg[red]%} $ICONS[apple_logo] )${reset_color}"
  echo "${bg_col}${ret_status}${fg_col}$(prompt_separator)"
}

function prompt_dir() {
  local bg_col=%{$BG[234]%}
  local fg_col=%{$FG[234]%}
  local dir_icon="%{$FG[075]%}  $ICONS[folder] "
  local directory="%{$fg[white]%}%~"

  echo "${bg_col}${fg_col}${dir_icon}${directory}${fg_col}$(prompt_separator)"
}

function prompt_git () {

  local bg_col=$BG[238]
  local fg_col=$FG[238]

  local prompt_git_start="%{$fg_col%}"
  local prompt_git_end="%{$reset_color%}%{$FG[238]%}$(prompt_separator)"
  # https://stackoverflow.com/questions/2180270/check-if-current-directory-is-a-git-repository
  if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then
    echo "%{$bg_col%}${prompt_git_start} %{$fg[blue]%} $(parse_git_dirty) %{$fg[white]%}$(git_current_branch)$(git_prompt_status)$(git_remote_status)$(git_prompt_remote)${prompt_git_end}"
  else
    echo "%{$reset_color%}%{$prompt_git_start%}"
  fi
}

function prompt_battery() {

  battery_perc=$(battery_pct)
  if [ $battery_perc -gt 90 ]; then
    icon=$ICONS[battery_full]
    batt_col=$fg[green]
  elif [ $battery_perc -gt 70 ]; then
    icon=$ICONS[battery_80]
    batt_col=$fg[green]
  elif [ $battery_perc -gt 50 ]; then
    icon=$ICONS[battery_60]
    batt_col=$fg[green]
  elif [ $battery_perc -gt 30 ]; then
    icon=$ICONS[battery_40]
    batt_col=$fg[yellow]
  elif [ $battery_perc -gt 10 ]; then
    icon=$ICONS[battery_20]
    batt_col=$fg[yellow]
  else
    icon=$ICONS[battery_empty]
    batt_col=$fg[red]
  fi

  if $(battery_is_charging) ; then
    if [ $battery_perc -eq 100 ]; then
      power_icon=''
      icon=$ICONS[battery_plugged_in]
      batt_col=$fg[green]
    else
      power_icon="%{$fg[yellow]%}${ICONS[battery_charging]}"
    fi
  fi
  echo "%{$FG[234]%}$(rprompt_separator) %{$BG[234]%} %{$batt_col%}${icon}${power_icon} %{$fg[white]%}${battery_perc}%% %{$reset_color%}"
}

function prompt_time() {
  local time_icon="%{$fg[cyan]%}${ICONS[time]}"
  local the_time="%{$FG[012]%}[%T]"

#  echo "%{$FG[237]%}$(rprompt_separator) %{$BG[237]%} ${time_icon} ${the_time}"
  echo "%{$FG[238]%}$(rprompt_separator) %{$BG[238]%} ${the_time}"
}

function prompt_ruby_rbenv() {
  local ruby_icon="%{$fg[red]%}${ICONS[ruby]}"
  if [ -f .ruby-version ] ; then
    local version="%{$fg[white]%}$(cat .ruby-version)"
    echo "%{$FG[248]%}$(rprompt_separator) %{$BG[248]%} ${ruby_icon} ${version}"
  fi
}
