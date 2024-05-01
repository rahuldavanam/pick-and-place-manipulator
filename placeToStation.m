function placeToStation(motor1,motor2,gripper,gripper_speed,height_sensor,station)
% placeToStation Takes the station coordinates as argument and places the ball there
    l0 = 165; % link lengths in mm
    l1 = 60;
    l2 = 185;
    l3 = 110;

    Hmax =174; % max height of the gripper (from forward kinematics) 
    offset = 51; % distance between sensor and gripper (by measurement)
    Ho = Hmax + offset;
    Xp = station(1); Yp = station(2);                % Takes the X and Y coordinate of station
    des_theta1 = atan2(Yp,Xp)*180/pi;  % in degrees  % Calculates inverse kinematics for motor1
    setMotorPos(motor1,1,des_theta1);

    pause(3); % let the joint1 to stable

    h = readDistance(height_sensor)*1000;  
    Zp = Ho - h;
    fprintf('h = %d, Zp = %d\n',h,Zp);
    eta = (Zp +l3-l0)/l2;
    eta_ = sqrt(1-eta^2);
    des_theta2 = atan2(eta,eta_)*180/pi; % in degrees  % Calculates inverse kinematics for motor2
    fprintf('des_theta2 = %d\n',des_theta2);
    setMotorPos(motor2,2,des_theta2);
    pause(3);
    gripper_open(gripper,gripper_speed);
    pause(3);
    setMotorPos(motor2,2,39); % check this
end

