% Code to output all the relevant parameters of Chuka 
l0 = 165;
l1 = 60;
l2 = 185;
l3 = 110;

theta1 = -90*pi/180;
theta2 = 40*pi/180;
theta3 = -theta2;

DH_prm = [theta1, l0, -l1, pi/2, 0,0;
          theta2, 0, l2, 0, 0, 0;
          theta3, 0, l3, 0, 0, -pi/2];

arm = SerialLink(DH_prm, 'name', 'ChukaRobot');
arm.plot([theta1,theta2,theta3]);
T0_3 = arm.fkine([theta1,theta2,theta3]);
disp("position: ");
disp(T0_3.t);  % .t returns the translational matrix of the FK matrix


[eTh1,eTh2] = chuka_Ikine(T0_3.t(1),T0_3.t(2),T0_3.t(3),l0,l1,l2,l3);
disp("estimated joint angles: ");
disp([eTh1,eTh2]*180/pi);

function [th1,th2] = chuka_Ikine(x0,y0,z0,l0,l1,l2,l3)
    eta = (z0 + l3 - l0)/l2;
    eta_ = sqrt(1-eta^2);
    th2 = atan2(eta,eta_);
    th1 = atan2(y0,x0);
end