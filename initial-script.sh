#!/bin/bash
timeout_duration="5m"

timeout $timeout_duration bash update-instance.sh &
update_instance=$!

# Wait for the script to finish
wait $update_instance
exit_code=$?

if [ "$exit_code" -eq 0 ]; then
    echo "Script executed successfully."

else
    echo "Script execution failed."

fi