% Reconhecimento de imagens atrávez de regressão linear

% É de extrema importancia que a base a ser rodada com todas suas classes
% esteja na pasta 'base'.

for i=1 : 100
    % arquivo que contem todos os holdouts
    separarbaseHoldout('./ARFaces.txt', i);
    
    % Criação dos modelos
    MODELS = treinarLinearWavelet();
    
    resultados = estatisticaLinearRegressionWavelet(MODELS);
    
    media = cell2mat(resultados(:, 2));
    media = mean(media);
    holdout_result(i) = media;
end

final_result = mean(holdout_result);