%% Initializes the Robot
chuka_robot = legoev3('usb');

%% Sensor port numbers
tSen1Port = 1;
tSen2Port = 3;
heightSensorPort = 2;

%% motor port numbers
motor1Port = 'C';
motor2Port = 'B';
gripperPort = 'A';

%% Sensor objects
touchsensor1 = touchSensor(chuka_robot,tSen1Port);
touchsensor2 = touchSensor(chuka_robot,tSen2Port);
height_sensor = sonicSensor(chuka_robot,heightSensorPort);

%% Motor objects
motor1 = motor(chuka_robot, motor1Port);   
motor2 = motor(chuka_robot, motor2Port);
gripper = motor(chuka_robot, gripperPort);

%% Gear ratios
GR_joint1 = 3;
GR_joint2 = 5;

%% Other Parameters
gripper_speed = 20;