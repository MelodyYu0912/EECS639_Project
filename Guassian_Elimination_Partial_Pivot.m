function [x] = Guassian_Elimination_Partial_Pivot (A, b)
% GUASSIAN_ELIMINATION_PARTIAL_PIVOT   return GEPP solution of Ax = b
%                                      with back substitution
%                                      where A is n by n matrix and
%                                      b is n by 1 matrix

% Get length of input matrix
n = length(A);
% Create empty solutions vector
x = zeros(n, 1);

% Loop through each column of A
for s = 1:n
    % Find max element in column s and its corresponding index
    [~, index] = max( abs( A(s:end, s) ) );
    index = index + (s - 1);
    
    % If max is not at position (s, s), swap rows for A and b
    if index ~= s
        % Store temporary values so values overwriten are not lost
        tempRow = A(s, :);
        tempB = b(s);
        
        % Swap rows in A
        A(s, :) = A(index, :);
        A(index, :) = tempRow;
        
        % Swap elements in b
        b(s) = b(index);
        b(index) = tempB;
    end
    
    % Perform Guassian Elimination and zero out rows below pivot
    for t = (s + 1):n
        % If element is already zero, skip computation
        if A(t, s) == 0
            continue;
        end
        
        % Create constant to multiply pivot row by
        a = A(t, s) / A(s, s);
        
        % Update row below pivot
        A(t, :) = A(t, :) - a * A(s, :);
        b(t) = b(t) - a * b(s);
    end
end

% Perform backwards substitution to solve for x
x(end) = b(end) / A(end, end);
for u = (n - 1):(-1):1
    x(u) = (b(u) - sum(A(u, (u + 1):end) * x((u + 1):end))) / A(u, u);
end
