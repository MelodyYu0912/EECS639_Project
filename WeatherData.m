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

st = 0;
ed = 100;
inc = 5;

datesToDisplay = datestr(dates(1:inc:end));

%% Max temp
x = st:inc:ed;
y = max_temp(x + 1);
f = [ x' y ];

temp_newton = Newton_Interpolation(f);
figure;
plot(x, y, 'ko');
hold on;
fplot(temp_newton, [st, ed]);
hold off;
title("Max temperature for Lawrence, KS");
xlabel('date');
xticks(x);
xticklabels(datesToDisplay);
xtickangle(45);
ylabel('temp, C');

%% Rainfall
x = st:inc:ed;
y = precipitation(x + 1);
f = [ x' y ];

precip_newton = Newton_Interpolation(f);
figure;
plot(x, y, 'ko');
hold on;
fplot(precip_newton, [st, ed]);
hold off;
title("Max precipitation for Lawrence, KS");
xlabel('date');
xticks(x);
xticklabels(datesToDisplay);
xtickangle(45);
ylabel('precipitation');