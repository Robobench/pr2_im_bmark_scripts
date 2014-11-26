source /opt/ros/groovy/setup.bash
export ROBOT=sim
export QT_GRAPHICSSYSTEM=native
#Kill running stuff
sh ./kill_running.sh
export ROBOT_INITIAL_POSE="-x 25.0 -y 15"
#Launch gazebo sim
roslaunch wg_collada_world.launch &
sleep 20

roslaunch pr2_gazebo pr2.launch &

sleep 20

#Launch im backend without navigation
roslaunch pr2_interactive_manipulation pr2_interactive_manipulation_robot.launch sim:=true nav:=true &
sleep 20


rosrun map_server map_server ./maps/willowMap2_50mm.yaml &

#Launch im frontend
roslaunch pr2_interactive_manipulation_frontend pr2_interactive_manipulation_desktop.launch sim:=true nav:=true rviz_config_file_base:=$PWD/pr2_im_gazebo.rviz &

#Put robot in initial pose:
rostopic pub /initialpose geometry_msgs/PoseWithCovarianceStamped -f ./initial_pose.yml




