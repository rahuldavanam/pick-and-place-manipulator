function setMotorPos(motor_obj, motor_no, des_angle)
% setMotorPos sets the motor to desired angle (software)
%   motor_obj = Motor object, motor1 or motor2
%   motor_no = Which motor to move 1 or 2. Sets the controller gains
%   accordingly
%   des_angle = target software angle

    if (motor_no == 1)
        KP = 0.3; KI = 0.002; KD = 5; % PID controller gains for motor 1
        GR_joint = 3; % gear ratio of joint 1
        des_pos = motor1_map(des_angle)*GR_joint;
        hold_power = 0;
    else
        KP = 0.2; KI = 0.01; KD = 30; % PID controller gains for motor 2
        GR_joint = 5; % gear ratio of joint 2
        des_pos = motor2_map(des_angle)*GR_joint;
        hold_power = -2;   % Tuned manually to hold the weight of the ball
    end
    

    err_tolarance = 2;  % settling error margin
    
    u_out = 0; 
    er = 0; % current error
    er_prev = 0; % previous error
    er_sum = 0; % error sum
    
    curr_pos = double(readRotation(motor_obj));
    er = des_pos - curr_pos;
    while(abs(er) > err_tolarance)
         curr_pos = double(readRotation(motor_obj));
         er = des_pos - curr_pos;
         er_sum = er_sum + er;
         u_out = KP*er + KI*er_sum + KD*(er - er_prev);
         er_prev = er;
         motor_obj.Speed = limitPow(u_out);  % Limiting motor speed to 70%
         %fprintf('motor: %d, error: %d , power: %d, er_sum: %d, curr_pos: %d \n',motor_no,er,u_out,er_sum,curr_pos/GR_joint);
    end
    motor_obj.Speed = hold_power;
end