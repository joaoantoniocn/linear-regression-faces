% Reconhecimento de imagens atrávez de regressão linear

% Roda o LRC sem nenhuma alteração carregando os holdouts de um arquivo
% .txt

% É de extrema importancia que a base a ser rodada com todas suas classes
% esteja na pasta 'base'.
holdout_result = [];
downsampleX = 10;
downsampleY = 10;

for i=1 : 100
    % arquivo que contem todos os holdouts
    [treino teste] = separarbaseHoldout('./EssexFaces.txt', i);
    
    % Criação dos modelos
    MODELS = treinarLinearFile(treino, downsampleX, downsampleY);
    
    resultados = estatisticaLinearRegressionFile(MODELS, teste, downsampleX, downsampleY);
    
    media = cell2mat(resultados(:, 2));
    media = mean(media);
    holdout_result(i) = media;
%     display(i);
end

final_result = mean(holdout_result);
final_result_desvio_padrao = std(holdout_result);