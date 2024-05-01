%% Actuators touch the limit switches and motor encoders reset to zero.
disp('-------------Calibration Started----------');
motor_speed_calib = 20;  % motor speed during calibration - motor moves till it touches the sensor

pressed1 = readTouch(touchsensor1);
pressed2 = readTouch(touchsensor2);

%% Calibrating Motor 2
start(motor2);
motor2.Speed = -motor_speed_calib;
while (pressed2 == 0)
    pressed2 = readTouch(touchsensor2);
end
motor2.Speed = 0;  % stop the motor
motor2.resetRotation(); % reset the motor position
fprintf('Motor2 pos after reset: %d\n',motor2.readRotation());
beep(chuka_robot,1);

%% Wait for joint2 to stable

pause(2);

%% Calibrating Motor 1
start(motor1);
motor1.Speed = motor_speed_calib;
while (pressed1 == 0)
    pressed1 = readTouch(touchsensor1);
end
motor1.Speed = 0;  % stop the motor
motor1.resetRotation(); % reset the motor position
fprintf('Motor1 pos after reset: %d\n',motor1.readRotation());
beep(chuka_robot,1);

%% Wait for joint1 to stable
pause(2);

%% Calibrating gripper
start(gripper);
gripper.Speed = 20;
tstart = tic;
while toc(tstart) < 3
  gripper.Speed = 20; 
end
gripper.Speed = 0;
gripper.resetRotation();
pos = gripper.readRotation();
% fprintf('gripper pos: %d\n',pos);
disp('--------------Calibration Done------------');
