###################### HELP HEADER #################################


function display_help() {
  echo "Usage: $0 <Task.sh> [wait_time] [max_executions]"
  echo -e "\nParameters:"
  echo "  Task.sh: Path to the Task.sh File"
  echo "  wait_time: Time to wait between executions. Default 0 seconds."
  echo "  max_executions: Maximum number of times to execute the command. Default infinite loop."

  echo -e "\nExample:"
  echo "Usage: $0 ./Task.sh 10 4"

  exit 1
}

if [[ "$1" == "-h" || "$1" == "-help" || "$1" == "--help" ]]; then
  display_help
fi


###################### CODE #########################################


if [ -z "$1" ]; then
  echo "Please specify the executable path."
  exit 1
fi

WAIT_TIME=${2:-0}
MAX_EXECUTIONS=${3:-0}

if [ ! -x "$1" ]; then
  echo "File not executable or not found."
  exit 1
fi

EXECUTION_COUNT=0

while [[ 0 == $MAX_EXECUTIONS ]] || [[ $EXECUTION_COUNT < $MAX_EXECUTIONS ]]; do
  "$1"
  echo "Executed. Waiting $WAIT_TIME seconds..."
  
  sleep $WAIT_TIME

  ((EXECUTION_COUNT++))
done
