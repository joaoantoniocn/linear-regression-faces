function [ MODELS ] = treinarLinearFilePCA( treino, pca_treino, media_treino, num_features, r)
% saida -> MODELS            | Matriz tridimensional onde cada dimensão
%                              representa o modelo de uma classe.
%

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
        x = linearFeaturesPCA(x, pca_treino, media_treino, num_features, r);
        
        X = [X, x]; % adicionando imagem no modelo
    end
    MODELS(:, :, i) = X;
end

end

