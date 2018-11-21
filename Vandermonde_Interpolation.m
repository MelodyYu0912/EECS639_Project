function [fx] = Vandermonde_Interpolation(x) 
% VANDERMONDE_INTERPOLATION   return a polynomial with monomial basis 
%                             to interpolate the given data points
%                             input x is a m by 2 matrix 
%                             where m is the number of data 
%                             points from input x

% Get number of points in x
[row,~] = size(x); 

% Create range of exponentials for Vandermonde
jj = 0:(row - 1);
% Create Vandermonde matrix
A = x(:,1) .^ jj;

% Take the second column (i.e the y value) of the input matrix
b = x(:,2); 
% Solve for coefficient matrix 
% TODO: REPLACE WITH GEPP
c = A\b;

syms x;
% Initialize function with final coefficient value
fx = c(end);
% Evaluate function using Horner's method
for jj = (row - 1):-1:1 
    fx = fx * x + c(jj);
end
