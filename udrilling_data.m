% =========================================================================
% Project Name: TOOLING4G - Micro-Drilling
% Author      : Hélio Ochoa
% Description : 
% =========================================================================
clear all;
clc;
close all;

%% pattern
% t p_x p_xd p_y p_yd p_z p_zd Yaw(X) Yaw_d(Xd) Pitch(Y) Pitch_d(Yd) Roll(Z) Roll_d(Zd) Fx Fy Fz e_px e_py e_pz e_ox e_oy e_oz

A = importdata('refs_operator/06');
t_06 = A.data(:,1);
pz_06 = A.data(:,6);
Fz_06 = A.data(:,16);


B = importdata('refs_operator/05');
t_05 = B.data(:,1);
pz_05 = B.data(:,6);
Fz_05 = B.data(:,16);

%% plot
%% 0.6mm
figure(1);
plot(t_06, pz_06, 'r', 'linewidth',2)
grid on;
xlabel('t(s)', 'FontSize', 15);
ylabel('P_{z}(m)', 'FontSize', 15);
legend('operator (0.6mm drill)', 'FontSize', 15)

figure(2);
plot(t_06, Fz_06, 'r', 'linewidth',2)
grid on;
xlabel('t(s)', 'FontSize', 15);
ylabel('F_{z}(N)', 'FontSize', 15);
legend('operator (0.6mm drill)', 'FontSize', 15)

%% 0.5mm
figure(3);
plot(t_05, pz_05, 'r', 'linewidth',2)
grid on;
xlabel('t(s)', 'FontSize', 15);
ylabel('P_{z}(m)', 'FontSize', 15);
legend('operator (0.5mm drill)', 'FontSize', 15)

figure(4);
plot(t_05, Fz_05, 'r', 'linewidth',2)
grid on;
xlabel('t(s)', 'FontSize', 15);
ylabel('F_{z}(N)', 'FontSize', 15);
legend('operator (0.5mm drill)', 'FontSize', 15)



