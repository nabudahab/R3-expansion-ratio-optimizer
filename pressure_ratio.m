function [p] = pressure_ratio(gamma,expansion_ratio)

    M = 0;
    Mc = 2;

    while abs(Mc - M) > 0.001

    M = Mc;
    f = expansion_ratio - (1/M)*((2+(gamma-1)*M*M)/(gamma+1))^((gamma+1)/(2*gamma-2)) ;
    d = (1/(M^2))*((2+(gamma-1)*M*M)/(gamma+1))^((gamma+1)/(2*gamma-2)) - ((2+(gamma-1)*M*M)/(gamma+1))^(((gamma+1)/(2*gamma-2)) - 1);

    Mc = M - f/d;

    end

    p = (1 + ((gamma - 1)/2)*(Mc^2)) ^ (-gamma / (gamma - 1));


end
