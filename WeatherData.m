%% Script to interpolate weather data for Lawrence, KS
% clear variables and screen
clear, clc;

%% Read data csv file
% Define file name containing data
fileName = 'LawrenceWeatherData.csv';
% Read csv data table
weather_data = readtable(fileName);

% Extract column information for temperature, precipitation, and dates of
% data
max_temp = table2array(weather_data(:, 7));
max_temp = cellfun(@str2double, max_temp);

precipitation = table2array(weather_data(:, 4));
precipitation = cellfun(@str2double, precipitation);

dates = table2array(weather_data(:, 3));

% Define data increment variables
st = 0;
ed = 100;
inc = 5;

% Define dates to use on graphs
datesToDisplay = datestr(dates(1:inc:end));

%% Max temperature data
% Create data to send to interpolating functions
x = st:inc:ed;
y = max_temp(x + 1);
f = [ x' y ];

% Retrieve Newton and Spline interpolation functions
temp_newton = Newton_Interpolation(f);
temp_natural_spline = Spline_Interpolation("natural", f);

% Plot Newton interpolation
figure;
% Plot all temperature data points as black circles
plot(st:ed, max_temp, 'ko');
hold on;
% Plot interpolated data points as red circles
plot(x, y, 'ro');
% Plot interpolated function
fplot(temp_newton, [ st, ed ]);
hold off;

% Define axis labels and title
title("Max temperature for Lawrence, KS with Newton Interpolation");
xlabel('date');
xticks(x);
xticklabels(datesToDisplay);
xtickangle(45);
ylabel('temp (C)');

% Plot Natural Cubic Spline Interpolation
figure;
% Plot all temperature data points as black circles
plot(st:ed, max_temp, 'ko');
hold on;
% Plot interpolated data points as red circles
plot(x, y, 'ro');
% Plot interpolated piecwise functions
for s = 1:length(temp_natural_spline)
    fplot( temp_natural_spline(s), [ x(s), x(s + 1) ] );
end
hold off;

% Define axis labels and title
title("Max temperature for Lawrence, KS with Natural Cubic Spline Interpolation");
xlabel('date');
xticks(x);
xticklabels(datesToDisplay);
xtickangle(45);
ylabel('temp (C)');

% Error for Newton's interpolation
% Create symbolic function to compare with true data points
interpolation = matlabFunction(temp_newton);
% Find max error as max absolute value of difference between points
max_error = max(abs(max_temp' - interpolation(st:ed)));
fprintf('Max error for Newton Interpolation on temperature data is: %d\n', max_error);

% Error for Spline interpolation
% Initialize error to 0
max_error = 0;
% Loop through each spline curve
for s = 1:length(temp_natural_spline)
    % Create symbolic function to compare with true data points
    interpolation = matlabFunction(temp_natural_spline(s));
    % Calculate max error for repsective curve
    error_temp = max( abs( max_temp( ( x(s):x(s + 1) ) + 1 )' - interpolation( x(s):x(s + 1) ) ) );
    % If error on curve is larger than old max error, update error
    if (error_temp > max_error)
       max_error = error_temp; 
    end
end
fprintf('Max error for Spline Interpolation on temperature data is: %d\n', max_error);

%% Rainfall
% Create data to send to interpolating functions
x = st:inc:ed;
y = precipitation(x + 1);
f = [ x' y ];

% Retrieve Newton and Spline interpolation functions
precip_newton = Newton_Interpolation(f);
precip_natrual_spline = Spline_Interpolation("natural", f);

% Plot Newton interpolation
figure;
% Plot all precipitation data points as black circles
plot(st:ed, precipitation, 'ko');
hold on;
% Plot interpolated data points as red circles
plot(x, y, 'ro');
% Plot interpolated function
fplot(precip_newton, [ st, ed ]);
hold off;

% Define axis labels and title
title("Max precipitation for Lawrence, KS");
xlabel('date');
xticks(x);
xticklabels(datesToDisplay);
xtickangle(45);
ylabel('precipitation (mm)');

% Plot Natural Cubic Spline Interpolation
figure;
% Plot all precipitation data points as black circles
plot(st:ed, precipitation, 'ko');
hold on;
% Plot interpolated data points as red circles
plot(x, y, 'ro');
% Plot interpolated piecwise functions
for s = 1:length(precip_natrual_spline)
    fplot( precip_natrual_spline(s), [ x(s), x(s + 1) ] );
end
hold off;

% Define axis labels and title
title("Max precipitation for Lawrence, KS with Natural Cubic Spline Interpolation");
xlabel('date');
xticks(x);
xticklabels(datesToDisplay);
xtickangle(45);
ylabel('precipitation (mm)');

% Error for Newton's interpolation
% Create symbolic function to compare with true data points
interpolation = matlabFunction(precip_newton);
% Find max error as max absolute value of difference between points
max_error = max(abs(precipitation' - interpolation(st:ed)));
fprintf('Max error for Newton Interpolation on precipitation data is: %d\n', max_error);

% Error for Spline interpolation
% Initialize error to 0
max_error = 0;
for s = 1:length(precip_natrual_spline)
    % Create symbolic function to compare with true data points
    interpolation = matlabFunction(precip_natrual_spline(s));
    % Calculate max error for repsective curve
    error_temp = max( abs( precipitation( ( x(s):x(s + 1) ) + 1 )' - interpolation( x(s):x(s + 1) ) ) );
    % If error on curve is larger than old max error, update error
    if (error_temp > max_error)
       max_error = error_temp; 
    end
end
fprintf('Max error for Spline Interpolation on precipitation data is: %d\n', max_error);
