function out = limitPow(in)  
% limitPow limits the motor power.
%   in = suggested input motor power
    limit_value = 70;  % 70 = 70% of motor speed
    if abs(in) < limit_value  % If -limit < in power < limit
        out = in;
    elseif in > limit_value   % If in power > limit
        out = limit_value;
    else                      % If in power is negative and exceeding -70
        out = -limit_value;
    end
end