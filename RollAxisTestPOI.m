

z = 2; % Z OUTPUT OF SOLVED SIMULATION
syms UFx USx UFy USy UFz USz LFx LSx LFy LSy LFz LSz Ycross Xcross Zcross WPx WPy WPz CenterX CenterY CenterZ
%% UPPER A ARM
UFxeq = 'UFx = 14';
USxeq = 'USx = 17'; %OUTPUT OF SOLVE3D

UFyeq = 'UFy = 9';
USyeq = 'USy = 10'; %OUTPUT OF SOLVE3D

UFzeq = 'UFz = z'; % Z VALUE OF SOLVE3D
USzeq = 'USz = z';
%% Lower A ARM
LFxeq = 'LFx = 14';
LSxeq = 'LSx = 17'; %OUTPUT OF SOLVE3D

LFyeq = 'LFy = 5';
LSyeq = 'LSy = 4'; %OUTPUT OF SOLVE3D

LFzeq = 'LFz = z'; % Z VALUE OF SOLVE3D
LSzeq = 'LSz = z';

%% POINT OF INTERSECTION (A-ARMS)
UpperEq = '((USy-UFy)/(USx-UFx))*Xcross + USy - ((USy-UFy)/(USx-UFx))*USx = Ycross';
LowerEq = '(Ycross - LSy + ((LSy-LFy)/(LSx-LFx))*LSx)/((LSy-LFy)/(LSx-LFx)) = Xcross';
ZcrossEq = 'Zcross = z';
%% SOLVE POINT OF INTERSECTION
[UFx USx UFy USy UFz USz LFx LSx LFy LSy LFz LSz Xcross Ycross Zcross] = solve(UFxeq, USxeq, ...
    UFyeq, USyeq, UFzeq, USzeq, LFxeq, LSxeq, LFyeq, LSyeq,LFzeq, LSzeq, UpperEq, LowerEq,ZcrossEq,...
    UFx, USx, UFy, USy, UFz, USz, LFx, LSx, LFy, LSy, LFz, LSz, Xcross, Ycross, Zcross); 


%% CONVERT
 UFX = eval(UFx);
 USX = eval(USx);
 
 UFY = eval(UFy);
 USY = eval(USy);
 
 UFZ = eval(UFz);
 USZ = eval(USz);
 
 LFX = eval(LFx);
 LSX = eval(LSx);
 
 LFY = eval(LFy);
 LSY = eval(LSy);
 
 LFZ = eval(LFz);
 LSZ = eval(LSz);
 
YCROSS = eval(Ycross);
XCROSS = eval(Xcross);
ZCROSS = eval(Zcross);

%% SOLVE FOR POI WITH CENTERLINE

WPxeq = 'WPx = 18'; %INPUT OF STEERING
WPyeq = 'WPy = 0';  %INPUT OF STEERING
WPzeq = 'WPz = 5';  %INPUT OF STEERING
CenterXeq = 'CenterX = 0';
CenterYeq = '((WPy - Ycross)/(WPx - Xcross))*CenterX + WPy - ((WPy - Ycross)/(WPx - Xcross))*WPx = CenterY';
CenterZeq = '((WPz - Zcross)/(WPx - Xcross))*CenterX + WPz - ((WPz - Zcross)/(WPx - Xcross))*WPx = CenterZ';
[WPx WPy WPz CenterX CenterY CenterZ] = solve(WPxeq, WPyeq,WPzeq, CenterXeq, CenterYeq, CenterZeq,...
    WPx, WPy, WPz, CenterX, CenterY, CenterZ);

CENTERRY = eval(CenterY);
CENTERY = eval(CENTERRY)
CENTERX = eval(CenterX);
CENTERRZ = eval(CenterZ);
CENTERZ = eval(CENTERRZ);

WPX = eval(WPx);
WPY = eval(WPy);

%MAKE THIS SCRIPT A FUNCTION TAKING A-ARM POSITIONS, AND STEERING OUTPUTS
%AS INPUTS AND RETURNS AN X Y AND Z VALUE OF THE ROLL AXIS 