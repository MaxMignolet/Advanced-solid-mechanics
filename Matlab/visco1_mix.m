%%Load metafor data in Matlab and create plots 
resultPath{1} = '../workspace/visco1_mix_eta0';
resultPath{2} = '../workspace/visco1_mix_eta02';
resultPath{3} = '../workspace/visco1_mix_eta3';

results(1, :, :) = importResults(resultPath{1});
results(2, :, :) = importResults(resultPath{2});
results(3, :, :) = importResults(resultPath{3});

% 2: sigma xx
sigma_xx(1, :) = results(1, :, 2);
sigma_xx(2, :) = results(2, :, 2);
sigma_xx(3, :) = results(3, :, 2);
% 5: sigma vm
sigma_vm(1, :) = results(1, :, 5);
sigma_vm(2, :) = results(2, :, 5);
sigma_vm(3, :) = results(3, :, 5);
% 6: sigma yield
sigma_yield(1, :) = results(1, :, 6);
sigma_yield(2, :) = results(2, :, 6);
sigma_yield(3, :) = results(3, :, 6);
% 7: e_pl
e_pl(1, :) = results(1, :, 7);
e_pl(2, :) = results(2, :, 7);
e_pl(3, :) = results(3, :, 7);
% 8: e_xx
e_xx(1, :) = results(1, :, 8);
e_xx(2, :) = results(2, :, 8);
e_xx(3, :) = results(3, :, 8);

%% plot sigma
time = results(1, :, 1);
t_end = 10;
index_end = find(time == t_end);
figure
hold on
plot(time(1:index_end), sigma_vm(1, 1:index_end), 'LineWidth', 2.5)
plot(time(1:index_end), sigma_xx(1, 1:index_end), '--', 'LineWidth', 2.5)
plot(time(1:index_end), sigma_yield(1, 1:index_end), 'LineWidth', 2.5)
plot(time(1:index_end), sigma_yield(2, 1:index_end), 'LineWidth', 2.5)
plot(time(1:index_end), sigma_yield(3, 1:index_end), 'LineWidth', 2.5)
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Stress [MPa]', 'FontSize',18)
h=legend('$\sigma_{vm}$','$\sigma_{xx}$','$\sigma_{y} - \eta/h = 0$ [s]','$\sigma_{y} - \eta/h = 0.2$ [s]','$\sigma_{y} - \eta/h = 3$ [s]');
set(h,'interpreter','Latex','FontSize',25, 'Location', 'best');
set(gca,'fontsize',20)

saveas(gcf, 'visco1_mix_stress_graph.epsc');

%% plot strain
t_end = 20;
index_end = find(time == t_end);
figure
hold on
plot(time(1:index_end), e_pl(1, 1:index_end)*100, 'LineWidth', 2.5)
plot(time(1:index_end), e_pl(2, 1:index_end)*100, 'LineWidth', 2.5)
plot(time(1:index_end), e_pl(3, 1:index_end)*100, 'LineWidth', 2.5)
plot(time(1:index_end), e_xx(1, 1:index_end)*100, '--', 'Color', [0 0.4470 0.7410], 'LineWidth', 2.5)
plot(time(1:index_end), e_xx(2, 1:index_end)*100, '--', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2.5)
plot(time(1:index_end), e_xx(3, 1:index_end)*100, '--', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2.5)
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Strain [%]', 'FontSize', 18)
% h=legend('$\epsilon^{vp} - \eta/h = 0$ [s]','$\epsilon^{vp} - \eta/h = 0.2$ [s]','$\epsilon^{vp} - \eta/h = 3$ [s]','$\epsilon_{xx} - \eta/h = 0$ [s]','$\epsilon_{xx} - \eta/h = 0.2$ [s]','$\epsilon_{xx} - \eta/h = 3$ [s]');
% set(h,'interpreter','Latex','FontSize',25, 'Location', 'best');
set(gca,'fontsize',20)
% axis([0 20 -0.6 1.4]);

saveas(gcf, 'visco1_mix_strain_graph.epsc');
