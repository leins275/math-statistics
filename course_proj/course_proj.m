% Введение рассматриваемого отрезка времени
t_cons_s = 65;
t_cons_e = 274;

% Поиск кросс корреляции на всём интервале
t_w = t(t_cons_s < t & t <= t_cons_e);
ind_w = int32((t_w - t_s) / dt + 1);

sum_B_up_w = sum_B_up(ind_w);
sum_B_low_w = sum_B_low(ind_w);

[corr_func_glob, lags_glob] = xcorr(sum_B_low_w, sum_B_up_w);

[cf_max, cf_max_ind] = max(corr_func_glob);
max_lag = lags_glob(cf_max_ind);

plot(lags_glob, corr_func_glob);

% Введение временного окна
w_w = 1;
t_cons_w = t_cons_s:w_w:t_cons_e;

% Основной цикл
corr_func = [];
lags = [];
for t_w_s = t_cons_w(t_cons_w + w_w <= t_cons_e)
  t_w_e = t_w_s + w_w;
  t_w = t(t_w_s < t & t <= t_w_e);
  ind_w = int32((t_w - t_s) / dt + 1);
  sum_B_up_w = sum_B_up(ind_w);
  sum_B_low_w = sum_B_low(ind_w);
  
  % Нахождение максимального лага для каждой мс на интервале t_cons_w
  [corr_func_w, lags_w] = xcorr(sum_B_low_w, sum_B_up_w);
  [c_max, c_max_ind] = max(corr_func_w);
  corr_func = [corr_func c_max];
  lags = [lags lags_w(c_max_ind)];
end
