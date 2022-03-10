#!/bin/sh

event="$1"
directory="$2"
file="$3"

update_catalog() {
  echo "Updating the Sensu Catalog..."
  echo ""
  sh /docker-entrypoint.d/01-publish-sensu-catalog.sh
  echo ""
  echo "Finished updating the Sensu Catalog."
}

# run some command based on an event
case "$event" in
  n) 
    echo "${directory}/${file} was created"
    update_catalog
    ;;
  c) 
    echo "${directory}/${file} was modified"
    update_catalog
    ;;
  *) 
    echo "Nothing to do (event: $event, directory: $directory, file: $file)."
    ;;
esac