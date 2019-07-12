function pd = polynomial3_trajectory(pi, pf, ti, tf, t)
 
    pd = pi + ((3*(pf - pi)*(t - ti)^2)/(tf - ti)^2) - ((2*(pf - pi)*(t - ti)^3)/(tf - ti)^3);

end