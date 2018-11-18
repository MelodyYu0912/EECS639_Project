clear, clc;

% Test ¢ñ: f(x) = exp(x^2), x ¡Ê[0.6,1]; 5 equally spaced points:
syms x;
f(x) = exp(x^2);

xf = zeros(5,2);
xf(:,1) = 0.6:0.1:1;
for i = 1:5
    xf(i,2) = f(xf(i,1));
end

vandermondef = vandermonde(xf);
lagrangef = Lagrange_Interpolation(xf);

% Test ¢ò: f(x) = 1/(1+12*x^2), x ¡Ê[-1,1]; 15 equally spaced points:
syms x;
g(x) = 1/(1+12*x^2);

xg = zeros(15,2);
xg(:,1) = -1:1/7:1;
for i = 1:15
    xg(i,2) = g(xg(i,1));
end

vandermondeg = vandermonde(xg);
lagrangeg = Lagrange_Interpolation(xg);

% Test ¢ó£ºData points are given specifically:
xd = [1994 67.501; 1995 68.008; 1996 69.803; 1997 72.024; 1998 73.400; 1999 72.063; 2000 74.669; 2001 74.487; 2002 74.065; 2003 76.777];

vandermonded = vandermonde(xd);
lagranged = Lagrange_Interpolation(xd);

% ============================================

% Plot of Vandermonde:
subplot(2,3,1);
hold on;
title('Vandermonde polynomial');
xlabel('x');
ylabel('y');
%plot(xf(:,1), xf(:,2), 'k.');
%fplot(vandermondef,[0.6,1],'b');
%plot(xg(:,1), xg(:,2), 'k*');
%fplot(vandermondeg,[-1,1],'r');
plot(xd(:,1), xd(:,2), 'k+');
fplot(vandermonded,[1994,2003],'g');

% Plot of Lagrange 
subplot(2,3,3);
hold on;
title('Lagrange polynomial');
xlabel('x');
ylabel('y');
plot(xf(:,1), xf(:,2), 'k.');
fplot(lagrangef,[0.6,1],'b');
plot(xg(:,1), xg(:,2), 'k*');
fplot(lagrangeg,[-1,1],'r');
%plot(xd(:,1), xd(:,2), 'k+');
%fplot(lagranged,[1994,2003],'g');
