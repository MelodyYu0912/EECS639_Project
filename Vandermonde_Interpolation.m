function [fx] = Vandermonde_Interpolation(x) 
% VANDERMONDE_INTERPOLATION   return a polynomial with monomial basis 
%                             to interpolate the given data points
%                             input x is a m by 2 matrix 
%                             where m is the number of data 
%                             points from input x

% Get number of points in x
[row,~] = size(x); 
% Create initial A matrix for Vandermonde
A = repmat(x(:,1), [1,row]);

% Create Vandermonde matrix
for jj = 1:row
    % Take each column to the jj - 1 power
    A(:, jj) = A(:, jj).^(jj-1);
end

% Take the second column (i.e the y value) of the input matrix
b = x(:,2); 
% Solve for coefficient matrix 
c = A\b; 

syms x;
% Initialize function with final coefficient value
fx = c(end);
% Evaluate function using Horner's method
for jj = (row - 1):-1:1 
    fx = fx * x + c(jj);
end
