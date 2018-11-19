clear, clc;

fileName = 'LawrenceWeatherDataAnonymous.csv';
weather_data = csvread(fileName);
max_temp = weather_data(:, 4);
precipitation = weather_data(:, 1);
