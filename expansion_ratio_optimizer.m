%
% function [epsilon] = expansion_ratio_optimizer(atm_pressure, chamber_pressure, A_t, Cf_vac, diam)

   atm_pressure = 7.5;
   chamber_pressure = 250;
   A_t = 4;
   Cf_vac = 1.6;
   max_diam = 10;
   index = 1;

   t_diam = 2*(sqrt(A_t/pi));
    
    arr_impulse = [];
    
    for diam = t_diam:0.01:max_diam
        arr_diam(index) = diam;
        A_e(index) = pi*((diam/2)^2);
        arr_impulse = [arr_impulse, total_impulse(atm_pressure, chamber_pressure, A_e(index), Cf_vac, A_t)];

        index = index + 1;
    end
    
   max_impulse_index = find(max(arr_impulse));

   max_A_e = A_e(max_impulse_index);

   epsilon = max_A_e/A_t;

    plot(t_diam:0.01:diam, arr_impulse)

    disp(epsilon)