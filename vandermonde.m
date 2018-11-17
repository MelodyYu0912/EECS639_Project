function [fx] = vandermonde (x) % VANDERMONDE return a polynomial with monomial basis to interpolate the given data points
                                % input x is a m by 2 matrix where m is the number of data                          
[r,~] = size(x); 
A = ones(r);

% creating A with monomial basis:
for i = 1:r
    for j = 1:r
        A(i,j) = (x(i,1))^(j-1); %shifting and scaling 
    end
end

b = x(:,2); % taking the second column (i.e the y value) of the input matrix 
c = A\b; % solving for coefficient matrix 

syms x;
fx = 0;
for i = 1:r
    fx = fx + (c(i) * (x^(i-1))); 
end
end