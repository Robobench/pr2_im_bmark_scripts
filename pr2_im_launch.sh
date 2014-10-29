source /opt/ros/groovy/setup.bash
export ROBOT=sim
export QT_GRAPHICSSYSTEM=native
#Kill running stuff
sh ./kill_running.sh

#Launch gazebo sim
roslaunch pr2_gazebo pr2_table_object.launch &
sleep 20

#Launch im backend without navigation
roslaunch pr2_interactive_manipulation pr2_interactive_manipulation_robot.launch sim:=true &
sleep 20

#Launch im frontend
roslaunch pr2_interactive_manipulation_frontend pr2_interactive_manipulation_desktop.launch sim:=true rviz_config_file_base:=$PWD/pr2_im_gazebo.rviz &
sleep 20
