n = 1;
%--------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
%fh = figure('WindowState', 'maximized')
%set(Figure2,'defaulttextinterpreter','latex');
NL0t250 = importResults('NL0-t250');
NL0t300 = importResults('NL0-t300');
NL0t350 = importResults('NL0-t350');
NL0t400 = importResults('NL0-t400');
time0250 = NL0t250(:,1);
EPL250 = NL0t250(:,7);
time0300 = NL0t300(:,1);
EPL300 = NL0t300(:,7);
time0350 = NL0t350(:,1);
EPL350 = NL0t350(:,7);
time0400 = NL0t400(:,1);
EPL400 = NL0t400(:,7);
plot(time0250,EPL250,'linewidth',2.0);
hold on
plot(time0300,EPL300,'linewidth',2.0);
plot(time0350,EPL350,'linewidth',2.0);
plot(time0400,EPL400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\overline{\varepsilon}^{\mathrm{p}}$ [ \% ]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 8]);
set(gca,'YLim',[0 0.16]);
set(gca,'XTick',[0:4:16]);
set(gca,'YTick',[0:0.02:0.16]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
%Lx = 60; Ly = 70;
%set(gcf,'paperunits','inches');
%set(gcf,'papersize',[Lx Ly]);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL0_EPL','-depsc');
n = n+1;
%-------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
%fh = figure('WindowState', 'maximized')
%set(Figure2,'defaulttextinterpreter','latex');
NL1t250 = importResults('NL1-t250');
NL1t300 = importResults('NL1-t300');
NL1t350 = importResults('NL1-t350');
NL1t400 = importResults('NL1-t400');
time1250 = NL1t250(:,1);
EPL250 = NL1t250(:,7);
time1300 = NL1t300(:,1);
EPL300 = NL1t300(:,7);
time1350 = NL1t350(:,1);
EPL350 = NL1t350(:,7);
time1400 = NL1t400(:,1);
EPL400 = NL1t400(:,7);
plot(time1250,EPL250,'linewidth',2.0);
hold on
plot(time1300,EPL300,'linewidth',2.0);
plot(time1350,EPL350,'linewidth',2.0);
plot(time1400,EPL400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\overline{\varepsilon}^{\mathrm{p}}$ [ \% ]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 8]);
set(gca,'YLim',[0 0.05]);
set(gca,'XTick',[0:2:8]);
set(gca,'YTick',[0:0.01:0.05]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
%Lx = 60; Ly = 70;
%set(gcf,'paperunits','inches');
%set(gcf,'papersize',[Lx Ly]);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL1_EPL','-depsc');
n = n+1;
%-------------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
%fh = figure('WindowState', 'maximized')
%set(Figure2,'defaulttextinterpreter','latex');
NL2t250 = importResults('NL2-t250');
NL2t300 = importResults('NL2-t300');
NL2t350 = importResults('NL2-t350');
NL2t400 = importResults('NL2-t400');
time2250 = NL2t250(:,1);
EPL250 = NL2t250(:,7);
time2300 = NL2t300(:,1);
EPL300 = NL2t300(:,7);
time2350 = NL2t350(:,1);
EPL350 = NL2t350(:,7);
time2400 = NL2t400(:,1);
EPL400 = NL2t400(:,7);
plot(time2250,EPL250,'linewidth',2.0);
hold on
plot(time2300,EPL300,'linewidth',2.0);
plot(time2350,EPL350,'linewidth',2.0);
plot(time2400,EPL400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\overline{\varepsilon}^{\mathrm{p}}$ [ \% ]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 8]);
set(gca,'YLim',[0 0.08]);
set(gca,'XTick',[0:2:8]);
set(gca,'YTick',[0:0.02:0.08]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
%Lx = 60; Ly = 70;
%set(gcf,'paperunits','inches');
%set(gcf,'papersize',[Lx Ly]);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL2_EPL','-depsc');
n = n+1;
%-------------------------------------------------------------------------------
%-------------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
EXX250 = NL0t250(:,8);
EXX300 = NL0t300(:,8);
EXX350 = NL0t350(:,8);
EXX400 = NL0t400(:,8);
plot(time0250,EXX250,'linewidth',2.0);
hold on
plot(time0300,EXX300,'linewidth',2.0);
plot(time0350,EXX350,'linewidth',2.0);
plot(time0400,EXX400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\varepsilon_{xx}$ [\% ]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 16]);
set(gca,'YLim',[-0.03 0.03]);
set(gca,'XTick',[0:4:16]);
set(gca,'YTick',[-0.03:0.015:0.03]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL0_EXX','-depsc');
n = n+1;
%-------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
EXX250 = NL1t250(:,8);
EXX300 = NL1t300(:,8);
EXX350 = NL1t350(:,8);
EXX400 = NL1t400(:,8);
plot(time1250,EXX250,'linewidth',2.0);
hold on
plot(time1300,EXX300,'linewidth',2.0);
plot(time1350,EXX350,'linewidth',2.0);
plot(time1400,EXX400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\varepsilon_{xx}$ [\% ]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 16]);
set(gca,'YLim',[-0.015 0.015]);
set(gca,'XTick',[0:4:16]);
set(gca,'YTick',[-0.02:0.005:0.015]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL1_EXX','-depsc');
n = n+1;
%-------------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
EXX250 = NL2t250(:,8);
EXX300 = NL2t300(:,8);
EXX350 = NL2t350(:,8);
EXX400 = NL2t400(:,8);
plot(time2250,EXX250,'linewidth',2.0);
hold on
plot(time2300,EXX300,'linewidth',2.0);
plot(time2350,EXX350,'linewidth',2.0);
plot(time2400,EXX400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\varepsilon_{xx}$ [\% ]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 16]);
set(gca,'YLim',[-0.02 0.02]);
set(gca,'XTick',[0:4:16]);
set(gca,'YTick',[-0.02:0.005:0.02]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL2_EXX','-depsc');
n = n+1;
%-------------------------------------------------------------------------------
%-------------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.6, 0.96]);
EYY250 = NL0t250(:,9);
EYY300 = NL0t300(:,9);
EYY350 = NL0t350(:,9);
EYY400 = NL0t400(:,9);
plot(time0250,EYY250,'linewidth',2.0);
hold on
plot(time0300,EYY300,'linewidth',2.0);
plot(time0350,EYY350,'linewidth',2.0);
plot(time0400,EYY400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\varepsilon_{yy}$ [\% ]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 16]);
set(gca,'YLim',[0 0.01]);
set(gca,'XTick',[0:4:16]);
set(gca,'YTick',[0:0.005:0.01]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL0_EYY','-depsc');
n = n+1;
%-------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.6, 0.96]);
EYY250 = NL1t250(:,9);
EYY300 = NL1t300(:,9);
EYY350 = NL1t350(:,9);
EYY400 = NL1t400(:,9);
plot(time1250,EYY250,'linewidth',2.0);
hold on
plot(time1300,EYY300,'linewidth',2.0);
plot(time1350,EYY350,'linewidth',2.0);
plot(time1400,EYY400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\varepsilon_{yy}$ [\% ]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 16]);
set(gca,'YLim',[0 0.01]);
set(gca,'XTick',[0:4:16]);
set(gca,'YTick',[0:0.005:0.01]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL1_EYY','-depsc');
n = n+1;
%-------------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.6, 0.96]);
EYY250 = NL2t250(:,9);
EYY300 = NL2t300(:,9);
EYY350 = NL2t350(:,9);
EYY400 = NL2t400(:,9);
plot(time2250,EYY250,'linewidth',2.0);
hold on
plot(time2300,EYY300,'linewidth',2.0);
plot(time2350,EYY350,'linewidth',2.0);
plot(time2400,EYY400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\varepsilon_{yy}$ [\% ]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 16]);
set(gca,'YLim',[0 0.01]);
set(gca,'XTick',[0:4:16]);
set(gca,'YTick',[0:0.005:0.01]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL2_EYY','-depsc');
n = n+1;
%-------------------------------------------------------------------------------
%-------------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
AXX250 = NL0t250(:,11);
AXX300 = NL0t300(:,11);
AXX350 = NL0t350(:,11);
AXX400 = NL0t400(:,11);
plot(time0250,AXX250,'linewidth',2.0);
hold on
plot(time0300,AXX300,'linewidth',2.0);
plot(time0350,AXX350,'linewidth',2.0);
plot(time0400,AXX400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\alpha_{xx}$ [MPa]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 16]);
set(gca,'YLim',[-300 150]);
set(gca,'XTick',[0:4:16]);
set(gca,'YTick',[-300:75:150]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL0_AXX','-depsc');
n = n+1;
%-------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
AXX250 = NL1t250(:,11);
AXX300 = NL1t300(:,11);
AXX350 = NL1t350(:,11);
AXX400 = NL1t400(:,11);
plot(time1250,AXX250,'linewidth',2.0);
hold on
plot(time1300,AXX300,'linewidth',2.0);
plot(time1350,AXX350,'linewidth',2.0);
plot(time1400,AXX400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\alpha_{xx}$ [MPa]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 16]);
set(gca,'YLim',[-200 150]);
set(gca,'XTick',[0:4:16]);
set(gca,'YTick',[-200:50:150]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL1_AXX','-depsc');
n = n+1;
%-------------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
AXX250 = NL2t250(:,11);
AXX300 = NL2t300(:,11);
AXX350 = NL2t350(:,11);
AXX400 = NL2t400(:,11);
plot(time2250,AXX250,'linewidth',2.0);
hold on
plot(time2300,AXX300,'linewidth',2.0);
plot(time2350,AXX350,'linewidth',2.0);
plot(time2400,AXX400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\alpha_{xx}$ [MPa]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 16]);
set(gca,'YLim',[-200 150]);
set(gca,'XTick',[0:4:16]);
set(gca,'YTick',[-200:50:150]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL2_AXX','-depsc');
n = n+1;
%-------------------------------------------------------------------------------
%-------------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
AXX250 = NL0t250(:,11);
AYY250 = NL0t250(:,12);
AZZ250 = NL0t250(:,13);
AEqu250 = sqrt((3/2) * (AXX250.^2 + AYY250.^2 + AZZ250.^2));

AXX300 = NL0t300(:,11);
AYY300 = NL0t300(:,12);
AZZ300 = NL0t300(:,13);
AEqu300 = sqrt((3/2) * (AXX300.^2 + AYY300.^2 + AZZ300.^2));

AXX350 = NL0t350(:,11);
AYY350 = NL0t350(:,12);
AZZ350 = NL0t350(:,13);
AEqu350 = sqrt((3/2) * (AXX350.^2 + AYY350.^2 + AZZ350.^2));

AXX400 = NL0t400(:,11);
AYY400 = NL0t400(:,12);
AZZ400 = NL0t400(:,13);
AEqu400 = sqrt((3/2) * (AXX400.^2 + AYY400.^2 + AZZ400.^2));

plot(time0250,AEqu250,'linewidth',2.0);
hold on
plot(time0300,AEqu300,'linewidth',2.0);
plot(time0350,AEqu350','linewidth',2.0);
plot(time0400,AEqu400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\overline{\alpha }$ [MPa]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 16]);
set(gca,'YLim',[-150 250]);
set(gca,'XTick',[0:4:16]);
set(gca,'YTick',[-150:50:250]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL0_AEqu','-depsc');
n = n+1;
%-------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
AXX250 = NL1t250(:,11);
AYY250 = NL1t250(:,12);
AZZ250 = NL1t250(:,13);
AEqu250 = sqrt((3/2) * (AXX250.^2 + AYY250.^2 + AZZ250.^2));

AXX300 = NL1t300(:,11);
AYY300 = NL1t300(:,12);
AZZ300 = NL1t300(:,13);
AEqu300 = sqrt((3/2) * (AXX300.^2 + AYY300.^2 + AZZ300.^2));

AXX350 = NL1t350(:,11);
AYY350 = NL1t350(:,12);
AZZ350 = NL1t350(:,13);
AEqu350 = sqrt((3/2) * (AXX350.^2 + AYY350.^2 + AZZ350.^2));

AXX400 = NL1t400(:,11);
AYY400 = NL1t400(:,12);
AZZ400 = NL1t400(:,13);
AEqu400 = sqrt((3/2) * (AXX400.^2 + AYY400.^2 + AZZ400.^2));

plot(time1250,AEqu250,'linewidth',2.0);
hold on
plot(time1300,AEqu300,'linewidth',2.0);
plot(time1350,AEqu350','linewidth',2.0);
plot(time1400,AEqu400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\overline{\alpha }$ [MPa ]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 16]);
set(gca,'YLim',[-100 150]);
set(gca,'XTick',[0:4:16]);
set(gca,'YTick',[-100:50:150]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL1_AEqu','-depsc');
n = n+1;
%-------------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
AXX250 = NL2t250(:,11);
AYY250 = NL2t250(:,12);
AZZ250 = NL2t250(:,13);
AEqu250 = sqrt((3/2) * (AXX250.^2 + AYY250.^2 + AZZ250.^2));

AXX300 = NL2t300(:,11);
AYY300 = NL2t300(:,12);
AZZ300 = NL2t300(:,13);
AEqu300 = sqrt((3/2) * (AXX300.^2 + AYY300.^2 + AZZ300.^2));

AXX350 = NL2t350(:,11);
AYY350 = NL2t350(:,12);
AZZ350 = NL2t350(:,13);
AEqu350 = sqrt((3/2) * (AXX350.^2 + AYY350.^2 + AZZ350.^2));

AXX400 = NL2t400(:,11);
AYY400 = NL2t400(:,12);
AZZ400 = NL2t400(:,13);
AEqu400 = sqrt((3/2) * (AXX400.^2 + AYY400.^2 + AZZ400.^2));

plot(time2250,AEqu250,'linewidth',2.0);
hold on
plot(time2300,AEqu300,'linewidth',2.0);
plot(time2350,AEqu350,'linewidth',2.0);
plot(time2400,AEqu400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\overline{\alpha }$ [MPa]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 16]);
set(gca,'YLim',[-100 150]);
set(gca,'XTick',[0:4:16]);
set(gca,'YTick',[-100:50:150]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL2_AEqu','-depsc');
n = n+1;
%-------------------------------------------------------------------------------
%-------------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
SXX250 = NL0t250(:,2);
SXX300 = NL0t300(:,2);
SXX350 = NL0t350(:,2);
SXX400 = NL0t400(:,2);
plot(time0250,SXX250,'linewidth',2.0);
hold on
plot(time0300,SXX300,'linewidth',2.0);
plot(time0350,SXX350,'linewidth',2.0);
plot(time0400,SXX400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\sigma_{xx}$ [MPa]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 4]);
set(gca,'YLim',[-500 1000]);
set(gca,'XTick',[0:1:4]);
set(gca,'YTick',[-500:250:1000]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL0_SXX','-depsc');
n = n+1;
%-------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
SXX250 = NL1t250(:,2);
SXX300 = NL1t300(:,2);
SXX350 = NL1t350(:,2);
SXX400 = NL1t400(:,2);
plot(time1250,SXX250,'linewidth',2.0);
hold on
plot(time1300,SXX300,'linewidth',2.0);
plot(time1350,SXX350,'linewidth',2.0);
plot(time1400,SXX400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\sigma_{xx}$ [MPa]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 8]);
set(gca,'YLim',[-500 1000]);
set(gca,'XTick',[0:2:8]);
set(gca,'YTick',[-500:250:1000]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL1_SXX','-depsc');
n = n+1;
%-------------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.4, 0.96]);
SXX250 = NL2t250(:,2);
SXX300 = NL2t300(:,2);
SXX350 = NL2t350(:,2);
SXX400 = NL2t400(:,2);
plot(time2250,SXX250,'linewidth',2.0);
hold on
plot(time2300,SXX300,'linewidth',2.0);
plot(time2350,SXX350,'linewidth',2.0);
plot(time2400,SXX400,'linewidth',2.0);
legend('$t_{max} = 250$ [MPa]','$t_{max} = 300$ [MPa]','$t_{max} = 350$ [MPa]','$t_{max} = 400$ [MPa]','location','best','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\sigma_{xx}$ [MPa]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 8]);
set(gca,'YLim',[-500 1000]);
set(gca,'XTick',[0:2:8]);
set(gca,'YTick',[-500:250:1000]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL2_SXX','-depsc');
n = n+1;
%-------------------------------------------------------------------------------
%-------------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.5, 0.96]);
SVM250 = NL0t250(:,5);
SYield250 = NL0t250(:,6);
SVM300 = NL0t300(:,5);
SYield300 = NL0t300(:,6);
SVM350 = NL0t350(:,5);
SYield350 = NL0t350(:,6);
SVM400 = NL0t400(:,5);
SYield400 = NL0t400(:,6);

plot(time0250,SVM250,'linewidth',2.0);
hold on
plot(time0300,SVM300,'linewidth',2.0);
plot(time0350,SVM350,'linewidth',2.0);
plot(time0400,SVM400,'linewidth',2.0);
plot(time0250,SYield250,'--','Color',[0, 0.4470, 0.7410],'linewidth',2.0);
plot(time0300,SYield300,'--','Color',[0.8500, 0.3250, 0.0980],'linewidth',2.0);
plot(time0350,SYield350,'--','Color',[0.9290, 0.6940, 0.1250],'linewidth',2.0);
plot(time0400,SYield400,'--','Color',[0.4940, 0.1840, 0.5560],'linewidth',2.0);
%legend('$\sigma_{\mathrm{VM}}$ for $t_{max} = 250$ [MPa]','$\sigma_{\mathrm{VM}}$ for $t_{max} = 300$ [MPa]','$\sigma_{\mathrm{VM}}$ for $t_{max} = 350$ [MPa]','$\sigma_{\mathrm{VM}}$ for $t_{max} = 400$ [MPa]','$\sigma_{VM}$ for $t_{max} = 250$ [MPa]','$\sigma_{\mathrm{Yield}}$ for $t_{max} = 300$ [MPa]','$\sigma_{\mathrm{Yield}}$ for $t_{max} = 350$ [MPa]','$\sigma_{\mathrm{Yield}}$ for $t_{max} = 400$ [MPa]','location','bestoutside','fontsize',26,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\sigma_{\mathrm{VM}}$ [MPa]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 8]);
set(gca,'YLim',[0 500]);
set(gca,'XTick',[0:2:8]);
set(gca,'YTick',[0:100:500]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL0_SVM','-depsc');
n = n+1;
%-------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.5, 0.96]);
SVM250 = NL1t250(:,5);
SYield250 = NL1t250(:,6);
SVM300 = NL1t300(:,5);
SYield300 = NL1t300(:,6);
SVM350 = NL1t350(:,5);
SYield350 = NL1t350(:,6);
SVM400 = NL1t400(:,5);
SYield400 = NL1t400(:,6);

plot(time1250,SVM250,'linewidth',2.0);
hold on
plot(time1300,SVM300,'linewidth',2.0);
plot(time1350,SVM350,'linewidth',2.0);
plot(time1400,SVM400,'linewidth',2.0);
plot(time1250,SYield250,'--','Color',[0, 0.4470, 0.7410],'linewidth',2.0);
plot(time1300,SYield300,'--','Color',[0.8500, 0.3250, 0.0980],'linewidth',2.0);
plot(time1350,SYield350,'--','Color',[0.9290, 0.6940, 0.1250],'linewidth',2.0);
plot(time1400,SYield400,'--','Color',[0.4940, 0.1840, 0.5560],'linewidth',2.0);
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\sigma_{\mathrm{VM}}$ [\% ]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 8]);
set(gca,'YLim',[0 500]);
set(gca,'XTick',[0:2:8]);
set(gca,'YTick',[0:100:500]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL1_SVM','-depsc');
n = n+1;
%-------------------------------------------------------------------------------
figure(n);
clf;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.75, 0.96]);
SVM250 = NL2t250(:,5);
SYield250 = NL2t250(:,6);
SVM300 = NL2t300(:,5);
SYield300 = NL2t300(:,6);
SVM350 = NL2t350(:,5);
SYield350 = NL2t350(:,6);
SVM400 = NL2t400(:,5);
SYield400 = NL2t400(:,6);

plot(time2250,SVM250,'linewidth',2.0);
hold on
plot(time2300,SVM300,'linewidth',2.0);
plot(time2350,SVM350,'linewidth',2.0);
plot(time2400,SVM400,'linewidth',2.0);
plot(time2250,SYield250,'--','Color',[0, 0.4470, 0.7410],'linewidth',2.0);
plot(time2300,SYield300,'--','Color',[0.8500, 0.3250, 0.0980],'linewidth',2.0);
plot(time2350,SYield350,'--','Color',[0.9290, 0.6940, 0.1250],'linewidth',2.0);
plot(time2400,SYield400,'--','Color',[0.4940, 0.1840, 0.5560],'linewidth',2.0);
legend("$\sigma_{\mathrm{VM}}$ for " +"$t_{max} = 250$ [MPa]","$\sigma_{\mathrm{VM}}$ for  "  +"$t_{max} = 300$ [MPa]","$\sigma_{\mathrm{VM}}$ for  "  +"$t_{max} = 350$ [MPa]","$\sigma_{\mathrm{VM}}$ for  " +"$t_{max} = 400$ [MPa]",newline+"$\sigma_{\mathrm{Yield}}$ for  " +"$t_{max} = 250$ [MPa]","$\sigma_{\mathrm{Yield}}$ for  " +"$t_{max} = 300$ [MPa]","$\sigma_{\mathrm{Yield}}$ for  " +"$t_{max} = 350$ [MPa]","$\sigma_{\mathrm{Yield}}$ for  " +"$t_{max} = 400$ [MPa]",'location','bestoutside','fontsize',22,'fontname','times','interpreter','latex');
xlabel('Time [s]','fontsize',20,'fontname','times','interpreter','latex');
ylabel('$\sigma_{\mathrm{VM}}$ [\% ]','fontsize',20,'fontname','times','interpreter','latex');
set(gca,'XLim',[0 8]);
set(gca,'YLim',[0 500]);
set(gca,'XTick',[0:2:8]);
set(gca,'YTick',[0:100:500]);
grid on
grid minor
set(gca,'fontsize',26,'fontname','Times','LineWidth',0.5);
set(gcf, 'PaperPositionMode','auto');
print(gcf,'NL2_SVM','-depsc');
n = n+1;
%-------------------------------------------------------------------------------