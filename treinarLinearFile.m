function [ MODELS ] = treinarLinearFile( treino, downsampleX, downsampleY )
% saida -> MODELS            | Matriz tridimensional onde cada dimensão
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

% Passando por todas as Classes
for i = 1 : length(classes)
    amostras = strsplit(char(classes(i)), ',');
    X = []; % modelo para classe da vez
    
    % Separando exemplos de cada classe
    for j = 2 : length(amostras)
        amostra_treino = char(amostras(j));
        file_origem = strcat('./base/', amostra_treino);
        x = imread(file_origem);
        
        % Extraindo as caracteristicas
        x = linearFeatures(x, downsampleX, downsampleY);
        
        X = [X, x]; % adicionando imagem no modelo
    end
    MODELS(:, :, i) = X;
end

end

