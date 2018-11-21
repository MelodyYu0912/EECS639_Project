function [fc] = Newton_Interpolation_Coefficient(x, indecies)
% NEWTON_INTERPOLAION_COEFFICIENT   return Newton interpolation 
%                                   coefficients with Divided Differences
%                                   of points from input x
%                                   where x is formatted as such
%                                   [ t1, y1 ; t2, y2 ; ... ; tn, yn ]
%                                   and indecies correspond to the t values
%                                   ie. f[t1, t2] -> indecies = [ 1 2 ]

% Check length of input indecies
l = length(indecies);
% If base case, return yi
if l == 1
    fc = x(indecies, 2);
    return;
end

% Recursively call divided differences for upper and lower t
% ie. f[1 2] -> f[1] and f[2]
f_lower = Newton_Interpolation_Coefficient(x, indecies(1:end-1));
f_upper = Newton_Interpolation_Coefficient(x, indecies(2:end));

% Calculate fc and return
fc = (f_upper - f_lower) / (x(indecies(end),1) - x(indecies(1),1));
