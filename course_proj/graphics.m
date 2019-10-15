pkg load signal;

time_start = 153;  % 135;
time_end = 156;  % 175;

%%%
% Печать светимостей выше и ниже экватора
%%%
% x = t(t <= time_end & time_start < t);
% index = int32((x - t_s) / dt + 1);
% y_l = sum_B_low(index);
% y_u = sum_B_up(index);

%%%
% Печать коэффициента корреляции
%%%
x = t_cons_w(t_cons_w != 170);
y = R;

%%%
% Build graphics
%%%
graphic_figure = figure(1);
hold on;
grid on;

%%%
% draw graphics
%%%
stem(lags, corr_func);  % bar(lags, corr_func);

% bar(x, y, 'g');

% plot(x, y, 'k');
% plot(x, y_l, 'b');
% plot(x, y_u, 'r');

%%%
% setting up axis scale
%%%
axis([min(lags), max(lags), min(corr_func), max(corr_func)]);

% y_shift = 0.5;
% axis([min(x), max(x), min(y) - y_shift, max(y) + y_shift]);

% axis([time_start, time_end, min(y_l), max(y_u)]); % [x_min, x_max, y_min, y_max]

%%%
% provide graphic info
%%%
xlabel('lag');
ylabel('crosscorrelation function between up and low');
title('crosscorrelation function between up and low');

% xlabel('time window start, ms');
% ylabel('Correlationcoefficient of sum pixel up and low');
% title('Correlationcoefficient of sum pixel up and low');

% xlabel('time, ms');
% ylabel('sum, pixel');
% title('Sum pixel up and low');
% legend( 'low', 'up' );

%%%
% save figure to file
%%%
plot_img_name = "pic/plot5.png";
% print(graphic_figure, plot_img_name, "-dpng");

%%%
% поиск сдвига, где максимальная корреляция
%%%
[r_max, r_max_ind] = max(R);
time_shift_with_max_r = x(r_max_ind);

%%%
% Вычисление функции автокорреляции между севером и югом
%%%

[corr_func, lags] = xcorr(sum_B_low, sum_B_up);

[c_max, c_max_ind] = max(corr_func);
time_shift_with_max_c = lags(c_max_ind);

