% =========================================================================
% Project Name: TOOLING4G - Micro-Drilling
% Author      : Hélio Ochoa
% Description : create a polishing synthetic reference
% =========================================================================
clear all;
clc;
close all;


%% Get the mould points
% Attention to the filepath
points = importdata('/home/ochoa/kst/udrilling/mould/points');

%% Get the desired Rotation
% Attention to the filepath
desired_o = importdata('/home/ochoa/kst/udrilling/mould/desired_o');
Qd = [desired_o(1,4) desired_o(1,1) desired_o(1,2) desired_o(1,3)];
Rd = quat2rotm(Qd);


%% build the pattern
p_initial = points(1,:)';

goal = p_initial - [0 0 0.012]';
teto = p_initial - [0 0 0.0005]';

dt_p = 0.8;    % tempo de prefuração
dt_t = 0.5;

delta_t = 0.001;
delta_z = [0 0 0.001]';
tempo_atual = 0;
pi = p_initial;

time = [];
pd = [];
while pi(3,1) > goal(3,1)
   
    for t = 0:delta_t:dt_p
        
        pd = [pd polynomial3_trajectory(pi, pi-delta_z, 0, dt_p, t)];
        time = [time tempo_atual+t];
    end
    
    tempo_atual = time(end);
    pi = pd(:,end);
   
    
    for t = 0:delta_t:dt_t
        
        pd = [pd polynomial3_trajectory(pi, teto, 0, dt_t, t)];
        time = [time tempo_atual+t];
    end
    
    tempo_atual = time(end);
    
    for t = 0:delta_t:dt_t
        
        pd = [pd polynomial3_trajectory(teto, pi , 0, dt_t, t)];
        time = [time tempo_atual+t];
    end
    
    tempo_atual = time(end);    
end

pd_mould = [];
for k = 1:length(pd)
   pd_mould(:,k) = -Rd*pd(:,k);
end


%% plot
figure(1);
plot(time, pd(3,:), 'b', 'lineWidth', 2)
grid on;
xlabel('t(s)');
ylabel('z(m)');
legend('z')

figure(2);
plot3(pd_mould(1,1), pd_mould(2,1), pd_mould(3,1), '*b', 'lineWidth', 2)
hold on
plot3(pd_mould(1,:), pd_mould(2,:), pd_mould(3,:), '--r')
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
