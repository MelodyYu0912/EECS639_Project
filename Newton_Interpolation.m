function [fx] = Newton_Interpolation (x) 
% NEWTON_INTERPOLAION   return Newton interpolation 
%                       with Divided Differences
%                       of points from input x
%                       where x is formatted as such
%                       [ t1, y1 ; t2, y2 ; ... ; tn, yn ]

% Get number of points
[r,~] = size(x); 
% Create syms to calculate basis functions
syms t;

% Newton basis:
p = sym('a',[r, 1]);
p(1) = 1;
for i = 2:r
    % Create basis function using product of t - ti
    t_values = t - x(1:i-1, 1);
    p(i) = prod( t_values );
end

% Determine the polynomial with divided differences coefficients:
fx = 0;
for i = 1:r
    fx = fx + ( Newton_Interpolation_Coefficient(x, 1:i) * p(i) );
end
