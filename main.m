% Reconhecimento de imagens atr�vez de regress�o linear

% treino
%AT&T
downsampleX = 10;
downsampleY = 5;

MODELS = treinarLinear(downsampleX, downsampleY);

%teste
resultados = estatisticaLinearRegression(MODELS, downsampleX, downsampleY);