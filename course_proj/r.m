% R коэффициент корреляции двух векторов
function R = r(x, y)
  R_m = corrcoef(x, y);
  R = R_m(1, 2);
  