% =========================================================================
% Project Name: TOOLING4G - Polishing
% Author      : Hélio Ochoa
% Description : compute the integral error in 'x' iterations
% =========================================================================
clear all;
clc;
close all;


eik=[0;0;0];
small_number=0.000001;

ek=[0.1;0.2;0.3]; %teste
for i=1:10000 %teste
    if (ek'*ek)<small_number
        eik = ek
    else
        eik = (eik'* ek/(sqrt(ek'*ek))*ek/(sqrt(ek'*ek))) + ek
    end
end

