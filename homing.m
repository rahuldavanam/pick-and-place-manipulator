%% Sets the Robot to homing configuration
disp('---------Homing Started---------');
setMotorPos(motor2,2,40);
setMotorPos(motor1,1,0);
disp('---------Homing Done---------');