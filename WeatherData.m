%% Script to interpolate weather data for Lawrence, KS
% clear variables and screen
clear, clc;

%% Read data
fileName = 'LawrenceWeatherData.csv';
weather_data = readtable(fileName);

max_temp = table2array(weather_data(:, 7));
max_temp = cellfun(@str2double, max_temp);

precipitation = table2array(weather_data(:, 4));
precipitation = cellfun(@str2double, precipitation);

dates = table2array(weather_data(:, 3));

figure;

%% Max temp
% Should be x = 0:5:100 -> once we get correct data file
x = 0:5:90;
y = max_temp(x + 1);
f = [ x' y ];

temp_newton = Newton_Interpolation(f);
subplot(121);
plot(x, y, 'ko');
hold on;
% TODO: change to 0 to 100
fplot(temp_newton, [0, 90]);
hold off;
title("Max temperature for Lawrence, KS");
xlabel('date');
ylabel('temp, C');

%% Rainfall
% Should be x = 0:5:100 -> once we get correct data file
x = 0:5:90;
y = precipitation(x + 1);
f = [ x' y ];

precip_newton = Newton_Interpolation(f);
subplot(122);
plot(x, y, 'ko');
hold on;
% TODO: change to 0 to 100
fplot(precip_newton, [0, 90]);
hold off;
title("Max temperature for Lawrence, KS");
xlabel('date');
ylabel('precipitation');