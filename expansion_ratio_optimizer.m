function [epsilon] = expansion_ratio_optimizer(atm_pressure, chamber_pressure, A_t, Cf_vac, diam)
    t_diam = 2*sqrt(A_t)/pi;
    
    arr_impulse = [];
    
    for i = t_diam:0.001:diam
        A_e = pi/4*i^2;
        arr_impulse = [arr_impulse, total_impulse(atm_pressure, chamber_pressure, A_e, Cf_vac, A_t)];
    end
    
    plot(t_diam:0.001:diam, arr_impulse)
    
    diam_array = t_diam:0.001:diam;
    
    [maximum, i] = max(arr_impulse);
    
    epsilon = maximum;
end