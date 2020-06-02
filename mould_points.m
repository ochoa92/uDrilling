% =========================================================================
% Project Name: TOOLING4G - Micro-Drilling
% Author      : Hélio Ochoa
% Description : 
% =========================================================================
clear all;
clc;
close all;

%% mould data -------------------------------------------------------------
% Attention to the filepath
P = importdata("/home/panda/catkin_ws/src/TOOLING4G/franka_udrilling/co_manipulation_data/mould_points");
Pi = P(1,:);
Pf = P(2,:);

vec = Pf - Pi;
N = 10; % number of points
M = [];
for i=linspace(0,1,N) 
    M = [M; Pi+vec*i];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Open file to write
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Attention to the filepath
filepath = "/home/panda/catkin_ws/src/TOOLING4G/franka_udrilling/co_manipulation_data/mould_line_points";
fileID = fopen(filepath,'w');
for i=1:length(M)
    points = M(i,:);
    fprintf(fileID,'%d %d %d\n', points);
end
fclose(fileID); % close file

%% plot -------------------------------------------------------------------
figure(1);
hold on
plot3(Pi(:,1), Pi(:,2), Pi(:,3), '*r', 'linewidth',2)
plot3(Pf(:,1), Pf(:,2), Pf(:,3), '*r', 'linewidth',2)
plot3(M(:,1), M(:,2), M(:,3), 'og', 'linewidth',2)
grid on
axis equal
xlabel('X')
ylabel('Y')
zlabel('Z')