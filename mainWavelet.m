% Reconhecimento de imagens atrávez de regressão linear

% É de extrema importancia que a base a ser rodada com todas suas classes
% esteja na pasta 'base'.
holdout_result = [];
for i=1 : 50
    % arquivo que contem todos os holdouts
    [treino teste] = separarbaseHoldout('./GTech.txt', i);
    
    % Criação dos modelos
    MODELS = treinarLinearWavelet(treino);
    
    resultados = estatisticaLinearRegressionWavelet(MODELS, teste);
    
    media = cell2mat(resultados(:, 2));
    media = mean(media);
    holdout_result(i) = media;
%     display(i);
end

final_result = mean(holdout_result);
final_result_desvio_padrao = std(holdout_result);