function [fx] = Natural_Cubic_Interpolation(x)
%NATURAL CUBIC INTERPOLATION  Return Natural Cubic Spline Interpolation 
%                             of points from input x
%                             where x is formatted as such
%                             [ t1, y1 ; t2, y2 ; ... ; tn, yn ]

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

count1 = 1;
count2 = 1;
count3 = 1;
for i = 1:(4*r-6)
    % Plug in each data points to the cubic functions:
    if i <= (2*r-2)
        A(i,(4*ceil(count1/2)-3):(4*ceil(count1/2))) = x(ceil((i+1)/2),1).^[0 1 2 3];
        y(i) = x(ceil((i+1)/2),2);
        count1 = count1 + 1;
    % First derivative continuous at each breakpoints:
    elseif i <= (3*r-4)
        A(i,(4*count2-2):(4*count2))=x((count2+1),1).^[0 1 2].*[1 2 3];
        A(i,(4*count2+2):(4*count2+4)) = x((count2+1),1).^[0 1 2].*[1 2 3].*(-1);
        count2 = count2 + 1;
    % Second derivative continuous at each breakpoints:
    elseif i <= (4*r-6)
        A(i,(4*count3-1):(4*count3)) = [2 6*x((count3+1),1)];
        A(i,(4*count3+3):(4*count3+4)) = [2 6*x((count3+1),1)].*(-1);
        count3 = count3 + 1;
    end
end

% Ice-cream flavor: Natural Cubic Spline
A(n-1,3) = 2;
A(n-1,4) = x(1,1)*6;
A(n,n-1) = 2;
A(n,n) = x(r,1)*6;

% Calculating the coefficients:
c = Guassian_Elimination_Partial_Pivot(A, y);

% Create syms for functions:
syms t;

for i = 1:(r-1)
    fx(i) = sum( [ 1 t t^2 t^3 ] .* c( ( 4*i - 3):(4*i) )' );
end
