#!/bin/bash
timeout_duration="60m"

timeout "$timeout_duration" bash /usr/local/bin/update-instance.sh
exit_code=$?

if [ "$exit_code" -eq 0 ]; then
    echo "Script executed successfully."
elif [ "$exit_code" -eq 124 ]; then
    echo "Script execution timed out after $timeout_duration."
else
    echo "Script execution failed with exit code $exit_code."
fi

exit "$exit_code"
