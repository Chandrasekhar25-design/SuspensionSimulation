%plotting

%  UFX = eval(UFx);
%  USX = eval(USx);
%  UFY = eval(UFy);
%  USY = eval(USy);
%  LFX = eval(LFx);
%  LSX = eval(LSx);
%  LFY = eval(LFy);
%  LSY = eval(LSy);
% YCROSS = eval(Yout);
% XCROSS = eval(Xinp);

hold on
plot(UFX,UFY,'o','MarkerSize',8);
plot(USX,USY,'o','MarkerSize',8);
plot(LFX,LFY,'o','MarkerSize',8);
plot(LSX,LSY,'o','MarkerSize',8);
plot(XCROSS,YCROSS,'ro','MarkerSize',18);
plot(CENTERX,CENTERY,'ro','MarkerSize',8);
plot(WPX,WPY,'ro','MarkerSize',8);
axis([-5 28 -5 20])