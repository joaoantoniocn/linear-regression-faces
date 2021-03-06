function [ MODELS ] = treinarLinearWavelet( treino )
%TREINARLINEAR
% varre todas as pastas do diretorio indicado em CAMINHO_BASE e gera uma
% matriz tridimensional onde cada dimensao desse matriz � o modelo de uma
% classe contida em CAMINHO_BASE
%
% saida -> MODELS            | Matriz tridimensional onde cada dimens�o
%                              representa o modelo de uma classe.
%

% %   Detailed explanation goes here
%     CAMINHO_BASE = './treino/';
% %    base = dir([CAMINHO_BASE,'/*.jpg']);
%     pastas = dir(CAMINHO_BASE);

MODELS = []; % variavel onde vai guardar todos os modelos
% matrix de 3d

classes = strsplit(treino, '|');
classes(1) = [];
for i = 1 : length(classes)
    amostras = strsplit(char(classes(i)), ',');
    X = []; % modelo para classe da vez
    
    % Separando exemplos de cada classe
    for j = 2 : length(amostras)
        amostra_treino = char(amostras(j));
        file_origem = strcat('./base/', amostra_treino);
        x = lercsv(file_origem);
        
        % A extra��o das caracteriscas acabou ficando igual a da Crooped
        x = linearFeaturesCrooped(x);
        
        X = [X, x]; % adicionando imagem no modelo
    end
    MODELS(:, :, i) = X;
end

end

