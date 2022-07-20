function dydt = chairx(t,y)
m=93;                 % Body weight
k=26000;              % Spring constant
b=800;               % Damping constant
% The damping constant has to be modified to satisfy consumer, in this
% case, me. When I sit down I like my chair to go down and cushion my fall,
% so that it just doesn't stop suddendly. I believe most people think the
% office chair they are sitting in will cushion the fall. When it doesn't
% do this, is a weird feeling and a little bit annoying. Once the chair has
% done the task of cushioning the body I like in to bounce a little bit,
% arounf 1.5 seconds. This is also comfortable when sitting, so that the
% chair is not stiff and allows some movement absorb.

A = [0 1;-k/m -b/m];  
B = [0;1/m];
g=-9.81;
dydt = A*y+B*m*g;

% The state space model can be express as a matrix: dydt = A*y+B*m*g, where
% A is a 2 by 2 matrix, B is a 2 by 1 matrix, y is a 2 by 1 matrix and g is
% the acceleration due to the gravity. The value of A and B comes from the
% constitutive equations, where the force of the damper is the constant of
% the damper (b) times the speed, and the force of the spring is
% equal to the constant of the spring (k) times the position. It is known
% that the derivative of the position is the speed, and the sum of all
% forces is mass times acceleration, or mass times the dericative of speed.
% The forces that are acting in this system are, the spring force, the
% damper force, and the force applied when a body sits on the chair. With
% all these information, two differential equation can be formulated, that
% can me expressed in matlab as a matrix combination (dydt = A*y+B*m*g)
% Performing the calculus, we get:
% d(s(t))/dt = v(t) + 0. (equation 1)
% d(v(t))/dt = -k*s(t)/m -b*v(t)/m + g (equation 2)
% Multiplying second equation by m:  d(v(t))/dt * m = -k*s(t)-b*v(t)+g*m
% which is newtons law m*a = ∑F