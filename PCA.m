function [ pca_treino, media_treino ] = PCA( label_treino)
%   PCA recebe os nomes das imagens de treinamento
%   calcula o pca e o retorna junto com a média.

TREINO = []; % variavel onde vai guardar a base de treinamento
% matrix 2d. cada linha representa uma amostra e cada coluna uma feature

classes = strsplit(label_treino, '|');
classes(1) = [];

% Passando por todas as Classes
for i = 1 : length(classes)
    amostras = strsplit(char(classes(i)), ',');
      
    % Separando exemplos de cada classe
    for j = 2 : length(amostras)
        amostra_treino = char(amostras(j));
        file_origem = strcat('./base/', amostra_treino);
        x = imread(file_origem);
        
        % convertendo a imagem para tons de cinza e depois transformando
        % ela em um vetor.
        x = rgb2gray(x);
        x = double(x);
        % --- essa linha é exclusivamente para a base GTech ---
%         x = imresize(x, [150, 150]);
        % ---
        x = x(:);   % transformando em um vetor coluna
        x = x';     % transformando em um vetor linha
        % ---
        
        TREINO = [TREINO; x]; % adicionando imagem no modelo
    end
    
end

pca_treino = pca(TREINO);
media_treino = mean(TREINO);
end

