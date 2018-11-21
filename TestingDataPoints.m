% Script to calculate interpolants for given data sets
% Clear screen and variables
clear, clc;

%% Test ��: f(x) = exp(x^2), x ��[0.6,1]; 5 equally spaced points:
st = 0.6;
et = 1;
num_points = 5;
dt = (et - st) / (num_points - 1);

t = st:dt:et;
f = exp( t.^2 );

x = [ t' f' ];
f1_vandermonde = Vandermonde_Interpolation(x);
f1_lagrange = Lagrange_Interpolation(x);
f1_newton = Newton_Interpolation(x);

figure;
subplot(231);
plot(t, f, 'ko');
hold on;
fplot(f1_vandermonde, [st,et], 'b');
hold off;
title('Vandermonde polynomial for f(x) = exp(x^2)');
xlabel('x');
ylabel('y');

subplot(232);
plot(t, f, 'ko');
hold on;
fplot(f1_lagrange, [st,et], 'g');
hold off;
title('Lagrange polynomial for f(x) = exp(x^2)');
xlabel('x');
ylabel('y');

subplot(233);
plot(t, f, 'ko');
hold on;
fplot(f1_newton, [st,et], 'r');
hold off;
title('Newton polynomial for f(x) = exp(x^2)');
xlabel('x');
ylabel('y');

%% Test ��: f(x) = 1/(1+12*x^2), x ��[-1,1]; 15 equally spaced points:
st = -1;
et = 1;
num_points = 15;
dt = (et - st) / (num_points - 1);

t = st:dt:et;
f = 1 ./ ( 1 + 12 .* t .^2 );

x = [ t' f' ];

f2_vandermonde = Vandermonde_Interpolation(x);
f2_lagrange = Lagrange_Interpolation(x);
f2_newton = Newton_Interpolation(x);

figure;
subplot(231);
plot(t, f, 'ko');
hold on;
fplot(f2_vandermonde, [st,et], 'b');
hold off;
title('Vandermonde polynomial for f(x) = 1/(1+12*x^2)');
xlabel('x');
ylabel('y');

subplot(232);
plot(t, f, 'ko');
hold on;
fplot(f2_lagrange, [st,et], 'g');
hold off;
title('Lagrange polynomial for f(x) = 1/(1+12*x^2)');
xlabel('x');
ylabel('y');

subplot(233);
plot(t, f, 'ko');
hold on;
fplot(f2_newton, [st,et], 'r');
hold off;
title('Newton polynomial for f(x) = 1/(1+12*x^2)');
xlabel('x');
ylabel('y');

%% Test ��Data points are given specifically:
st = 1994;
et = 2003;
x = [ 1994 67.501; 1995 68.008; 
      1996 69.803; 1997 72.024; 
      1998 73.400; 1999 72.063; 
      2000 74.669; 2001 74.487; 
      2002 74.065; 2003 76.777 ];

f3_vandermonde = Vandermonde_Interpolation(x);
f3_lagrange = Lagrange_Interpolation(x);
f3_newton = Newton_Interpolation(x);

figure;
subplot(231);
plot(x(:,1), x(:,2), 'ko');
hold on;
fplot(f3_vandermonde, [st,et], 'b');
hold off;
title('Vandermonde polynomial for f3');
xlabel('x');
ylabel('y');

subplot(232);
plot(x(:,1), x(:,2), 'ko');
hold on;
fplot(f3_lagrange, [st,et], 'g');
hold off;
title('Lagrange polynomial for f3');
xlabel('x');
ylabel('y');

subplot(233);
plot(x(:,1), x(:,2), 'ko');
hold on;
fplot(f3_newton, [st,et], 'r');
hold off;
title('Newton polynomial for f3');
xlabel('x');
ylabel('y');