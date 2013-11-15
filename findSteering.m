function res = findSteering()%sol)
    P0 = [1.0233 1.4085 0.5000]%sol.KnuckleUpper;
    P1 = [1.0836 0.2000 0.5000]%sol.KnuckleLower;
    V0 = [1.2411 0.8136 -0.5309]%sol.KnuckleTie;
    n = [0,1,0];
    u = P1-P0;
    w = P0-V0;
    tI = (-dot(n,w))/(dot(n,u));
    Vint = P0 + (tI.*u);
    Vtire = [Vint(1)-V0(1),Vint(2)-V0(2),Vint(3)-V0(3)];
    ntire = norm(Vtire);
    Vntire = (Vtire)./(norm(Vtire));
    Vz = [0,0,1];
    dprod = dot(Vntire,Vz);
    res = acosd(dprod);
end