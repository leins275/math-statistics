% Основной период колебаний временного ряда
function T = period(x)
  n = length(x);
  maxlag = round(n / 2);
  minlag = round(n / 12.5);
  r = xcorr(x, maxlag, 'unbiased');
  r = r(maxlag + minlag + 1:2 * maxlag + 1);
  [r_max, ind_max] = max(r);
  T = ind_max + minlag - 1;
  