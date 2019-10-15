% Включение пакета signal для вычисления xcorr
pkg load signal;

% Считывание данных светимости
file_name = '37000_SPD16x16.mat';
data = load(file_name);

[cnt_rows, cnt_cols, cnt_means] = size(data.sign_bb(:, :, :));

B = zeros(cnt_rows, cnt_cols, cnt_means);
for k = 1:cnt_means
  B(:, :, k) = rot90(data.sign_bb(:, :, k), 2);
end

dt = cell2mat(data.Data(1, 2)) * 1e-3;
t_s = cell2mat(data.Data(2, 2))

% Сопоставление индексов с временной шкалой
t_e = t_s + (cnt_means - 1) * dt;
t = t_s:dt:t_e;  

% Выделение областей светимости выше и ниже экватора
B_up = B(cnt_rows / 2 + 1:cnt_rows, :, :);
B_low = B(1:cnt_rows / 2, :, :);

% Нахождение светимостей областей выше и ниже экавтора
sum_B_up = sum(sum(B_up));
sum_B_up = sum_B_up(:)';
sum_B_low = sum(sum(B_low));
sum_B_low = sum_B_low(:)';

% Введение рассматриваемого отрезка времени
t_cons_s = 135;
t_cons_e = 175;

% Введение временного окна
w_w = 1;
t_cons_w = t_cons_s:w_w:t_cons_e;

R = [];
% T_sum_B_up = [];
% T_sum_B_low = [];

for t_w_s = t_cons_w(t_cons_w + w_w <= t_cons_e)
  t_w_e = t_w_s + w_w;
  t_w = t(t_w_s < t & t <= t_w_e);
  ind_w = int32((t_w - t_s) / dt + 1);
  sum_B_up_w = sum_B_up(ind_w);
  sum_B_low_w = sum_B_low(ind_w);
  
  % Рассчёт коэффициента корреляции R между светимостями областей выше 
  % и ниже экавтора
  R = [R r(sum_B_up_w, sum_B_low_w)];
  
  % Нахождение для светимостей областей выше  и ниже экватора основного
  % периода колебаний с помощью вычисления автокорреляции
  % T_sum_B_up = [T_sum_B_up period(sum_B_up_w) * dt];
  % T_sum_B_low = [T_sum_B_low period(sum_B_low_w) * dt];
end

% Нахождение для светимостей областей выше и ниже экавтора частоты колебаний
% f_sum_B_up = 1 ./ T_sum_B_up;
% f_sum_B_low = 1 ./ T_sum_B_low;

