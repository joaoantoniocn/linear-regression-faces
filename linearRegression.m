% Reconhecimento de imagens atrávez de regressão linear

% treino
downsamplesize = 3;
MODELS = treinarLinear(downsamplesize);

%teste
resultados = estatisticaLinearRegression(MODELS, downsamplesize);