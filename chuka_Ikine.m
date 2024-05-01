function [theta1,theta2] = chuka_Ikine(x,y,z)  % Calculates the inverse kinematics
    l0 = 165;
    l1 = 60;
    l2 = 185;
    l3 = 110;
    eta = (z +l3-l0)/l2;
    eta_ = sqrt(1-eta^2);
    theta2 = atan2(eta,eta_)*180/pi; % in degrees
    theta1 = atan2(y,x)*180/pi;
end

