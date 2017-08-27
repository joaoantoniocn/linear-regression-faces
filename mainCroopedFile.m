% Reconhecimento de imagens atr�vez de regress�o linear
% Usando a tecnica de cortes vista no artigo Linear Regression.
% (Tecnica utilizada para tratar occlusion)

% Carrega os holdouts de um arquivo .txt

% � de extrema importancia que a base a ser rodada com todas suas classes
% esteja na pasta 'base'.

warning('off')
holdout_result = [];
downsampleX = 10;
downsampleY = 10;
cortes = 5; % numero de divis�es horizontais. Por padrao o numero de cortes
            % verticais eh 1
tic % come�ando a contar o tempo de execu��o do c�digo
% For com a quantidade de holdouts
for i=1 : 10
    % arquivo que contem todos os holdouts
    [treino teste] = separarbaseHoldout('./GTech.txt', i);
    
    % Cria��o dos Modelos
    MODELS = treinarLinearCroopedFile(treino, downsampleX, downsampleY, cortes);
    
    %teste
    resultados = estatisticaLinearRegressionCroopedFile(MODELS, teste, downsampleX, downsampleY);
    
    media = cell2mat(resultados(:, 2));
    media = mean(media);
    holdout_result(i) = media;
end

final_result = mean(holdout_result);
final_result_desvio_padrao = std(holdout_result);

toc % acabando de contar o tempo de execu��o do c�digo

load handel.mat
sound(y)
