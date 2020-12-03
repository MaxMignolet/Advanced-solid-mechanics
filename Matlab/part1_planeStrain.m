%% Load metafor data in Matlab and create plots 
resultPath{1} = '../workspace/lin2_iso';
resultPath{2} = '../workspace/lin2_kin';
resultPath{3} = '../workspace/lin2_mix';

iso = importResults2(resultPath{1});
kin = importResults2(resultPath{2});
mix = importResults2(resultPath{3});
% 1: time
time = iso.time;


%% iso stress
t_end = 12;
index_end = find(time == t_end);

figure;
hold on
plot(time(1:index_end), iso.sigma_xx(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), iso.sigma_yy(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), iso.sigma_yy(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), iso.sigma_vm(1:index_end), '--', 'LineWidth', 2.5);
plot(time(1:index_end), iso.sigma_equi(1:index_end), '--', 'LineWidth', 2.5);
plot(time(1:index_end), iso.sigma_yield(1:index_end), 'LineWidth', 2.5);
hold off
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Stress [MPa]', 'FontSize',18)
set(gca,'fontsize',20)

lgd = legend('$\sigma_{xx}$', '$\sigma_{yy}$', '$\sigma_{zz}$', '$\overline\sigma^{\mathrm{vm}}$', '$\overline\sigma$', '$\sigma_y$');
set(lgd,'interpreter','Latex','FontSize',25, 'Location', 'southeast');
set(gca,'fontsize',20)

set(gcf, 'PaperPositionMode','auto')
print(gcf,'lin2_iso_stress','-depsc')

%% iso strain

t_end = 12;
index_end = find(time == t_end);

figure;
hold on
plot(time(1:index_end), iso.e_xx(1:index_end)*100, 'LineWidth', 2.5);
plot(time(1:index_end), iso.e_yy(1:index_end)*100, 'LineWidth', 2.5);
plot(time(1:index_end), iso.e_zz(1:index_end)*100, 'LineWidth', 2.5);
plot(time(1:index_end), iso.e_pl(1:index_end)*100, 'LineWidth', 2.5);
hold off
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Strain [%]', 'FontSize', 18)
set(gca,'fontsize',20)

lgd = legend('$\varepsilon_{xx}$', '$\varepsilon_{yy}$', '$\varepsilon_{zz}$', '$\overline\varepsilon^{\mathrm{vp}}$');
set(lgd,'interpreter','Latex','FontSize',25, 'Location', 'southeast');
set(gca,'fontsize',20)

set(gcf, 'PaperPositionMode','auto')
print(gcf,'lin2_iso_strain','-depsc')

%% kin stress
t_end = 12;
index_end = find(time == t_end);

figure;
hold on
plot(time(1:index_end), kin.sigma_xx(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), kin.sigma_yy(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), kin.sigma_zz(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), kin.sigma_vm(1:index_end), '--', 'LineWidth', 2.5);
plot(time(1:index_end), kin.sigma_equi(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), kin.sigma_yield(1:index_end), 'LineWidth', 2.5);
hold off
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Stress [MPa]', 'FontSize',18)
set(gca,'fontsize',20)

lgd = legend('$\sigma_{xx}$', '$\sigma_{yy}$', '$\sigma_{zz}$', '$\overline\sigma^{\mathrm{vm}}$', '$\overline\sigma$', '$\sigma_y$');
set(lgd,'interpreter','Latex','FontSize',25, 'Location', 'southeast');
set(gca,'fontsize',20)

set(gcf, 'PaperPositionMode','auto')
print(gcf,'lin2_kin_stress','-depsc')

%% kin strain

t_end = 12;
index_end = find(time == t_end);

figure;
hold on
plot(time(1:index_end), kin.e_xx(1:index_end)*100, 'LineWidth', 2.5);
plot(time(1:index_end), kin.e_yy(1:index_end)*100, 'LineWidth', 2.5);
plot(time(1:index_end), kin.e_zz(1:index_end)*100, 'LineWidth', 2.5);
plot(time(1:index_end), kin.e_pl(1:index_end)*100, 'LineWidth', 2.5);
hold off
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Strain [%]', 'FontSize', 18)
set(gca,'fontsize',20)

lgd = legend('$\varepsilon_{xx}$', '$\varepsilon_{yy}$', '$\varepsilon_{zz}$', '$\overline\varepsilon^{\mathrm{vp}}$');
set(lgd,'interpreter','Latex','FontSize',25, 'Location', 'best');
set(gca,'fontsize',20)

set(gcf, 'PaperPositionMode','auto')
print(gcf,'lin2_kin_strain','-depsc')

%% kin backstress
t_end = 12;
index_end = find(time == t_end);
kin.alpha = equivalent_stress(kin.a_xx, kin.a_yy, kin.a_zz, kin.a_xy, kin.a_xz, kin.a_yz);

figure;
hold on
plot(time(1:index_end), kin.a_xx(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), kin.a_yy(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), kin.a_zz(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), kin.alpha(1:index_end), 'LineWidth', 2.5);
hold off
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Stress [MPa]', 'FontSize',18)
set(gca,'fontsize',20)

lgd = legend('$\alpha_{xx}$', '$\alpha_{yy}$', '$\alpha_{zz}$', '$\overline\alpha$');
set(lgd,'interpreter','Latex','FontSize',25, 'Location', 'southeast');
set(gca,'fontsize',20)

set(gcf, 'PaperPositionMode','auto')
print(gcf,'lin2_kin_backstress','-depsc')

%% mix stress
t_end = 12;
index_end = find(time == t_end);

figure;
hold on
plot(time(1:index_end), mix.sigma_xx(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), mix.sigma_yy(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), mix.sigma_zz(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), mix.sigma_vm(1:index_end), '--', 'LineWidth', 2.5);
plot(time(1:index_end), kin.sigma_equi(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), mix.sigma_yield(1:index_end), 'LineWidth', 2.5);
hold off
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Stress [MPa]', 'FontSize',18)
set(gca,'fontsize',20)

lgd = legend('$\sigma_{xx}$', '$\sigma_{yy}$', '$\sigma_{zz}$', '$\overline\sigma^{\mathrm{vm}}$', '$\overline\sigma$', '$\sigma_y$');
set(lgd,'interpreter','Latex','FontSize',25, 'Location', 'southeast');
set(gca,'fontsize',20)

set(gcf, 'PaperPositionMode','auto')
print(gcf,'lin2_mix_stress','-depsc')

%% mix strain

t_end = 12;
index_end = find(time == t_end);

figure;
hold on
plot(time(1:index_end), mix.e_xx(1:index_end)*100, 'LineWidth', 2.5);
plot(time(1:index_end), mix.e_yy(1:index_end)*100, 'LineWidth', 2.5);
plot(time(1:index_end), mix.e_zz(1:index_end)*100, 'LineWidth', 2.5);
plot(time(1:index_end), mix.e_pl(1:index_end)*100, 'LineWidth', 2.5);
hold off
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Strain [%]', 'FontSize', 18)
set(gca,'fontsize',20)

lgd = legend('$\varepsilon_{xx}$', '$\varepsilon_{yy}$', '$\varepsilon_{zz}$', '$\overline\varepsilon^{\mathrm{vp}}$');
set(lgd,'interpreter','Latex','FontSize',25, 'Location', 'best');
set(gca,'fontsize',20)

set(gcf, 'PaperPositionMode','auto')
print(gcf,'lin2_mix_strain','-depsc')

%% mix backstress
t_end = 12;
index_end = find(time == t_end);
mix.alpha = equivalent_stress(mix.a_xx, mix.a_yy, mix.a_zz, mix.a_xy, mix.a_xz, mix.a_yz);

figure;
hold on
plot(time(1:index_end), mix.a_xx(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), mix.a_yy(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), mix.a_zz(1:index_end), 'LineWidth', 2.5);
plot(time(1:index_end), mix.alpha(1:index_end), 'LineWidth', 2.5);
hold off
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Stress [MPa]', 'FontSize',18)
set(gca,'fontsize',20)

lgd = legend('$\alpha_{xx}$', '$\alpha_{yy}$', '$\alpha_{yy}$', '$\overline\alpha$');
set(lgd,'interpreter','Latex','FontSize',25, 'Location', 'northeast');
set(gca,'fontsize',20)

set(gcf, 'PaperPositionMode','auto')
print(gcf,'lin2_mix_backstress','-depsc')
