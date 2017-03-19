% Reconhecimento de imagens atrávez de regressão linear

% treino
%AT&T
downsampleX = 10;
downsampleY = 10;

MODELS = treinarLinear(downsampleX, downsampleY);

%teste
resultados = estatisticaLinearRegression(MODELS, downsampleX, downsampleY);