clear all;
close all;
clc

tspan = [0 3];  
y0 = [0 0];
b=800;

optionVec = odeset('MaxStep', tspan(2)/50, 'AbsTol', 1e-3, 'RelTol', 1e-9);
% optionVec is a vector with parameters for the differential equation
% resolution: MaxStep sets an upper bound on the size of any step taken by
% the solver. AbsTol is a tolerance. This tolerance is a threshold below which
% the value of the solution becomes unimportant.
% RelTol is another tolerance. This tolerance measures the error relative to the 
% magnitude of each solution component

ysim = ode45(@chairx, tspan, y0, optionVec);
ysim2 = ode45(@chairx2, tspan, y0, optionVec);
% ode45 integrates the system of differential equations. tspan is the time
% where it will be integrated, in this case, between 0 and 3 seconds,
% y0 is the initial condition and optionVec are the options that we have define previously.
% @chairx and chairx2 are the differential equations that we have deffined.
% The output is a vector of 2 columns, the time (t) and the solution of the differential 
% equations (y). In our case, the solution (y) is a matrix of 2 rows and the same columns as the time.

figure(1)
plot(ysim.x,ysim.y(1,:),'b',ysim.x,ysim.y(2,:),'r')
title('Office Chair Modelling, position and velocity')
xlabel('Time [s]')
legend('s','v')

figure(2)
plot(ysim2.x,-ysim2.y(1,:),'k', ysim2.x,-b*ysim2.y(2,:),'g')
title('Spring and Damper Force')
xlabel('Time [s]')
ylabel('Newtons')
legend('Spring','Damper')

% In these figures (Figure 1 and Figure 2), a plot of the solution is given. 
% The time is ysim.x, and ysim.y has 2 components, the first row, which in the first 
% plot is the position and in the second plot is the spring force, and the second row,
% which in the first and second plot is the speed.
% So, in the first figure (Figure 1) it is plotted ysim.x, which is the
% time (x axis), -ysim2.y(1,:) and ysim.y(2,:) (y axis), which is the position and speed respectively (First and second row). 
% In the second plot, (Figure 2) it is plotted ysim2.x, which is the time (x axis) and -ysim2.y(1,:) 
% and -b*ysim2.y(2,:) (y axis), which are the spring and damper force respectively. ysim2.y(2,:) is the velocity, 
% so multiplying this by the damper constant gives the damping force.


function dydt2 = chairx2(t,y)
m=93;
k=26000;
b=800;
A = [0 k;-1/m -b/m];
B = [0;1/m];
g=-9.81;
dydt2 = A*y+B*m*g;
end
% This is the function that defines the second differential equation