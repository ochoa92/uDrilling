% =========================================================================
% Project Name: TOOLING4G - Micro-Drilling
% Author      : Hélio Ochoa
% Description : Operator results during co-manipulation stage
% =========================================================================
clear all;
clc;
close all;

%% 0.6 mm
%  t p_x p_y p_z Q_x Q_y Q_z Q_w Fx Fy Fz pEE_x pEE_y pEE_z
A = importdata('/home/panda/TOOLING4G/uDrilling/refs_operator/new/06mm');
t_06 = A.data(:,1);
pz_06 = A.data(:,4);
Fz_06 = A.data(:,11);

% plot
figure(1);
plot(t_06, pz_06, 'b', 'linewidth',2)
grid on;
xlabel('t(s)', 'FontSize', 40);
ylabel('P_{z}(m)', 'FontSize', 40);
legend('operator (0.6 mm drill)', 'FontSize', 40)
set(gca,'FontSize',30)

figure(2);
plot(t_06, Fz_06, 'r', 'linewidth',2)
grid on;
xlabel('t(s)', 'FontSize', 40);
ylabel('F_{z}(N)', 'FontSize', 40);
legend('operator (0.6 mm drill)', 'FontSize', 40)
set(gca,'FontSize',30)


%% 0.5 mm
%  t p_x p_y p_z Q_x Q_y Q_z Q_w Fx Fy Fz pEE_x pEE_y pEE_z
A = importdata('/home/panda/TOOLING4G/uDrilling/refs_operator/new/05mm');
t_05 = A.data(:,1);
pz_05 = A.data(:,4);
Fz_05 = A.data(:,11);

% plot
figure(3);
plot(t_05, pz_05, 'b', 'linewidth',2)
grid on;
xlabel('t(s)', 'FontSize', 40);
ylabel('P_{z}(m)', 'FontSize', 40);
legend('operator (0.5 mm drill)', 'FontSize', 40)
set(gca,'FontSize',30)

figure(4);
plot(t_05, Fz_05, 'r', 'linewidth',2)
grid on;
xlabel('t(s)', 'FontSize', 40);
ylabel('F_{z}(N)', 'FontSize', 40);
legend('operator (0.5 mm drill)', 'FontSize', 40)
set(gca,'FontSize',30)

%% 0.4 mm
%  t p_x p_y p_z Q_x Q_y Q_z Q_w Fx Fy Fz pEE_x pEE_y pEE_z
A = importdata('/home/panda/TOOLING4G/uDrilling/refs_operator/new/04mm');
t_04 = A.data(:,1);
pz_04 = A.data(:,4);
Fz_04 = A.data(:,11);

% plot
figure(5);
plot(t_04, pz_04, 'b', 'linewidth',2)
grid on;
xlabel('t(s)', 'FontSize', 40);
ylabel('P_{z}(m)', 'FontSize', 40);
ylim([0.2 0.36])
legend('operator (0.4 mm drill)', 'FontSize', 40)
set(gca,'FontSize',30)

figure(6);
plot(t_04, Fz_04, 'r', 'linewidth',2)
grid on;
xlabel('t(s)', 'FontSize', 40);
ylabel('F_{z}(N)', 'FontSize', 40);
legend('operator (0.4 mm drill)', 'FontSize', 40)
set(gca,'FontSize',30)