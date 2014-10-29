#/bin/sh
ps aux | grep [r]os | awk '{print $2}' | xargs kill
ps aux | grep [p]ython | awk '{print $2}' | xargs kill



