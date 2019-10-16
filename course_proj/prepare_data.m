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
t_s = cell2mat(data.Data(2, 2));

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


