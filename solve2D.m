syms x1 x2 x3 x4 y1 y2 y3 y4 real

eq1 = 'x1 = 4';
eq2 = 'y1 = 0';
eq3 = 'x2 = 6.5';
eq4 = 'y2 = 5.3';
eq5 = 'sqrt((x1-x3)^2 + (y1-y3)^2) = 17.74';
eq6 = 'sqrt((x2-x4)^2 + (y2-y4)^2) = 13.73';
eq7 = 'sqrt((x3-x4)^2 + (y3-y4)^2) = 7.773';
% eq8 = 'y3 = -.5';

[x1 x2 x3 x4 y1 y2 y4] = solve(eq1, eq2, eq3, eq4, eq5, eq6, eq7,...
    x1, x2, x3, x4, y1, y2, y4);


yset = linspace(-1,1,50);
solset = zeros(8, length(yset));
n = 3;
for i=1:length(yset)
    y3 = yset(i);
    x1v = eval(x1);
    x2v = eval(x2);
    x3v = eval(x3);
    x4v = eval(x4);
    y1v = eval(y1);
    y2v = eval(y2);
    y4v = eval(y4);
    solset(:,i) = [x1v(n), x2v(n), x3v(n), x4v(n), ...
        y1v(n), y2v(n), y3, y4v(n)];
end

figure(1)
plot(solset(1,:),solset(5,:),'o')
hold on
plot(solset(2,:),solset(6,:),'ro')
plot(solset(3,:),solset(7,:),'g')
plot(solset(4,:),solset(8,:),'r')
x1 = solset(1,:)';
x2 = solset(2,:)';
x3 = solset(3,:)';
x4 = solset(4,:)';
y1 = solset(5,:)';
y2 = solset(6,:)';
y3 = solset(7,:)';
y4 = solset(8,:)';

p1 = [x1-x3, y1-y3];
p4 = [x4-x3, y4-y3];
magp1 = (p1(:,1).^2 + p1(:,2).^2).^0.5;
magp4 = (p4(:,1).^2 + p4(:,2).^2).^0.5;
vert = [0,1];
pdot = (p4(:,1).*vert(:,1)+p4(:,2).*vert(:,2))./magp4;
camber = acosd(pdot);

figure(2)
plot(solset(7,:),camber)



% for b = 1:length(x3)
% yset = linspace(0,1,100);
% xout = zeros(b,length(yset));
% for i = 1:length(yset)
%     y3 = yset(i);
%     xval = eval(x3);
%     xout(i) = xval(1);
% end
% 
% plot(xout, yset)
% hold on 
% 
% end