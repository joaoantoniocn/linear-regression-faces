% Reconhecimento de imagens atrávez de regressão linear
% Usando a tecnica de cortes vista no artigo Linear Regression.
% (Tecnica utilizada para tratar occlusion)

% Carrega os holdouts de um arquivo .txt

% É de extrema importancia que a base a ser rodada com todas suas classes
% esteja na pasta 'base'.
holdout_result = [];
downsampleX = 20;
downsampleY = 20;
cortes = 3; % numero de divisões horizontais. Por padrao o numero de cortes
            % verticais eh 1

% For com a quantidade de holdouts
for i=1 : 50
    % arquivo que contem todos os holdouts
    [treino teste] = separarbaseHoldout('./ARFaces.txt', i);
    
    % Criação dos Modelos
    MODELS = treinarLinearCroopedFile(treino, downsampleX, downsampleY, cortes);
    
    %teste
    resultados = estatisticaLinearRegressionCroopedFile(MODELS, teste, downsampleX, downsampleY);
    
    media = cell2mat(resultados(:, 2));
    media = mean(media);
    holdout_result(i) = media;
end

final_result = mean(holdout_result);
final_result_desvio_padrao = std(holdout_result);


