function [fc, data_new] = Newton_Interpolation_Coefficient(x, indecies, data)

% TODO: ideal algorithm:
% Steps
% Check if exists in data -> return data at indecies
% Check base case -> return data at index
% Recusrsive call



l = length(indecies);
if l == 1
    fc = x(indecies, 2);
    data_new = data;
    return;
end

f_lower = Newton_Interpolation_Coefficient(x, indecies(1:end-1), data);
f_upper = Newton_Interpolation_Coefficient(x, indecies(2:end), data);

fc = (f_upper - f_lower) / (x(indecies(end),1) - x(indecies(1),1));
data_new = data;
