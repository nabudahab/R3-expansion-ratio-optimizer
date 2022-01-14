function [I] = total_impulse(atm_pressure, chamber_pressure, A_e, Cf_vac, A_t)   
    Cf = zeros(length(atm_pressure));
    Cf = Cf(1,:);
    F = Cf;
    
    for i = 1:1:length(atm_pressure)
        Cf(i) = Cf_vac - atm_pressure(i)*A_e;
        F(i) = Cf(i) * A_t * chamber_pressure;
    end
    
    %Assuming timestep of 0.001 seconds
    dt = 0.001;
    I = 0;
    for i = F
        I = I + i*dt;
    end
end