% Reconhecimento de imagens atrávez de regressão linear
% Usando a tecnica de cortes vista no artigo Linear Regression.
% (Tecnica utilizada para tratar occlusion)

% treino
%AR
downsampleX = 500;
downsampleY = 500;
cortes = 2; % numero de cortes horizontais. Por padrao o numero de cortes
            % verticais eh 1

%load('MODELS.mat');
MODELS = treinarLinearCrooped(downsampleX, downsampleY, cortes);

%teste
%resultados = estatisticaLinearRegressionCrooped(MODELS, downsampleX, downsampleY);