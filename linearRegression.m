% Reconhecimento de imagens atr�vez de regress�o linear

% treino
downsamplesize = 3;
MODELS = treinarLinear(downsamplesize);

%teste
resultados = estatisticaLinearRegression(MODELS, downsamplesize);