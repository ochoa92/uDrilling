% =========================================================================
% Project Name: TOOLING4G - Micro-Drilling
% Author      : Hélio Ochoa
% Description : 
% =========================================================================
clear all;
clc;
close all;

%% pattern
filename = 'refs_operator/05';
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
plot(t, z, 'b', 'lineWidth', 2)
hold on
plot(t, z_filtered, '--r', 'lineWidth', 2)
grid on;
xlabel('t(s)');
ylabel('z(m)');
legend('z', 'z_{filtered}')

figure(2)
plot(t, Fz)


