SPACESHIP_PROMPT_ORDER=(
  conda
  venv
  host
  time          # Time stampts section
  user          # Username section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  exec_time     # Execution time
  exit_code
  line_sep      # Line break
 #  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  char          # Prompt character
)

SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
# SPACESHIP_PROMPT_DEFAULT_PREFIX=$'╾╼['
SPACESHIP_PROMPT_DEFAULT_SUFFIX=' '

SPACESHIP_DIR_PREFIX=$'📁 '
SPACESHIP_DIR_SUFFIX=' '

SPACESHIP_TIME_SHOW=false
SPACESHIP_TIME_PREFIX=$'🕰️ '
SPACESHIP_TIME_FORMAT='%t'
# SPACESHIP_TIME_SUFFIX=' '

SPACESHIP_USER_SHOW=false
SPACESHIP_USER_PREFIX=$'🐶 '
# SPACESHIP_USER_SUFFIX=' '

SPACESHIP_HOST_SHOW='always'
SPACESHIP_HOST_PREFIX=$'🖥️  '

SPACESHIP_EXIT_CODE_SYMBOL=' '

SPACESHIP_VENV_PREFIX=$'🌍 '
SPACESHIP_VENV_SUFFIX=' '

SPACESHIP_CONDA_PREFIX=$'🌔 '
SPACESHIP_CONDA_SYMBOL=''
SPACESHIP_CONDA_SUFFIX=' '
