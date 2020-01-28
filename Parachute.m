% Cd = 0.6; 
% rho = 0.0765;
% A = 4; %to spite declan
% Vx = ((2*D*cos(theta))/(Cd*rho*A))^(1/2);
% Vy = ((2*D*sin(theta))/(Cd*rho*A))^(1/2);
% theta = arctan(Vy/Vx);
% 
% V = (Vx^2+Vy^2)^(1/2);
% D=0.5*rho*V^2*A*Cd;
% 
% dt = 0.01;
% 
% Vx = 10;
% Vy = 0;
% h = 100;
% 
% y(1) = 100;
% x(1) = 0;
% int i = 2;
% while(h >= 0)
%     V = (Vx^2+Vy^2)^(1/2);
%     D=0.5*rho*V^2*A*Cd;
% 
% end
clear all;

Cd = 0.6;
A = 4;
m = 1/32; %slug
rho = 0.0023769;
CD = 1/2*rho*Cd*A;
g = 32.2;
dt = .01;

y(1) = 100;
x(1) = 0;
vx(1) = 15;
vy(1) = 0;
vw(1) = 10;
v(1) = (vx(1)^2+vy(1)^2)^(1/2);
ax(1) = CD/m*(vw(1)^2-vx(1)*v(1));
ay(1) = CD*vy(1)*v(1)/m-g;

i = 2;
while(y(i-1) > 0)
    vw(i) = vw(i-1);
    x(i) = x(i-1) + vx(i-1)*dt;
    y(i) = y(i-1) + vy(i-1)*dt;
    vx(i) = vx(i-1) + ax(i-1)*dt;
    vy(i) = vy(i-1) + ay(i-1)*dt;
    v(i) = (vx(i)^2+vy(i)^2)^(1/2);
    ax(i) = CD/m*(vw(i)^2-vx(i)*v(i));
    ay(i) = CD*vy(i)*v(i)/m-g;
    i = i +1;
end

results = [x' y' vx' vy' v' ax' ay' vw'];
figure;
subplot(2,1,1);
plot(x, y);
xlabel('x');
ylabel('y');
title("height vs distance");
subplot(2,1,2);
plot(y);
title("height vs time");
xlabel('t x10^2');
ylabel('y');
