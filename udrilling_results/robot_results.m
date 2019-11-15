% =========================================================================
% Project Name: TOOLING4G - Micro-Drilling
% Author      : Hélio Ochoa
% Description : Robot results
% =========================================================================
clear all;
clc;
close all;

%% t p_x p_xd p_y p_yd p_z p_zd Yaw Yaw_d Pitch Pitch_d Roll Roll_d Fx_EE Fy_EE Fz_EE Fx_O Fy_O Fz_O e_px e_py e_pz e_ox e_oy e_oz pEE_x pEE_xd pEE_y pEE_yd pEE_z pEE_zd i_px i_py i_pz i_ox i_oy i_oz
% A = importdata('06mm/udrilling_controller_1');
% A = importdata('05mm/udrilling_controller_1');
% A = importdata('04mm/udrilling_controller_2');
A = importdata('06mm/udrilling_controller_1(Inclinado)');
% A = importdata('05mm/udrilling_controller_1(Inclinado)');

t = A.data(:,1);
px = A.data(:,2);
pxd = A.data(:,3);
py = A.data(:,4);
pyd = A.data(:,5);
pz = A.data(:,6);
pzd = A.data(:,7);

ox = wrapTo2Pi(A.data(:,8));
oxd = wrapTo2Pi(A.data(:,9));
oy = wrapTo2Pi(A.data(:,10));
oyd = wrapTo2Pi(A.data(:,11));
oz = wrapToPi(A.data(:,12));
ozd = wrapToPi(A.data(:,13));

Fx = A.data(:,14);
Fy = A.data(:,15);
Fz = A.data(:,16);

error_px = rms(A.data(:,20));
error_py = rms(A.data(:,21));
error_pz = rms(A.data(:,22));

error_ox = rms(A.data(:,23));
error_oy = rms(A.data(:,24));
error_oz = rms(A.data(:,25));

%% plot
% position
figure(1)
plot(t, px, '--k', 'linewidth', 2)
hold on
plot(t, pxd, 'b', 'linewidth', 1)
grid on
xlabel('t (s)', 'FontSize', 15)
ylabel('P_x (m)', 'FontSize', 15)
legend('robot', 'desired')
%xlim([t_robot(1) t_robot(100000)])
%title('End-Effector Position in Base frame (Robot)')
set(gca,'FontSize',30)

figure(2)
plot(t, py, '--k', 'linewidth', 2)
hold on
plot(t, pyd, 'g', 'linewidth', 1)
grid on
xlabel('t (s)', 'FontSize', 30)
ylabel('P_y (m)', 'FontSize', 30)
legend('robot', 'desired')
%xlim([t_robot(1) t_robot(100000)])
%title('End-Effector Position in Base frame (Robot)')
set(gca,'FontSize',30)

figure(3)
plot(t, pz, '--k', 'linewidth', 2)
hold on
plot(t, pzd, 'r', 'linewidth', 1)
grid on
xlabel('t (s)', 'FontSize', 30)
ylabel('P_z (m)', 'FontSize', 30)
legend('robot', 'desired')
%xlim([t_robot(1) t_robot(100000)])
% title('End-Effector Position in Base frame (Robot)')
set(gca,'FontSize',30)

% orientation
figure(4)
subplot(3,1,1)
plot(t, ox, '--k', 'linewidth', 2)
hold on
plot(t, oxd, 'b', 'linewidth', 1)
grid on
xlabel('t (s)', 'FontSize', 30)
ylabel('Yaw (rad)', 'FontSize', 3)
legend('robot', 'desired')
%xlim([t_robot(1) t_robot(100000)])
% ylim([0 2*pi])
% title('End-Effector Orientation in Base frame (Robot)')
set(gca,'FontSize',30)
subplot(3,1,2)
plot(t, oy, '--k', 'linewidth', 2)
hold on
plot(t, oyd, 'g', 'linewidth', 1)
grid on
xlabel('t (s)', 'FontSize', 30)
ylabel('Pitch (rad)', 'FontSize', 30)
legend('robot', 'desired')
%xlim([t_robot(1) t_robot(100000)])
% ylim([0 2*pi])
% title('End-Effector Orientation in Base frame (Robot)')
set(gca,'FontSize',30)
subplot(3,1,3)
plot(t, oz, '--k', 'linewidth', 2)
hold on
plot(t, ozd, 'r', 'linewidth', 1)
grid on
xlabel('t (s)', 'FontSize', 30)
ylabel('Roll (rad)', 'FontSize', 30)
legend('robot', 'desired')
%xlim([t_robot(1) t_robot(100000)])
% ylim([-pi pi])
% title('End-Effector Orientation in Base frame (Robot)')
set(gca,'FontSize',30)

% Force
figure(5)
subplot(3,1,1)
plot(t, Fx, 'b', 'linewidth', 2)
grid on
xlabel('t (s)', 'FontSize', 30)
ylabel('F_x (N)', 'FontSize', 30)
%xlim([t_robot(1) t_robot(100000)])
set(gca,'FontSize',30)
subplot(3,1,2)
plot(t, Fy, 'g', 'linewidth', 2)
grid on
xlabel('t (s)', 'FontSize', 30)
ylabel('F_y (N)', 'FontSize', 30)
%xlim([t_robot(1) t_robot(100000)])
set(gca,'FontSize',30)
subplot(3,1,3)
plot(t, Fz, 'r', 'linewidth', 2)
grid on
xlabel('t (s)', 'FontSize', 30)
ylabel('F_z (N)', 'FontSize', 30)
%xlim([t_robot(1) t_robot(100000)])
% sgtitle('End-Effector Force in End-Effector frame (Robot)')
set(gca,'FontSize',30)