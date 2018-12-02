% Script to calculate interpolants for given data sets
% Clear screen and variables
clear, clc;

%% Test ¢ñ: f(x) = exp(x^2), x ¡Ê[0.6,1]; 5 equally spaced points:
% Defined start and end times to create time values to evaluate function
st = 0.6;
et = 1;
% Number of points to evaluate
num_points = 5;
dt = (et - st) / (num_points - 1);

% Defined time and function values
t = st:dt:et;
f = exp( t.^2 );

% Calculate interpolation methods
x = [ t' f' ];
f1_vandermonde = Vandermonde_Interpolation(x);
f1_lagrange = Lagrange_Interpolation(x);
f1_newton = Newton_Interpolation(x);
f1_natural_spline = Spline_Interpolation("natural", x);
f1_complete_spline = Spline_Interpolation("complete", x);
f1_knot_spline = Spline_Interpolation("not-a-knot", x);

% Plot Vandermonde interpolation
figure;
subplot(231);
% Plot interpolated data points
plot(t, f, 'ko');
hold on;
% Plot Vandermonde interpolation polynomial
fplot(f1_vandermonde, [st,et], 'b');
hold off;
title('Vandermonde polynomial for f(x) = exp(x^2)');
xlabel('x');
ylabel('y');

% Plot Lagrange interpolation
subplot(232);
% Plot interpolated data points
plot(t, f, 'ko');
hold on;
% Plot Lagrange interpolation polynomial
fplot(f1_lagrange, [st,et], 'g');
hold off;
title('Lagrange polynomial for f(x) = exp(x^2)');
xlabel('x');
ylabel('y');

% Plot Newton interpolation
subplot(233);
% Plot interpolated data points
plot(t, f, 'ko');
hold on;
% Plot Newton interpolation polynomial
fplot(f1_newton, [st,et], 'r');
hold off;
title('Newton polynomial for f(x) = exp(x^2)');
xlabel('x');
ylabel('y');

% Plot Natural Spline interpolation
subplot(234);
% Plot interpolated data points
plot(t, f, 'ko');
hold on;
% Plot interpolated functions
for s = 1:length(f1_natural_spline)
   fplot( f1_natural_spline(s), [ t(s), t(s + 1) ] );
end
hold off;
title('Natural Spline interpolation for f(x) = exp(x^2)');
xlabel('x');
ylabel('y');

% Plot Complete Spline interpolation
subplot(235);
% Plot interpolated data points
plot(t, f, 'ko');
hold on;
% Plot interpolated functions
for s = 1:length(f1_complete_spline)
   fplot( f1_complete_spline(s), [ t(s), t(s + 1) ] );
end
hold off;
title('Complete Spline interpolation for f(x) = exp(x^2)');
xlabel('x');
ylabel('y');

% Plot Not-a-knot Spline interpolation
subplot(236);
% Plot interpolated data points
plot(t, f, 'ko');
hold on;
% Plot interpolated functions
for s = 1:length(f1_knot_spline)
   fplot( f1_knot_spline(s), [ t(s), t(s + 1) ] );
end
hold off;
title('Not-a-knot Spline interpolation for f(x) = exp(x^2)');
xlabel('x');
ylabel('y');

%% Test ¢ò: f(x) = 1/(1+12*x^2), x ¡Ê[-1,1]; 15 equally spaced points:
% Defined start and end times to create time values to evaluate function
st = -1;
et = 1;
% Define number of points to evaluate function
num_points = 15;
dt = (et - st) / (num_points - 1);

% Define time and function values
t = st:dt:et;
f = 1 ./ ( 1 + 12 .* t .^2 );

% Calculate interpolants
x = [ t' f' ];
f2_vandermonde = Vandermonde_Interpolation(x);
f2_lagrange = Lagrange_Interpolation(x);
f2_newton = Newton_Interpolation(x);
f2_natural_spline = Spline_Interpolation("natural", x);
f2_complete_spline = Spline_Interpolation("complete", x);
f2_knot_spline = Spline_Interpolation("not-a-knot", x);

% Plot Vandermonde interpolation
figure;
subplot(231);
% Plot interpolated data points
plot(t, f, 'ko');
hold on;
% Plot interpolated polynomial
fplot(f2_vandermonde, [st,et], 'b');
hold off;
title('Vandermonde polynomial for f(x) = 1/(1+12*x^2)');
xlabel('x');
ylabel('y');

% Plot Lagrange interpolation
subplot(232);
% Plot interpolated data points
plot(t, f, 'ko');
hold on;
% Plot interpolated polynomial
fplot(f2_lagrange, [st,et], 'g');
hold off;
title('Lagrange polynomial for f(x) = 1/(1+12*x^2)');
xlabel('x');
ylabel('y');

% Plot Newton interpolation
subplot(233);
% Plot interpolated data points
plot(t, f, 'ko');
hold on;
% Plot interpolated polynomial
fplot(f2_newton, [st,et], 'r');
hold off;
title('Newton polynomial for f(x) = 1/(1+12*x^2)');
xlabel('x');
ylabel('y');

% Plot Natural Spline interpolation
subplot(234);
% Plot interpolated data points
plot(t, f, 'ko');
hold on;
% Plot interpolated functions
for s = 1:length(f2_natural_spline)
   fplot( f2_natural_spline(s), [ t(s), t(s + 1) ] );
end
hold off;
title('Natural Spline interpolation for f(x) = 1/(1+12*x^2)');
xlabel('x');
ylabel('y');

% Plot Complete Spline interpolation
subplot(235);
% Plot interpolated data points
plot(t, f, 'ko');
hold on;
% Plot interpolated functions
for s = 1:length(f2_complete_spline)
   fplot( f2_complete_spline(s), [ t(s), t(s + 1) ] );
end
hold off;
title('Complete Spline interpolation for f(x) = 1/(1+12*x^2)');
xlabel('x');
ylabel('y');

% Plot Not-a-knot Spline interpolation
subplot(236);
% Plot interpolated data points
plot(t, f, 'ko');
hold on;
% Plot interpolated functions
for s = 1:length(f2_knot_spline)
   fplot( f2_knot_spline(s), [ t(s), t(s + 1) ] );
end
hold off;
title('Not-a-knot Spline interpolation for f(x) = 1/(1+12*x^2)');
xlabel('x');
ylabel('y');

%% Test ¢ó£ºData points are given specifically:
% Define start and end times to define axis values
st = 1994;
et = 2003;
% Define given data
x = [ 1994 67.501; 1995 68.008; 
      1996 69.803; 1997 72.024; 
      1998 73.400; 1999 72.063; 
      2000 74.669; 2001 74.487; 
      2002 74.065; 2003 76.777 ];

% Calculate interpolants
f3_vandermonde = Vandermonde_Interpolation(x);
f3_lagrange = Lagrange_Interpolation(x);
f3_newton = Newton_Interpolation(x);
f3_natural_spline = Spline_Interpolation("natural", x);
f3_complete_spline = Spline_Interpolation("complete", x);
f3_knot_spline = Spline_Interpolation("not-a-knot", x);

% Plot Vandermonde interpolation
figure;
subplot(231);
% Plot interpolated data points
plot(x(:,1), x(:,2), 'ko');
hold on;
% Plot interpolated polynomial
fplot(f3_vandermonde, [st,et], 'b');
hold off;
title('Vandermonde polynomial for f3');
xlabel('x');
ylabel('y');

% Plot Lagrange interpolation
subplot(232);
% Plot interpolated data points
plot(x(:,1), x(:,2), 'ko');
hold on;
% Plot interpolated polynomial
fplot(f3_lagrange, [st,et], 'g');
hold off;
title('Lagrange polynomial for f3');
xlabel('x');
ylabel('y');

% Plot Newton interpolation
subplot(233);
% Plot interpolated data points
plot(x(:,1), x(:,2), 'ko');
hold on;
% Plot interpolated polynomial
fplot(f3_newton, [st,et], 'r');
hold off;
title('Newton polynomial for f3');
xlabel('x');
ylabel('y');

% Plot Natural Spline interpolation
subplot(234);
% Plot interpolated data points
plot(x(:,1), x(:,2), 'ko');
hold on;
% Plot interpolated functions
for s = 1:length(f3_natural_spline)
   fplot( f3_natural_spline(s), [ x(s, 1), x(s + 1, 1) ] );
end
hold off;
title('Natural Spline interpolation for f3');
xlabel('x');
ylabel('y');

% Plot Complete Spline interpolation
subplot(235);
% Plot interpolated data points
plot(x(:,1), x(:,2), 'ko');
hold on;
% Plot interpolated functions
for s = 1:length(f3_complete_spline)
   fplot( f3_complete_spline(s), [ x(s, 1), x(s + 1, 1) ] );
end
hold off;
title('Complete Spline interpolation for f3');
xlabel('x');
ylabel('y');

% Plot Not-a-knot Spline interpolation
subplot(236);
% Plot interpolated data points
plot(x(:,1), x(:,2), 'ko');
hold on;
% Plot interpolated functions
for s = 1:length(f3_knot_spline)
   fplot( f3_knot_spline(s), [ x(s, 1), x(s + 1, 1) ] );
end
hold off;
title('Not-a-knot Spline interpolation for f3');
xlabel('x');
ylabel('y');
