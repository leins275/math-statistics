file_name = '37000_SPD16x16.mat';
data = load(file_name);

[cnt_rows, cnt_cols, cnt_means] = size(data.sign_bb(:, :, :));

B = zeros(cnt_rows, cnt_cols, cnt_means);
for k = 1:cnt_means
  B(:, :, k) = rot90(data.sign_bb(:, :, k), 2);
end

dt = cell2mat(data.Data(1, 2)) * 1e-3;
t_s = cell2mat(data.Data(2, 2))

t_e = t_s + (cnt_means - 1) * dt;
t = t_s:dt:t_e;  

B_up = B(cnt_rows / 2 + 1:cnt_rows, :, :);
B_low = B(1:cnt_rows / 2, :, :);


sum_B_up = sum(sum(B_up));
sum_B_up = sum_B_up(:)';
sum_B_low = sum(sum(B_low));
sum_B_low = sum_B_low(:)';

t_cons_s = 135;
t_cons_e = 175;

w_w = 1;
t_cons_w = t_cons_s:w_w:t_cons_e;ддд
