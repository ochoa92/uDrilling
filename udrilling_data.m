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
px = A.data(:,2);
py = A.data(:,4);
pz = A.data(:,6);
p = [px py pz]';

% Low-Pass Filter
fpass = 10; % passband frequency of the filter (Hz)
fs = 1000; % sample rate (Hz)
pz_filtered = lowpass(pz, fpass, fs);

% select data
tz = [];
z = [];
count = 1;
for i = 1:(size(pz,1))
   if (t(i) >= 2.1) && (t(i) <= 41.6)
       tz(count) = t(i);
       z(count) = pz_filtered(i);
       count = count + 1;
   end
end


% signal peaks
[pks,locs] = findpeaks(z, tz,'MinPeakDistance',0.5);

% signal frequency
f = mean(diff(locs));
w = 2*pi*f; % natural frequency

% amplitude
A_max = max(pks) - min(pks);
A = linspace(0, A_max, size(z,2));
% A = linspace(0, 0.001, size(z,2));
l = linspace(z(1), z(end), size(z,2));
y(1) = z(1);
for i = 1:(size(z,2)-1)
    y(i+1) = l(i) + A(i)*sin(w*tz(i) + theta);
end

%% plot
figure(1);
plot(t, pz, 'b')
hold on
plot(tz, z, '--r')
grid on;
xlabel('t(s)');
ylabel('pz(m)');

figure(2);
plot(tz, z, 'b')
hold on
plot(tz, l, 'k', 'lineWidth', 2)
hold on
plot(locs, pks, 'or', 'lineWidth', 2)
findpeaks(z, tz,'MinPeakDistance',0.5)
hold on
plot(tz, y, 'r', 'lineWidth', 2)
grid on;
xlabel('t(s)');
ylabel('pz(m)');





