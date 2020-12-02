clear all
close all

load time.ascii

load EPL.ascii
load E_XX.ascii
load E_YY.ascii
load E_ZZ.ascii

load A_XX.ascii
load A_YY.ascii
load A_ZZ.ascii

load Sigma_Yield.ascii
load Sigma_XX.ascii
load Sigma_YY.ascii
load Sigma_ZZ.ascii
load SigmaVM.ascii

%% Strain graph
figure
plot(time, EPL*100, 'g', 'LineWidth', 1.5)
hold on
plot(time, E_XX*100, 'k', 'LineWidth', 1.5)
plot(time, E_YY*100, 'b:', 'LineWidth', 2.5)
plot(time, E_ZZ*100, 'r--', 'LineWidth', 1.5)
grid on
xlabel('Time [s]', 'FontSize', 18)
ylabel('Strain [%]', 'FontSize', 18)
h=legend('$\bar{\varepsilon}^{p}$', '$\epsilon_x$', '$\epsilon_y$', '$\epsilon_z$');
set(h,'interpreter','Latex','FontSize',25, 'Location', 'best');
set(gca,'fontsize',20)

saveas(gcf, 'strain_graph.epsc')

%% Stress graph
figure
plot(time, Sigma_XX, 'k:', 'LineWidth', 2.5)
hold on
plot(time, Sigma_YY, 'b:', 'LineWidth', 2.5)
plot(time, Sigma_ZZ, 'r--', 'LineWidth', 1.5)
plot(time, SigmaVM, 'g--', 'LineWidth', 1.5)
plot(time, Sigma_Yield, 'c', 'LineWidth', 1.5)
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Stress [MPa]', 'FontSize',18)
h=legend('$\sigma_x$','$\sigma_y$','$\sigma_z$','$\sigma_{vm}$','$\sigma_{Yield}$');
set(h,'interpreter','Latex','FontSize',25, 'Location', 'best');
set(gca,'fontsize',20)

saveas(gcf, 'stress_graph.epsc')

%% Back-stress graph
figure
plot(time, A_XX, 'k', 'LineWidth', 1.5)
hold on
plot(time, A_YY, 'b:', 'LineWidth', 2.5)
plot(time, A_ZZ, 'r--', 'LineWidth', 1.5)
grid on
xlabel('Time [s]', 'FontSize',18)
ylabel('Backstress \alpha [MPa]', 'FontSize',18)
h=legend('$\alpha_x$','$\alpha_y$','$\alpha_z$');
set(h,'interpreter','Latex','FontSize',25, 'Location', 'best');
set(gca,'fontsize',20)

saveas(gcf, 'Backstress_graph.epsc')