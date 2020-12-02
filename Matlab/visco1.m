%% Load metafor data in Matlab and create plots 
resultPath{1} = '../workspace/visco1_iso_eta0';
resultPath{2} = '../workspace/visco1_iso_eta02';
resultPath{3} = '../workspace/visco1_iso_eta3';

results(1, :, :) = importResults(resultPath{1});
results(2, :, :) = importResults(resultPath{2});
results(3, :, :) = importResults(resultPath{3});

% 2: sigma xx
iso.sigma_xx(1, :) = results(1, :, 2);
iso.sigma_xx(2, :) = results(2, :, 2);
iso.sigma_xx(3, :) = results(3, :, 2);
% 5: sigma vm
iso.sigma_vm(1, :) = results(1, :, 5);
iso.sigma_vm(2, :) = results(2, :, 5);
iso.sigma_vm(3, :) = results(3, :, 5);
% 6: sigma yield
iso.sigma_yield(1, :) = results(1, :, 6);
iso.sigma_yield(2, :) = results(2, :, 6);
iso.sigma_yield(3, :) = results(3, :, 6);
% 7: e_pl
iso.e_pl(1, :) = results(1, :, 7);
iso.e_pl(2, :) = results(2, :, 7);
iso.e_pl(3, :) = results(3, :, 7);
% 8: e_xx
iso.e_xx(1, :) = results(1, :, 8);
iso.e_xx(2, :) = results(2, :, 8);
iso.e_xx(3, :) = results(3, :, 8);


%% Load metafor data in Matlab and create plots 
resultPath{1} = '../workspace/visco1_mix_eta0';
resultPath{2} = '../workspace/visco1_mix_eta02';
resultPath{3} = '../workspace/visco1_mix_eta3';

results(1, :, :) = importResults(resultPath{1});
results(2, :, :) = importResults(resultPath{2});
results(3, :, :) = importResults(resultPath{3});

% 2: sigma xx
mix.sigma_xx(1, :) = results(1, :, 2);
mix.sigma_xx(2, :) = results(2, :, 2);
mix.sigma_xx(3, :) = results(3, :, 2);
% 5: sigma vm
mix.sigma_vm(1, :) = results(1, :, 5);
mix.sigma_vm(2, :) = results(2, :, 5);
mix.sigma_vm(3, :) = results(3, :, 5);
% 6: sigma yield
mix.sigma_yield(1, :) = results(1, :, 6);
mix.sigma_yield(2, :) = results(2, :, 6);
mix.sigma_yield(3, :) = results(3, :, 6);
% 7: e_pl
mix.e_pl(1, :) = results(1, :, 7);
mix.e_pl(2, :) = results(2, :, 7);
mix.e_pl(3, :) = results(3, :, 7);
% 8: e_xx
mix.e_xx(1, :) = results(1, :, 8);
mix.e_xx(2, :) = results(2, :, 8);
mix.e_xx(3, :) = results(3, :, 8);

%% plot sigma
time = results(1, :, 1);
t_end = 10;
index_end = find(time == t_end);
% iso
figure
h_iso = subplot(1, 3, 1);
hold on
plot(time(1:index_end), iso.sigma_vm(1, 1:index_end), 'LineWidth', 2.5)
plot(time(1:index_end), iso.sigma_xx(1, 1:index_end), '--', 'LineWidth', 2.5)
plot(time(1:index_end), iso.sigma_yield(1, 1:index_end), 'LineWidth', 2.5)
plot(time(1:index_end), iso.sigma_yield(2, 1:index_end), 'LineWidth', 2.5)
plot(time(1:index_end), iso.sigma_yield(3, 1:index_end), 'LineWidth', 2.5)
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Stress [MPa]', 'FontSize',18)
set(gca,'fontsize',20)

% mix
h_mix = subplot(1, 3, 2);
hold on
h1 = plot(time(1:index_end), mix.sigma_vm(1, 1:index_end), 'LineWidth', 2.5);
h2 = plot(time(1:index_end), mix.sigma_xx(1, 1:index_end), '--', 'LineWidth', 2.5);
h3 = plot(time(1:index_end), mix.sigma_yield(1, 1:index_end), 'LineWidth', 2.5);
h4 = plot(time(1:index_end), mix.sigma_yield(2, 1:index_end), 'LineWidth', 2.5);
h5 = plot(time(1:index_end), mix.sigma_yield(3, 1:index_end), 'LineWidth', 2.5);
hold off
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Stress [MPa]', 'FontSize',18)
set(gca,'fontsize',20)

% legend
hL = subplot(1, 3, 3);
axis(hL,'off');

lgd = legend(hL, [h1, h2, h3, h4, h5], '$\sigma_{vm}$','$\sigma_{xx}$','$\sigma_{Yield} - \eta/h = 0$ [s]','$\sigma_{Yiled} - \eta/h = 0.2$ [s]','$\sigma_{Yield} - \eta/h = 3$ [s]');
set(lgd,'interpreter','Latex','FontSize',25, 'Location', 'best');
set(gca,'fontsize',20)

posh_iso = get(h_iso,'position');
posh_iso(3) = posh_iso(3) * 9/8;
set(h_iso, 'Position', posh_iso);

posh_mix = get(h_mix,'position');
posh_mix(3) = posh_mix(3) * 9/8;
posh_mix(1) = posh_mix(1) + (posh_mix(1) - posh_iso(1)) / 8;
set(h_mix, 'Position', posh_mix);

poshL = get(hL,'position');
poshL(1) = poshL(1) + (posh_mix(1) - posh_iso(1)) / 4;
poshL(3) = poshL(3) * 3/4;
poshL(4) = poshL(4) / 2;
set(hL, 'Position', poshL);
set(lgd,'position',poshL);

pos = get(gcf, 'Position');
pos(3) = pos(3) * 2;
set(gcf, 'Position', pos)

set(gcf, 'PaperPositionMode','auto')
print(gcf,'visco1_stress_graph','-depsc')

%% plot strain
t_end = 20;
index_end = find(time == t_end);
% iso
figure
h_iso = subplot(1, 3, 1);
hold on
plot(time(1:index_end), iso.e_pl(1, 1:index_end)*100, 'LineWidth', 2.5)
plot(time(1:index_end), iso.e_pl(2, 1:index_end)*100, 'LineWidth', 2.5)
plot(time(1:index_end), iso.e_pl(3, 1:index_end)*100, 'LineWidth', 2.5)
plot(time(1:index_end), iso.e_xx(1, 1:index_end)*100, '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5)
plot(time(1:index_end), iso.e_xx(2, 1:index_end)*100, '--', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2.5)
plot(time(1:index_end), iso.e_xx(3, 1:index_end)*100, '--', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2.5)
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Strain [%]', 'FontSize', 18)
set(gca,'fontsize',20)
% axis([0 20 -0.4 1.4]);

% mix
h_mix = subplot(1, 3, 2);
hold on
h1 = plot(time(1:index_end), mix.e_pl(1, 1:index_end)*100, 'LineWidth', 2.5);
h2 = plot(time(1:index_end), mix.e_pl(2, 1:index_end)*100, 'LineWidth', 2.5);
h3 = plot(time(1:index_end), mix.e_pl(3, 1:index_end)*100, 'LineWidth', 2.5);
h4 = plot(time(1:index_end), mix.e_xx(1, 1:index_end)*100, '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5);
h5 = plot(time(1:index_end), mix.e_xx(2, 1:index_end)*100, '--', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2.5);
h6 = plot(time(1:index_end), mix.e_xx(3, 1:index_end)*100, '--', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2.5);
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Strain [%]', 'FontSize', 18)
set(gca,'fontsize',20)
% axis([0 20 -0.4 1.4]);

% legend
hL = subplot(1, 3, 3);
axis(hL,'off');

lgd = legend(hL, [h1, h2, h3, h4, h5, h6], '$\epsilon^{vp} - \eta/h = 0$ [s]','$\epsilon^{vp} - \eta/h = 0.2$ [s]','$\epsilon^{vp} - \eta/h = 3$ [s]','$\epsilon_{xx} - \eta/h = 0$ [s]','$\epsilon_{xx} - \eta/h = 0.2$ [s]','$\epsilon_{xx} - \eta/h = 3$ [s]');
set(lgd,'interpreter','Latex','FontSize',25, 'Location', 'best');
set(gca,'fontsize',20)

posh_iso = get(h_iso,'position');
posh_iso(3) = posh_iso(3) * 9/8;
set(h_iso, 'Position', posh_iso);

posh_mix = get(h_mix,'position');
posh_mix(3) = posh_mix(3) * 9/8;
posh_mix(1) = posh_mix(1) + (posh_mix(1) - posh_iso(1)) / 8;
set(h_mix, 'Position', posh_mix);

poshL = get(hL,'position');
poshL(1) = poshL(1) + (posh_mix(1) - posh_iso(1)) / 4;
poshL(3) = poshL(3) * 3/4;
poshL(4) = poshL(4) / 2;
set(hL, 'Position', poshL);
set(lgd,'position',poshL);

pos = get(gcf, 'Position');
pos(3) = pos(3) * 2;
set(gcf, 'Position', pos)

set(gcf, 'PaperPositionMode','auto')
print(gcf,'visco1_strain_graph','-depsc')

%% backstress
time = results(1, :, 1);
t_end = 20;
index_end = find(time == t_end);

mix.alpha_xx(1, :) = results(1, :, 11);
mix.alpha_xx(2, :) = results(2, :, 11);
mix.alpha_xx(3, :) = results(3, :, 11);

mix.alpha_yy(1, :) = results(1, :, 12);
mix.alpha_yy(2, :) = results(2, :, 12);
mix.alpha_yy(3, :) = results(3, :, 12);

mix.alpha_zz(1, :) = results(1, :, 13);
mix.alpha_zz(2, :) = results(2, :, 13);
mix.alpha_zz(3, :) = results(3, :, 13);

mix.alpha_xy(1, :) = results(1, :, 14);
mix.alpha_xy(2, :) = results(2, :, 14);
mix.alpha_xy(3, :) = results(3, :, 14);

mix.alpha_xz(1, :) = results(1, :, 15);
mix.alpha_xz(2, :) = results(2, :, 15);
mix.alpha_xz(3, :) = results(3, :, 15);

mix.alpha_yz(1, :) = results(1, :, 16);
mix.alpha_yz(2, :) = results(2, :, 16);
mix.alpha_yz(3, :) = results(3, :, 16);

% computing backstress
alpha(1, :) = sqrt(3/2 * (mix.alpha_xx(1, :).^2 + mix.alpha_yy(1, :).^2 + mix.alpha_zz(1, :).^2 + mix.alpha_xy(1, :).^2 + mix.alpha_xz(1, :).^2 + mix.alpha_yz(1, :).^2));
alpha(2, :) = sqrt(3/2 * (mix.alpha_xx(2, :).^2 + mix.alpha_yy(2, :).^2 + mix.alpha_zz(2, :).^2 + mix.alpha_xy(2, :).^2 + mix.alpha_xz(2, :).^2 + mix.alpha_yz(2, :).^2));
alpha(3, :) = sqrt(3/2 * (mix.alpha_xx(3, :).^2 + mix.alpha_yy(3, :).^2 + mix.alpha_zz(3, :).^2 + mix.alpha_xy(3, :).^2 + mix.alpha_xz(3, :).^2 + mix.alpha_yz(3, :).^2));

h_fig = figure;
h_stress = subplot(1, 2, 1);
hold on;
h1 = plot(time, alpha(1, :), 'LineWidth', 2.5);
h2 = plot(time, alpha(2, :), 'LineWidth', 2.5);
h3 = plot(time, alpha(3, :), 'LineWidth', 2.5);

grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Equivalent backstress [MPa]', 'FontSize',18)
set(gca,'fontsize',20)

h_lgd = subplot(1, 2, 2);
axis(h_lgd,'off');
lgd = legend(h_lgd, [h1, h2, h3], '$\overline \alpha - \eta/h = 0$ [s]','$\overline \alpha - \eta/h = 0.2$ [s]','$\overline \alpha - \eta/h = 3$ [s]');
set(lgd,'interpreter','Latex','FontSize',25, 'Location', 'south');
set(gca,'fontsize',20)

posh_fig = get(h_fig, 'position');
posh_fig(3) = posh_fig(3) * 1.5;
set(h_fig, 'Position', posh_fig);

posh_stress = get(h_stress, 'position');
posh_stress(3) = posh_stress(3) * 6/4;
set(h_stress, 'Position', posh_stress);

posh_lgd = get(h_lgd, 'position');
posh_lgd(3) = posh_lgd(3) * 2/4;
posh_lgd(1) = posh_lgd(1) + 2/4 * (posh_lgd(1) - posh_stress(1));
set(h_lgd, 'Position', posh_lgd);

set(gcf, 'PaperPositionMode','auto')
print(gcf,'visco1_backstress_graph','-depsc')
