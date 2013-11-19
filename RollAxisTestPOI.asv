%test
solution = ans
z =  solution.KnuckleUpper(3); % Z OUTPUT OF SOLVED SIMULATION
syms UFx USx UFy USy UFz USz LFx LSx LFy LSy LFz LSz Ycross Xcross Zcross WPx WPy WPz CenterX CenterY CenterZ
%% UPPER A ARM
UFxeq = ['UFx = ', num2str(solution.FrontUpper(1))];
USxeq = ['USx = ', num2str(solution.KnuckleUpper(1))]; %OUTPUT OF SOLVE3D

UFyeq = ['UFy = ' , num2str(solution.FrontUpper(2))];
USyeq = ['USy = ' , num2str(solution.KnuckleUpper(2))]; %OUTPUT OF SOLVE3D

UFzeq = 'UFz = z'; % Z VALUE OF SOLVE3D
USzeq = 'USz = z';
%% Lower A ARM
LFxeq = ['LFx = ' , num2str(solution.FrontLower(1))];
LSxeq = ['LSx = ' , num2str(solution.KnuckleLower(1))]; %OUTPUT OF SOLVE3D

LFyeq = ['LFy = ' , num2str(solution.FrontLower(2))];
LSyeq = ['LSy = ' , num2str(solution.KnuckleLower(2))]; %OUTPUT OF SOLVE3D

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

 WheelDisplacement = 4;
    WheelRadius = 10;
WPxeq = 'WPx = (USx + LSx)/2 + WheelDisplacement'; %INPUT OF STEERING
WPyeq = 'WPy = (USy + LSy)/2 -WheelRadius';  %INPUT OF STEERING
WPzeq = 'WPz = (USz + LSz)/2 ';  %INPUT OF STEERING
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
WPZ = eval(WPz);

%MAKE THIS SCRIPT A FUNCTION TAKING A-ARM POSITIONS, AND STEERING OUTPUTS
%AS INPUTS AND RETURNS AN X Y AND Z VALUE OF THE ROLL AXIS 