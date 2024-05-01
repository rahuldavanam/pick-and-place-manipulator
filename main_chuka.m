clear all;
clc;
%% Set-up the environment
init_workspace; % initializes the A, B, C station locations
init_chuka; % initiates the robot
calibration_sequence; % calibrates the motor
gripper_open(gripper,gripper_speed); % opens the gripper before operation
%% Start all tasks in sequence
task6;
task7;
task8;
task9;
task10;
task11;
%%
disp('Task Completed');

