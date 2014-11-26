<h1>Scripts for profiling the PR2 Interactive Manipulation pipeline </h1>

This repository stores some scripts for running and introspecting the PR2 Interactive Manipulation pipeline. 
This pipeline is semi-abandonware. It only runs in ros-groovy, and does not integrate properly with Gazebo anymore.

See the TODOS section for a description of problems.

<h1> Running the IM pipeline </h1>
To start the pipeline, run the pr2_im_launch.sh script. 
When the rviz interface comes up, you will not be able to see the corresponding point cloud, however, it is still possible to run the pipeline.

1. Right click the PR2 head and enable the "look at" control
2. Bring the head down to look at the area around the hands
3. Switch the interactive_manipulation display in the lower right hand corner to the detection/perception plane.
4. Press the segment button. 
5. Wait for the green clusters to appear
6. Right click the cluster on the table and select "pick up with left hand"


To make sure everything dies after running the script, run the kill_running.sh script.

<h1> Running the Navigation demo </h1>
To start the pipeline, run the pr2_im_nav.sh script. 

1. Tuck the PR2 arms by right clicking them, then clicking on tuck arms.
2. Bring up the navigation capability by right clicking on the base of the robot.
3. Click on clear cost map. Redo this until the yellow cost markers on the floor of the rviz simulation are don't appear in the shadow of the arms or right in front of the robot. 
4. Bring up the navigation capability again.
5. Click Navigate to
6. Move the cursor over the base of the robot until the + shaped cursor appears. 
7. Drag the cloned robot to some other position. 
8. Right click on the cloned robot and click "Accept Goal"

<h1> Run Automated Navigation demo </h1>
To start the pipeline, run the pr2_im_nav_automated.sh script. 
This will bring up Gazebo, Rviz, and then begin playing the bag file that runs the IM pipeline. The bag file plays at a preset speed. If the Gazebo GUI client indicates that the realtime factor is slower than the SIM_TIME_RATIO in the pr2_im_nav_automated.sh script, adjust it downwards. 

The script should automatically tuck the robot's arms, then navigate to the small room near the robot.  It should wait until the final result is received before exiting. 


<h1>TODOS</h1>
<h2> Fix Kinect simulation </h2>
The "Kinect" plugin expects a 16 bit or floating point depth image. The Gazebo kinect plugin generates an 8 bit depth image. To fix this, either a custom
PR2 description package will be needed, or a conversion node that just reencodes the image. 

<h2> Fix Gazebo worlds </h2>
Most of the worlds in the gazebo_worlds package of ros-groovy are obsolete. They need to be replaced.

<h2> Navigation demo is slow </h2>
The old Willow Garage world file doesn't work - The one based on extruding the map file may also not work in this version of Gazebo. The world file used here is collada based, and seems to be much slower than the other world file. 


<h1> Automate pipeline </h1>
Some parts of the pipeline are fairly easy to automate - Any interaction mediated through clicking on an interactive manipulation marker in RVIZ can be recorded and played back. However, the signal to segment the scene generates a service call which cannot be recorded, so a separate script will need to be written. 



