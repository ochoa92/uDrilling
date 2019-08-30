% =========================================================================
% Project Name: TOOLING4G - Micro-Drilling
% Author      : Hélio Ochoa
% Description : 
% =========================================================================
clear all;
clc;
close all;

%% pattern
filename = 'refs_operator/06';
A = importdata(filename);

% t p_x p_xd p_y p_yd p_z p_zd Yaw(X) Yaw_d(Xd) Pitch(Y) Pitch_d(Yd) Roll(Z) Roll_d(Zd) Fx Fy Fz e_px e_py e_pz e_ox e_oy e_oz
t = A.data(:,1);
z = A.data(:,6);

Fx = A.data(:,14);
Fy = A.data(:,15);
Fz = A.data(:,16);

% Zero-phase digital filtering
d = designfilt('lowpassfir', ...
               'CutoffFrequency', 10, ...
               'FilterOrder', 100, ...
               'SampleRate', 1000);
z_filtered = filtfilt(d,z);


%% plot
figure(1);
hold on
plot(t, z, 'b', 'lineWidth', 2)
plot(t, z_filtered, '--r', 'lineWidth', 2)
grid on;
xlabel('time(s)');
ylabel('p_z(m)');
legend('p_z', 'p_{z_{filtered}}')

figure(2)
hold on
subplot(3,1,1)
plot(t, Fx,'b')
grid on;
xlabel('time(s)');
ylabel('F_x(N)');
subplot(3,1,2)
plot(t, Fy,'g')
grid on;
xlabel('time(s)');
ylabel('F_y(N)');
subplot(3,1,3)
plot(t, Fz,'r')
grid on;
xlabel('time(s)');
ylabel('F_z(N)');


