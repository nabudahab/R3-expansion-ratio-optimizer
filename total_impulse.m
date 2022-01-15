function [I] = total_impulse(atm_pressure, P_c, A_e, Cf_vac, A_t)   
    Cf = zeros(length(atm_pressure));
    Cf = Cf(1,:);
    F = Cf;
    
    for i = 1:1:length(atm_pressure)
        Cf(i) = Cf_vac - (atm_pressure(i)*A_e)/(P_c*A_t);
        F(i) = Cf(i) * A_t * P_c;
    end
    
    dt = 15; %Using a single atmopshere pressure
    I = 0;
    for i = F
        I = I + i*dt;
    end
end