function [epsilon] = expansion_ratio_optimizer(atm_pressure, chamber_pressure, A_t, gamma)
    R_e = sqrt(A_t/pi) : 0.01 : 6; %Exit radius runs from throat radius to 6 inches in increments of 0.1 inches
    
    impulse_arr = zeros(length(R_e));
    impulse_arr = impulse_arr(:,1); % Array of zeros for total impulse from given exit radius
    
    for i = 1:length(R_e)
        impulse_arr(i) = total_impulse(atm_pressure, chamber_pressure, pi*R_e^2, A_t, gamma);
    end
    
    plot(R_e, impulse_arr)
    
    [max_impulse, j] = max(impulse_arr);
    
    epsilon = pi*R_e(j)^2; %set epsilon to the optimal exit area
    
    disp("The maximum impulse, %d is achieved by an exit area of %d", max_impulse, epsilon);
end