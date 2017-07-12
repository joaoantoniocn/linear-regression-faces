function [ pca_frac, media_treino ] = PCAFracionario( label_treino, r)
%   PCAFracionario recebe os nomes das imagens de treinamento
%   calcula o pca fracionario e o retorna junto com a média fracionaria.
%   r = potencia do pca fracionario. r entre [0 1]

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
        % ---
        
        TREINO = [TREINO, x]; % adicionando imagem no modelo
    end
    
end

[frac_cov media_treino] = fractionalcovariancia(TREINO, r);
[autovetores autovalores] = eig(frac_cov);
[autovetores autovalores] = ordenar( autovetores, autovalores );
pca_frac = autovetores;

end

