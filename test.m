syms xua1 yua1 zua1 xua2 yua2 zua2 xuk yuk zuk xla1 yla1 zla1 xla2 yla2 zla2 ...
    xlk ylk zlk xtr ytr ztr xtk ytk ztk


%Lower A-arm mounting points
xla1 = 0; yla1 = 0; zla1 = 0;   %Lower arm front mount
xla2 = 0; yla2 = 0; zla2 = 1;   %Lower arm rear mount

%Lower arm distance from mounts to knuckle
len3 = 'sqrt((0-xlk)^2 + (0-ylk)^2 + (0-zlk)^2) - 1 = 0';  %Lower front distance
len4 = 'sqrt((0-xlk)^2 + (0-ylk)^2 + (1-zlk)^2) - 1 = 0';  %Lower rear distance

eq1 = 'ylk = 0';

[xlk, ylk, zlk] = solve(len3, len4, eq1, xlk, ylk, zlk);
