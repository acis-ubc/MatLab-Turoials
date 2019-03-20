%% UBCO Matlab Workshop - Data Manipulation
%  By Brandon Robertson

clear all
close all
clc

%% Create data
f = 0.1;        % Frequency
a = 4;          % Amplitude
ts = 0.1;       % Timestep
T = 10;         % # of seconds

% Input
t = 0:ts:T;             % Creates vector from 0 to T with a step of ts

% Output
y = a*sin(2*pi*f*t);    % Sin wave (note: the sin function can handle a vector input)

plot(t,y)               % Graph y vs. t

%% Create noise vector
% Noise
n = T/ts + 1;          	% Number of values in 0:ts:T
noise = randn(n, 1);	% Normally distributed random matrix of size nx1

%% Alter data
%{
    Note that noise is 101x1 vector and y is 1x101 so to add y + noise
    we have to flip y to also be 101x1 by taking the transpose of y, y'.
%}
t = t';                 % Transpose of t (to be 101x1 instead of 1x101)
y = y' + noise;         % Add the transpose of y with noise

plot(t,y)               % Graph y vs. t

%% Prepare data 1
% Concatinate vectors
outdata = cat(2, t, y);     % Combine vectors t & y into 1 matrix along the 2nd axis

%% Export data (excel file)
% Convert data to cell array
outdata_cell = num2cell(outdata);
outdata_cell = [{'Time', 'Wave'}; outdata_cell];    % Add title to first row

% Save data to excel file
xlswrite('datafile.xlsx', outdata_cell)             % Output data to excel sheet 1

%% Import data

[values, titles, ~] = xlsread('datafile.xlsx',1,'A1:B102');  % [num, txt, raw] = xlsread(filename, sheet#, range)
data.x.name = titles(:, 1);
data.x.values = values(:, 1);
data.y.name = titles(:, 2);
data.y.values = values(:, 2);

%% Fit data to polynomial

x = data.x.values;
y = data.y.values;
x_name = data.x.name;
y_name = data.y.name;

for n = 1:10                            % for 1 to 10th order polynomial
    p = polyfit(x ,y, n);               % Get polynomial coefficients of polynomial order n
    y_fit = polyval(p, x);              % Get values of polynomial with respect to t
    
    mygraph(x, y, 'Real',...
            x, y_fit, 'Fit',...
            x_name, y_name)
    
    in = input('Is this good enough? (y/n)', 's');  % 's' means use the text "y" don't look for a variable named y
    if strcmp(in, 'y')                  % inp == 'y' doesn't work so you need to use strcmp to compare words
        saveas(gcf, 'fitted_data.jpg')  % gcf = get current figure
        break
    end
end

disp('This is the end of this lession')


function mygraph(x1, y1, n1, x2, y2, n2, x_axis, y_axis)
    
    subplot(211)                        % 2 columns, 1 row, 1st graph
    plot(x1, y1, 'b', x2, y2, 'r--')
    legend(n1, n2)
    xlabel(x_axis)
    ylabel(y_axis)
    title(cell2mat([n1, {' vs '}, n2]))
    
    subplot(212)                                % 2 columns, 1 row, 2st graph
    plot(x1, y1-y2, 'k')                        % k = black
    hold on                                     % Freeze the plot so you won't overwrite it
    y_mean = mean(y1-y2) * ones(length(x1),1);  % mean * array ones the same length as x1
    plot(x1, y_mean, 'm:')                     	% Plot on top of previous plot
    hold off                                    % Unfreeze the plot
    legend('error', 'mean')
    xlabel(x_axis)
    ylabel(y_axis)
    title('Error')
end


