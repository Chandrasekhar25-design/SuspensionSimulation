function res = findSteering(sol)
    P0 = sol.KnuckleUpper;
    P1 = sol.KnuckleLower;
    V0 = sol.KnuckleTie;
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