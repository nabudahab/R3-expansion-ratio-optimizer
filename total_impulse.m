function [I] = total_impulse(atm_pressure, P_c, P_e, A_e, A_t, gamma)   
    epsilon = A_e/A_t;
    Cf = zeros(length(atm_pressure));
    Cf = Cf(1,:);
    F = Cf;
    
    for i = 1:1:length(atm_pressure)
        Cf(i) = (2*gamma.^2/(gamma-1)*(2/(gamma+1)).^((gamma+1)/(gamma-1))*(1-(P_e/P_c).^((gamma-1)/gamma))).^(1/2) + (P_e-atm_pressure(i))./P_c.*epsilon;
        F(i) = Cf(i) * A_t * P_c;
    end
    
    dt = 15; %Using a single atmopshere pressure
    I = 0;
    for i = F
        I = I + i*dt;
    end
end
