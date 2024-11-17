%%%%%DC MOTOR%%%%%%
% Parámetros iniciales
clear;
clc;
close all;

torque_max = 1.8667; % Torque máximo en Nm
g = 9.81; % Gravedad en m/s^2
mu_values = 0.1:0.1:1.5; % Rango de coeficientes de fricción
r_values = 0.01:0.005:0.05; % Rango de radios de rueda en metros

% Inicializar matriz para almacenar masas máximas
mass_matrix = zeros(length(mu_values), length(r_values));

% Calcular masa máxima para cada combinación de mu y r
for i = 1:length(mu_values)
    mu = mu_values(i);
    for j = 1:length(r_values)
        r = r_values(j);
        F_motor = torque_max / r; % Fuerza generada por el motor
        mass_matrix(i, j) = F_motor / (mu * g); % Masa máxima
    end
end

%%Calculo de la velocidad del motor dc%%%%%%

%Bateria= %4s maximo para lo motores Core%
%Rpm=
%Velocidad=




% Gráfica 3D de los resultados
figure;
subplot(1,2,1);
[X, Y] = meshgrid(r_values, mu_values); % Crear malla para gráficos
surf(X, Y, mass_matrix);
xlabel('Radio de la rueda (m)');
ylabel('Coeficiente de fricción (\mu)');
zlabel('Masa máxima (kg)');
title('Masa máxima vs. Radio de rueda y Coef. de fricción');
colorbar;

% Gráfica de líneas para un coeficiente de fricción específico
subplot(1,2,2);
plot(r_values, mass_matrix(8, :), '-o'); % Usando mu = 0.8 (índice 8)
xlabel('Radio de la rueda (m)');
ylabel('Masa máxima (kg)');
title('Masa máxima para \mu = 1.5');
grid on;


