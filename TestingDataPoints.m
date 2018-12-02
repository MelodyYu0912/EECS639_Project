% Script to calculate interpolants for given data sets
% Clear screen and variables
clear, clc;

%% Test ¢ñ: f(x) = exp(x^2), x ¡Ê[0.6,1]; 5 equally spaced points:
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
f1_natural_spline = Spline_Interpolation("natural", x);
f1_complete_spline = Spline_Interpolation("complete", x);
f1_knot_spline = Spline_Interpolation("not-a-knot", x);

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

subplot(234);
plot(t, f, 'ko');
hold on;
for s = 1:length(f1_natural_spline)
   fplot( f1_natural_spline(s), [ t(s), t(s + 1) ] );
end
hold off;
title('Natural Spline interpolation for f(x) = exp(x^2)');
xlabel('x');
ylabel('y');

subplot(235);
plot(t, f, 'ko');
hold on;
for s = 1:length(f1_complete_spline)
   fplot( f1_complete_spline(s), [ t(s), t(s + 1) ] );
end
hold off;
title('Complete Spline interpolation for f(x) = exp(x^2)');
xlabel('x');
ylabel('y');

subplot(236);
plot(t, f, 'ko');
hold on;
for s = 1:length(f1_knot_spline)
   fplot( f1_knot_spline(s), [ t(s), t(s + 1) ] );
end
hold off;
title('Not-a-knot Spline interpolation for f(x) = exp(x^2)');
xlabel('x');
ylabel('y');

%% Test ¢ò: f(x) = 1/(1+12*x^2), x ¡Ê[-1,1]; 15 equally spaced points:
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
f2_natural_spline = Spline_Interpolation("natural", x);
f2_complete_spline = Spline_Interpolation("complete", x);
f2_knot_spline = Spline_Interpolation("not-a-knot", x);

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

subplot(234);
plot(t, f, 'ko');
hold on;
for s = 1:length(f2_natural_spline)
   fplot( f2_natural_spline(s), [ t(s), t(s + 1) ] );
end
hold off;
title('Natural Spline interpolation for f(x) = 1/(1+12*x^2)');
xlabel('x');
ylabel('y');

subplot(235);
plot(t, f, 'ko');
hold on;
for s = 1:length(f2_complete_spline)
   fplot( f2_complete_spline(s), [ t(s), t(s + 1) ] );
end
hold off;
title('Complete Spline interpolation for f(x) = 1/(1+12*x^2)');
xlabel('x');
ylabel('y');

subplot(236);
plot(t, f, 'ko');
hold on;
for s = 1:length(f2_knot_spline)
   fplot( f2_knot_spline(s), [ t(s), t(s + 1) ] );
end
hold off;
title('Not-a-knot Spline interpolation for f(x) = 1/(1+12*x^2)');
xlabel('x');
ylabel('y');

%% Test ¢ó£ºData points are given specifically:
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
f3_natural_spline = Spline_Interpolation("natural", x);
f3_complete_spline = Spline_Interpolation("complete", x);
f3_knot_spline = Spline_Interpolation("not-a-knot", x);

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

subplot(234);
plot(t, f, 'ko');
hold on;
for s = 1:length(f3_natural_spline)
   fplot( f3_natural_spline(s), [ x(s, 1), x(s + 1, 1) ] );
end
hold off;
title('Natural Spline interpolation for f3');
xlabel('x');
ylabel('y');

subplot(235);
plot(t, f, 'ko');
hold on;
for s = 1:length(f3_complete_spline)
   fplot( f3_complete_spline(s), [ x(s, 1), x(s + 1, 1) ] );
end
hold off;
title('Complete Spline interpolation for f3');
xlabel('x');
ylabel('y');

subplot(236);
plot(t, f, 'ko');
hold on;
for s = 1:length(f3_knot_spline)
   fplot( f3_knot_spline(s), [ x(s, 1), x(s + 1, 1) ] );
end
hold off;
title('Not-a-knot Spline interpolation for f3');
xlabel('x');
ylabel('y');
