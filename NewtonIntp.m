function [fx] = NewtonIntp (x) % Newton Interpolation with Divided Differences: return an polynomial with Newton basis
                               % Coefficients determined by Divided differences
[r,~] = size(x); 

a = x(:,1); % t value of input data
b = x(:,2); % y value of input data

% Implementation of Divided Differences with recursive function:
syms k;
f(k) = b(k);
f(k1,k2);

%======= To Be Modified ==========
if (k2==k1)
    f(k1,k2) = f(k1);
elseif (k2 == k1+1)
    f(k1,k2) = ( f(k2) - f(k1) ) / ( a(k2) - a(k1) );
elseif (k2 > k1+1)
    f(k1,k2) = ( f(k1+1,k2) - f(k1, k2-1) ) / ( a(k2) - a(k1) );
end
%=================================

% Newton basis:
p = zeros(1,r);
for i = 1:r
    p(i) = prod( t-x(1:r-1) );
end

% Determine the polynomial:
fx = 0;
for i = 1:r
    fx = fx + ( f(1,r) * p(r) );
end

end