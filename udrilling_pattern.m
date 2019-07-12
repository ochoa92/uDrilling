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
px = A.data(:,2);
py = A.data(:,4);
pz = A.data(:,6);
p = [px py pz]';

Fz = A.data(:,14);

% Zero-phase digital filtering
d = designfilt('lowpassfir', 'CutoffFrequency', 100, 'FilterOrder', 8, 'SampleRate', 1000);
pz_filt = filtfilt(d,pz);

% select data
tz = [];
z = [];
count = 1;
for i = 1:(size(pz_filt,1))
   if ( t(i) >= 6.1 && t(i) <= 32.05)
       tz(count) = t(i);
       z(count) = pz_filt(i);
       count = count + 1;
   end
end

% artificial drilling increase
vec_i = [];
vec_f = [];
for i = 1:(size(z,2))
   if ( tz(i) == 12.48 || (tz(i) == 15.34) || (tz(i) == 18.15) || (tz(i) == 20.79) || (tz(i) == 23.13) || (tz(i) == 25.55) || (tz(i) == 27.45) || (tz(i) == 29.36) || (tz(i) == 31.12))        
       vec_i = [vec_i; i];
   end
   
   if ( tz(i) == 14.17 || (tz(i) == 17.09) || (tz(i) == 19.68) || (tz(i) == 21.92) || (tz(i) == 24.46) || (tz(i) == 26.46) || (tz(i) == 28.34) || (tz(i) == 30.23) || (tz(i) == 31.88))        
       vec_f = [vec_f; i];
   end
       
end

delta_drilling = -0.005;
K = 1/0.5;
new_z = z;
for i = 1:(size(vec_i,1))
    initial = vec_i(i);
    final = vec_f(i);
    
%     delta = linspace(0, delta_drilling, (final-initial)+1);
    delta = (1-(1./(1+(K*( tz(initial:final) - tz(initial) )).^2))).*delta_drilling;    
%     delta = ( ( initial:final - tz(initial) ).^2).*delta_drilling;

    new_z(initial:final) = new_z(initial:final) + delta;
end


%% offsets
offset = ones(size(new_z)-1);
for i = 1:(size(new_z,2)-1)
   offset(1,i) = 0;
   offset(2,i) = 0;
   offset(3,i) = new_z(i+1) - new_z(i);
end


%% Save offsets in a file
filepath = '/home/helio/kst/udrilling/pattern/offsets';
fileID = fopen(filepath,'w');
fprintf(fileID,'%d %d %d\n', offset);
fclose(fileID);

%% Get the mould points
filename = '/home/helio/kst/udrilling/mould/points';
points = importdata(filename);

%% Get the desired Rotation
filename = '/home/helio/kst/udrilling/mould/desired_o';
desired_o = importdata(filename);
Qd = [desired_o(1,4) desired_o(1,1) desired_o(1,2) desired_o(1,3)];
Rd = quat2rotm(Qd);

%% Execution of the pattern in one the work-space points
delta_z = [0, 0, -0.001];
pd = ones(3,size(offset,2));
pd(:,1) = points(1,:)' + delta_z';
for k = 1:size(offset,2)
   pd(:,k+1) = pd(:,k) - Rd*offset(:,k);
%    pd(:,k+1) = pd(:,k) + offset(:,k);
end

%% plot
figure(1);
plot(t, pz, 'b', 'lineWidth', 2)
hold on
plot(t, pz_filt, '--r', 'lineWidth', 2)
grid on;
xlabel('t(s)');
ylabel('pz(m)');
legend('original(pz)', 'filtered(pz_{filt})')

figure(2)
plot(tz, z, 'b', 'lineWidth', 2)
hold on
plot(tz, new_z, '--r', 'lineWidth', 2)
grid on;
xlabel('t(s)');
ylabel('z(m)');
legend('drilling window(z)', 'artificial drilling increase')

figure(3);
plot3(pd(1,1), pd(2,1), pd(3,1), '*b', 'lineWidth', 2)
hold on
plot3(pd(1,:), pd(2,:), pd(3,:), '--r')
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');

