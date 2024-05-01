function gripper_open(gripper,gripper_speed)
    gripper.Speed = -gripper_speed;
    pos = gripper.readRotation();
    while (pos > -90)
        pos = gripper.readRotation();
    end
    disp(pos);
    gripper.Speed = 0;
end