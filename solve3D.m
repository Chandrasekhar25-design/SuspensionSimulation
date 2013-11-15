function res = solve3D(xtra, ylkval, varargin)
tic
%%Create Symbolic Variables Defining All Points
% syms xua1 yua1 zua1 xua2 yua2 zua2 xuk yuk zuk xla1 yla1 zla1 xla2 yla2 zla2 ...
%     xlk ylk zlk xtr ytr ztr xtk ytk ztk 
holdxtr = xtra;
holdylkval = ylkval;
xua1 = sym('xua1'); yua1 = sym('yua1'); zua1 = sym('zua1');
xua2 = sym('xua2'); yua2 = sym('yua2'); zua2 = sym('zua2');
xuk = sym('xuk','real'); yuk = sym('yuk','real'); zuk = sym('zuk','real');
xla1 = sym('xla1'); yla1 = sym('yla1'); zla1 = sym('zla1');
xla2 = sym('xla2'); yla2 = sym('yla2'); zla2 = sym('zla2');
xlk = sym('xlk','real'); ylk = sym('ylk','real'); zlk = sym('zlk','real'); 
xtr = sym('xtr'); ytr = sym('ytr'); ztr = sym('ztr');
xtk = sym('xtk','real'); ytk = sym('ytk','real'); ztk = sym('ztk','real');

%% Define Fixed Points
%Upper A-arm mounting points
xua1 = 6.5; yua1 = 5.3; zua1 = 0;   %Upper arm front mount
xua2 = 6.5; yua2 = 5.3; zua2 = 10;   %Upper arm rear mount

%Lower A-arm mounting points
xla1 = 4; yla1 = 0; zla1 = 0;   %Lower arm front mount
xla2 = 4; yla2 = 0; zla2 = 10;   %Lower arm rear mount

%Tie rod z and y restrictions
ytr = 1.25; ztr = 4.5;

%Input vertical displacement of lower A-arm knuckle attachment
ylkval = holdylkval;
eq1 = ['ylk = ', num2str(ylkval)];

%Input lateral displacement of tie rod
xtr = holdxtr;

%% Define Length Constraints
%Define Length Values
l1 = 14; l2 = 15; l3 = 17; l4 = 18; l5 = 7.5; l6 = 4.5; l7 = 5.5; l8 = 14.5;

%Upper arm distance from mounts to knuckle
len1 = (xua1-xuk)^2 + (yua1-yuk)^2 + (zua1-zuk)^2 - l1^2;  %Upper front distance
len2 = (xua2-xuk)^2 + (yua2-yuk)^2 + (zua2-zuk)^2 - l2^2;  %Upper rear distance

%Lower arm distance from mounts to knuckle
len3 = (xla1-xlk)^2 + (yla1-ylk)^2 + (zla1-zlk)^2 - l3^2;  %Lower front distance
len4 = (xla2-xlk)^2 + (yla2-ylk)^2 + (zla2-zlk)^2 - l4^2;  %Lower rear distance

%Knuckle Distances
len5 = (xuk-xlk)^2 + (yuk-ylk)^2 + (zuk-zlk)^2 - l5^2; %Upper to lower arm mount
len6 = (xuk-xtk)^2 + (yuk-ytk)^2 + (zuk-ztk)^2 - l6^2; %Upper to tie rod mount
len7 = (xlk-xtk)^2 + (ylk-ytk)^2 + (zlk-ztk)^2 - l7^2; %Lower to tie rod mount

%Tie rod to knuckle Length
len8 = (xtr-xtk)^2 + (ytr-ytk)^2 + (ztr-ztk)^2 - l8^2; %Tie rod end to knuckle

%% Accept User Values
if length(varargin) >= 1
    for k = 1:length(varargin)
        try
            eval(varargin{k});
        catch except
            disp(except)
            disp('User Input Generated Error')
        end
    end
end
%% Solve the system
%Solve the lower A-arm
% len3 = eval(len3)
% len4 = eval(len4)
% len5 = eval(len5)
[xlk, ylk, zlk] = solve(len3, len4, eq1, xlk, ylk, zlk);
xlk = eval(xlk);
ylk = eval(ylk);
zlk = eval(zlk);

% a = l3;
% b = l4;
% c = zla2-zla1;
% 
% A = acosd((b^2 + c^2 - a^2)/2/b/c);
% long = b*sind(A);
% short = b*cosd(A);
% 
% phi = asind(ylkval/long);
% x = cosd(phi)*long;
% y = ylkval;
% z = zla2 - short;
% 
% xlk = x;
% ylk = y;
% zlk = z;

%FILTER RESULT
filterResult1
    function filterResult1
        rem = [];
        for i = 1:length(xlk)
            if xlk(i) ~= abs(xlk)
               
                rem = [rem,i];
            end
        end
        xlk(rem) = []; ylk(rem) = []; zlk(rem) = [];
        
    end


%Solve the upper A-arm
[xuk, yuk, zuk] = solve(len1, len2, len5, xuk, yuk, zuk);
xuk = eval(xuk);
yuk = eval(yuk);
zuk = eval(zuk);

%FILTER RESULT
filterResult2
    function filterResult2
        if yuk(1) > yuk(2)
            rem = 2;
        elseif yuk(2) > yuk(1)
            rem = 1;
        else
            disp('Results filter failed after upper A-arm')
        end
        xuk(rem) = []; yuk(rem) = []; zuk(rem) = [];
    end
% line([xua1, xuk, xua2], [zua1, zuk, zua2], [yua1, yuk, yua2])
% line([xla1, xlk, xla2], [zla1, zlk, zla2], [yla1, ylk, yla2])
% line([xuk, xlk], [zuk, zlk], [yuk, ylk])
%Solve the steering rod
[xtk,ytk,ztk] = solve(len6, len7, len8, xtk, ytk,ztk);
% xtk = eval(xtk);
% ytk = eval(ytk);
% solve(
xtk = eval(xtk);
ytk = eval(ytk);
ztk = eval(ztk);
toc
% hold on
% 
%     function res = func8(apple)
%         ztk = apple;
%         rese = eval(len8(1));
% %         plot(real(rese),imag(rese),'ro')
%         plot(ytk, real(rese),'o')
%       
%         res = real(rese);
%     end
% % 
% ztk = fzero(@func8, 0)


% ztk = eval(ztk)
% filterResult3


% eval(xtk)
% [xtk, ytk, ztk] = solve(len6, len7, len8, xtk, ytk, ztk);
% xtk
% ytk
% ztk
% toc



%FILTER RESULT
filterResult3
    function filterResult3
        if ztk(1) > ztk(2)
            rem = 2;
        elseif ztk(2) > ztk(1)
            rem = 1;
        else
            disp('Results Filter Failed After Steering Rod')
        end
        xtk(rem) = []; ytk(rem) = []; ztk(rem) = [];
    end

% xtk = eval(xtk)
% ytk = eval(ytk)

% filterResult4
%     function filterResult4
%         valid1 = (xtr-xtk(1))^2 + (ytr-ytk(1))^2 + (ztr-ztk)^2 - l8^2;
%         valid2 = (xtr-xtk(2))^2 + (ytr-ytk(2))^2 + (ztr-ztk)^2 - l8^2; 
%         if valid1>valid2 && valid2 < .1
%             xtk = xtk(2);
%             ytk = ytk(2);
%         elseif valid1<valid2 && valid1 < .1
%             xtk = xtk(1);
%             ytk = ytk(1);
%         else
%             disp('Results Filter Failed After Steering Rod')
%         end
%     end

%% Draw Some Stuff
% figure(2)
line([xua1, xuk, xua2], [zua1, zuk, zua2], [yua1, yuk, yua2])
line([xla1, xlk, xla2], [zla1, zlk, zla2], [yla1, ylk, yla2])
line([xuk, xlk, xtk, xuk], [zuk, zlk, ztk, zuk], [yuk, ylk, ytk, yuk])
line([xtk, xtr], [ztk, ztr], [ytk, ytr])
valid = (xtr-xtk)^2 + (ytr-ytk)^2 + (ztr-ztk)^2 - l8^2


a = get(gca, 'XLim');
b = get(gca, 'YLim');
c = get(gca, 'ZLim');

dims = [min([a(1), b(1), c(1)]), max([a(2), b(2), c(2)])];
set(gca, 'XLim', dims, 'YLim', dims, 'ZLim', dims)


%% Create Structure For Output
finalStruct = struct;
finalStruct.FrontUpper = [xua1, yua1, zua1];
finalStruct.RearUpper = [xua2, yua2, zua2];
finalStruct.FrontLower = [xla1, yla1, zla1];
finalStruct.RearLower = [xla2, yla2, zla2];
finalStruct.KnuckleUpper = [xuk, yuk, zuk];
finalStruct.KnuckleLower = [xlk, ylk, zlk];
finalStruct.TieRod = [xtr, ytr, ztr];
finalStruct.KnuckleTie = [xtk, ytk, ztk];
toc
res = finalStruct;
end
