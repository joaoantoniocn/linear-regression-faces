% Reconhecimento de imagens atrávez de regressão linear

% Roda o LRC sem nenhuma alteração carregando os holdouts de um arquivo
% .txt
warning('off')
% É de extrema importancia que a base a ser rodada com todas suas classes
% esteja na pasta 'base'.
holdout_result = [];
num_features = 50;

% For com a quantidade de holdouts
for i=1 : 1
    % arquivo que contem todos os holdouts
    [treino teste] = separarbaseHoldout('./YaleB.txt', i);
    
    [pca_treino, media_treino] = PCA(treino);
    
    % Criação dos modelos
    MODELS = treinarLinearFilePCA(treino, pca_treino, media_treino, num_features);
    
    resultados = estatisticaLinearRegressionFilePCA(MODELS, teste, pca_treino, media_treino, num_features);
    
    media = cell2mat(resultados(:, 2));
    media = mean(media);
    holdout_result(i) = media;
%     display(i);
end

final_result = mean(holdout_result);
final_result_desvio_padrao = std(holdout_result);

load handel.mat
sound(y)