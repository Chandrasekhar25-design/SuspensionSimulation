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
plot3(UFX,UFY,UFZ,'o','MarkerSize',8);
plot3(USX,USY,USZ,'o','MarkerSize',8);
plot3(LFX,LFY,LFZ,'o','MarkerSize',8);
plot3(LSX,LSY,LSZ,'o','MarkerSize',8);
plot3(XCROSS,YCROSS,ZCROSS,'ro','MarkerSize',18);
plot3(CENTERX,CENTERY,CENTERZ,'ro','MarkerSize',8);
plot3(WPX,WPY,WPZ,'ro','MarkerSize',8);
axis([-10 28 -10 20])