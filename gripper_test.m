gripperPort = 'A';

gripper = motor(myev3, gripperPort);
gripper.Speed = 20;
pause(2);
gripper.Speed = 0;
gripper.resetRotation();
pos = gripper.readRotation();
disp(pos);
disp('Calibration-----');
pause(3);
disp('open-----');
gripper.Speed = -20;
while (pos > -90)
    pos = gripper.readRotation();
end
disp(pos);
gripper.Speed = 0;

pause(3);
disp('close-----');
gripper.Speed = 20;
while (pos < -10)
    pos = gripper.readRotation();
end
disp(pos);
gripper.Speed = 0;

pause(3);
disp('open-----');
gripper.Speed = -20;
while (pos > -90)
    pos = gripper.readRotation();
end
disp(pos);
gripper.Speed = 0;

