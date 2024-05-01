function gripper_close(gripper,gripper_speed)
    gripper.Speed = gripper_speed;
    pos = gripper.readRotation();
    while (pos < -20)
        pos = gripper.readRotation();
    end
    disp(pos);
    gripper.Speed = 0;
end
