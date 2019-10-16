%%%
% Setup vars
%%%
x = t_cons_s:t_cons_e - 1;
y = lags;
color = 'k';
width = 2;
save = false;
plot_img_name = "pic/plot6.png";

%%%
% Build graphics
%%%
graphic_figure = figure(1);
hold on;
grid on;

%%%
% draw graphics
%%%
stem(lags, corr_func);
% bar(lags, corr_func);
% lin1 = plot(x, y, color);
% plot(x, y, color);
% set(lin1, 'linewidth', width);
% axis([min(x), max(x), min(y), max(y)]);

%%%
% provide graphic info
%%%
xlabel('lags');
ylabel('crosscorrelation');
title('Correlogramm hist');
legend( 'y' );

%%%
% save figure to file
%%%
if save
  print(graphic_figure, plot_img_name, "-dpng");
end


