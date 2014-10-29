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

<h1>TODOS</h1>
<h2> Fix Kinect simulation </h2>
The "Kinect" plugin expects a 16 bit or floating point depth image. The Gazebo kinect plugin generates an 8 bit depth image. To fix this, either a custom
PR2 description package will be needed, or a conversion node that just reencodes the image. 

<h2> Fix Gazebo worlds </h2>
Most of the worlds in the gazebo_worlds package of ros-groovy are obsolete. They need to be replaced.

<h2> Navigation demo missing </h2>
The navigation demo doesn't work because there are no working world files with corresponding maps. To fix this, we either need a working world file with a reasonable layout.
The old Willow Garage world file doesn't work - The one based on extruding the map file may also not work in this version of Gazebo. The equivalent Collada file could be used in a simple implementation, but doesn't perfectly correspond to the willow map available. Either a new map needs to be generated, or a corresponding world file. 

<h1> Automate pipeline </h1>
Some parts of the pipeline are fairly easy to automate - Any interaction mediated through clicking on an interactive manipulation marker in RVIZ can be recorded and played back. However, the signal to segment the scene generates a service call which cannot be recorded, so a separate script will need to be written. 



