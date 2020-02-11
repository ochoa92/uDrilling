% =========================================================================
% Project Name: TOOLING4G - Micro-Drilling
% Author      : Hélio Ochoa
% Description : Operator results during co-manipulation stage
% =========================================================================
clear all;
clc;
close all;

%% POSITION
% t p_x p_y p_z Q_x Q_y Q_z Q_w Fx Fy Fz pEE_x pEE_y pEE_z
% 0.6 mm
P = importdata('position_operator_results/new/06mm');
t_06 = P.data(:,1);
pz_06 = P.data(:,4);

% 0.5 mm
P = importdata('position_operator_results/new/05mm');
t_05 = P.data(:,1);
pz_05 = P.data(:,4);

% 0.4 mm
P = importdata('position_operator_results/new/04mm');
t_04 = P.data(:,1);
pz_04 = P.data(:,4);

%% plot position
figure(1);
hold on
plot(t_06, pz_06, 'b', 'linewidth',2)
plot(t_05, pz_05, 'g', 'linewidth',2)
plot(t_04, pz_04, 'r', 'linewidth',2)
grid on;
xlabel('t(s)', 'FontSize', 30);
ylabel('P_{z}(m)', 'FontSize', 30);
legend('operator (0.6 mm drill)','operator (0.5 mm drill)','operator (0.4 mm drill)', 'FontSize', 20)
set(gca,'FontSize',30)
xlim([0 90])
ylim([0.23 0.41])
box on

%% FORCE
% t Fx Fy Fz
F = importdata('force_operator_results/0.6mm/1');
t_06 = F.data(:,1);
Fz_06 = F.data(:,4);

F = importdata('force_operator_results/0.5mm/4');
t_05 = F.data(:,1);
Fz_05 = F.data(:,4);

F = importdata('force_operator_results/0.4mm/2');
t_04 = F.data(:,1);
Fz_04 = F.data(:,4);

%% plot force
figure(2);
hold on
plot(t_06, Fz_06, 'b', 'linewidth',2)
plot(t_05, Fz_05, 'g', 'linewidth',2)
plot(t_04, Fz_04, 'r', 'linewidth',2)
grid on;
xlabel('t(s)', 'FontSize', 30);
ylabel('F_{z}(N)', 'FontSize', 30);
legend('operator (0.6 mm drill)','operator (0.5 mm drill)','operator (0.4 mm drill)', 'FontSize', 20)
set(gca,'FontSize',30)
xlim([0 72])
% ylim([0.23 0.41])
box on


