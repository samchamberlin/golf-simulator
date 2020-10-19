%Equations of Motion

function [out] = eom(t, xvec)

r = .02135; %radius of ball (m)
m = .0459; %mass (kg)
g = 9.81; %gravity (m/s^2)
p = 1.225; %density of air (kg/m^3)
A = pi*r^2; %cross-sectional area of ball (m^2)
Cd = 0.3; %coefficient of drag

x = xvec(1);
y = xvec(2);
z = xvec(3);
Vrx = xvec(4);
Vry = xvec(5);
Vrz = xvec(6);
Vwx = xvec(7);
Vwy = xvec(8);
Vwz = xvec(9);
Wx = xvec(10);
Wy = xvec(11);
Wz = xvec(12);

C1 = (-Cd*p*A)/(2*m);
C2 = (r*p*A)/(2*m);

xdot = Vrx + Vwx;
ydot = Vry + Vwy;
zdot = Vrz + Vwz;
x2dot = C1*Vrx*abs(Vrx) + C2*(Wy*Vrz - Wz*Vry);
y2dot = -g + C1*Vry*abs(Vry) + C2*(Wz*Vrx - Wx*Vrz);
z2dot = C1*Vrz*abs(Vrz) + C2*(Wx*Vry - Wy*Vrx);
Vwxdot = 0;
Vwydot = 0;
Vwzdot = 0;
Wxdot = 0;
Wydot = 0;
Wzdot = 0;

%outputs
out = [xdot, ydot, zdot, x2dot, y2dot, z2dot, Vwxdot, Vwydot, Vwzdot, Wxdot, Wydot, Wzdot]';