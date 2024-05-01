function hardware_ang = motor1_map(software_ang) 
% motor1_map takes software angles and maps it to hardware values.
    a = 0;  % Hardware angle range - motor angle
    b = -200;

    c = -100;  % Software angle range - joint angle
    d = 100;
    
    hardware_ang = interp1( [c, d],[a, b], software_ang);
end

