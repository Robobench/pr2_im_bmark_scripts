#!/bin/bash
bash ./pr2_im_nav.sh

SIM_TIME_RATIO=.1
#Wait for RVIZ to come up
rostopic echo -n 1 /pr2_nav_marker_control/update
echo "Done loading rviz"
#Start playing the bag file
rosbag play -d 10 -r $SIM_TIME_RATIO pr2_im_nav_command.bag &
#Wait for the move-base command to finish
rostopic echo -n 1 /move_base/result

