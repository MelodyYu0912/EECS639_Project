function [fx] = Lagrange_Interpolation(x)
% LAGRANGE_INTERPOLATION   return lagrange interpolation 
%                          of points from input x
%                          where x is formatted as such
%                          [ t1, y1 ; t2, y2 ; ... ; tn, yn ]

% Get number of points
[row, ~] = size(x);
% Initialize basis function to array of syms
li = sym('a',[row, 1]);
% Create syms variable t
syms t;

% Loop through columns and create basis function
for jj = 1:row
    % Get t at j
    tj = x(jj, 1);
    % Find all points exluding at j index
    tn = [ x(1:jj-1, 1)' x(jj+1:end, 1)' ];
    % Calculate basis function
    li(jj, :) = prod( t - tn ) / prod( tj - tn );
end

% Return final interpolated function
fx = sum( x(:, 2) .* li );

