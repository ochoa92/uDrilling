% =========================================================================
% Project Name: TOOLING4G - Micro-Drilling
% Author      : Hélio Ochoa
% Description : 
% =========================================================================
clear all;
clc;
close all;

%% udrilling TOOL CAD

mf = 0.322; % falange mass
mp = 0.262; % piggyPower mass
m = mf + mp;  % mass(kg)

center_of_mass = [0 0 0.066];  % center of mass of load Vector

% moments of inertia of a solid cylinder
% Iz = (1/2)*m*r²
% Ix = Iz = (1/12)*m*(3r²+h²)

r = 0.075;   % radius(m)
h = 0.16;   % height(m)

Ix = (1/12)*m*(3*(r^2) + (h^2)); 
Iy = Ix;
Iz = (1/2)*m*(r^2);

I = [Ix 0 0;
     0 Iy 0;
     0 0 Iz];  
 
% Transformation Matrix from Flange to End-Effector
T = [1 0 0       0;
     0 1 0 -0.0755;
     0 0 1    0.10;
     0 0 0       1];
 
 angle = -pi/4;
 Tx = [1 0          0           0;
       0 cos(angle) -sin(angle) 0;
       0 sin(angle) cos(angle)  0;
       0 0          0           1];
   
 Ty = [cos(angle)  0 sin(angle) 0;
       0           1 0          0;
       -sin(angle) 0 cos(angle) 0;
       0           0 0          1];
   
 Tz = [cos(angle) -sin(angle) 0 0;
       sin(angle) cos(angle)  0 0;
       0          0           1 0;
       0          0           0 1];
 
 uD_T_EE = T;