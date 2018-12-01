function [fx] = Spline_Interpolation (type, x)
% SPLINE_INTERPOLAION   return cubic Spline interpolation
%                       of points from input x
%                       where x is formatted as such
%                       [ t1, y1 ; t2, y2 ; ... ; tn, yn ]

% Get number of points:
[r,~] = size(x);
% Create a matrix to store r-1 piecewise functions:
fx = sym('a',[r - 1, 1]);

% Calculating the number of equations required for NCS:
n = (r-1)*4;
% Create the matrices to represent the systems of equation for natural cubic
% spline:
A = zeros(n,n);
y = zeros(n,1);

% Create temp count variables to figure out placement of equations in
% matrix
count1 = 1;
count2 = 1;
count3 = 1;
% Generate all systems of equations except last two from ice cream flavor
for i = 1:(4*r-6)
    % Plug in each data points to the cubic functions:
    if i <= (2 * r - 2)
        A(i, (4 * ceil(count1 / 2) - 3):(4 * ceil(count1 / 2))) = x(ceil((i + 1) / 2),1) .^ [ 0 1 2 3 ];
        y(i) = x(ceil((i + 1) / 2), 2);
        count1 = count1 + 1;
    
    % First derivative continuous at each breakpoints:
    elseif i <= (3 * r - 4)
        A(i, (4 * count2 - 2):(4 * count2))= x((count2 + 1), 1) .^ [ 0 1 2 ] .* [ 1 2 3 ];
        A(i, (4 * count2 + 2):(4 * count2 + 4)) = x((count2 + 1), 1) .^ [ 0 1 2 ] .* [ 1 2 3 ] .* (-1);
        count2 = count2 + 1;
        
    % Second derivative continuous at each breakpoints:
    elseif i <= (4 * r - 6)
        A(i, (4 * count3 - 1):(4 * count3)) = [ 2 6*x((count3+1), 1) ];
        A(i, (4 * count3 + 3):(4 * count3 + 4)) = [ 2 6*x((count3+1), 1) ] .* (-1);
        count3 = count3 + 1;
    end
end

% Pick our Ice-cream flavor
switch type
    % Natural cubic spline
    case "natural"
        % Set second derivative at each endpoint to be zero
        A(n - 1, 3) = 2;
        A(n - 1, 4) = x(1, 1) * 6;
        A(n, n - 1) = 2;
        A(n, n)     = x(r, 1) * 6;
        
    % Complete/Clamped cubic spline
    case "complete"
        % Set first derivative at each endpoint to value
        % We chose to use the derivative of the lines connecting the
        % two consecutive points at the endpoints
        A(n - 1, 2) = 1;
        A(n - 1, 3) = x(1, 1) * 2;
        A(n - 1, 4) = x(1, 1) ^ 2 * 3;
        y(n - 1)    = ( x(2, 2) - x(1, 2) ) / ( x(2, 1) - x(1, 1) );
        
        A(n, n - 2) = 1;
        A(n, n - 1) = x(r, 1) * 2;
        A(n, n)     = x(r, 1) ^ 2 * 3;
        y(n)        = ( x(r, 2) - x(r - 1, 2) ) / ( x(r, 1) - x(r - 1, 1) );
    
    % Not-a-knot cubic spline
    case "not-a-knot"
        
        
    % Invalid type input
    otherwise
        error("Error: type of cubic spline interpolation is not valid or supported");
end

% Calculating the coefficients:
c = Guassian_Elimination_Partial_Pivot(A, y);

% Create syms for functions:
syms t;

% Generate piecewise functions by taking 4 coefficients at a time from
% matrix solution
for i = 1:(r-1)
    fx(i) = sum( [ 1 t t^2 t^3 ] .* c( ( 4*i - 3):(4*i) )' );
end
