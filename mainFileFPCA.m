% Reconhecimento de imagens atr�vez de regress�o linear

% Roda o LRC sem nenhuma altera��o carregando os holdouts de um arquivo
% .txt
warning('off')
% � de extrema importancia que a base a ser rodada com todas suas classes
% esteja na pasta 'base'.
holdout_result = [];
num_features = 100;
r = 0.1;      % fracionario

% For com a quantidade de holdouts
for i=1 : 10
    % arquivo que contem todos os holdouts
    [treino teste] = separarbaseHoldout('./GTech.txt', i);
    
    %[pca_treino, media_treino] = PCA(treino);
    [pca_frac, media_frac] = PCAFracionario(treino, r);
    % Cria��o dos modelos
    MODELS = treinarLinearFilePCA(treino, pca_frac, media_frac, num_features, r);
    
    resultados = estatisticaLinearRegressionFilePCA(MODELS, teste, pca_frac, media_frac, num_features, r);
    
    media = cell2mat(resultados(:, 2));
    media = mean(media);
    holdout_result(i) = media;
%     display(i);
end

final_result = mean(holdout_result);
final_result_desvio_padrao = std(holdout_result);

load handel.mat
sound(y)