function [ MODELS ] = treinarLinearCroopedFile(treino, downsampleX, downsampleY, numeroCortes )
% entrada -> treino          | indica quais arquivos do diretório './base/'
%                              serão usados para o treino
%
% entrada  -> downsamplesize | indica o tamanho do downsample usado nas
%                              imagens, geralmente cada base ultiliza um
%                              tamanho de downsample diferente.
% entrada -> numeroCortes    | define em quantos em cortes horizontais a
%                              imagem vai ser dividida. (sera feito um
%                              corte na vertical por padrao)
%
% saida -> MODELS            | Matriz com 4 dimensoes onde cada 3" dimensão
%                              representa uma classe e a 4" dimensao representa
%                              os modelos daquela classe. Cada classe tera
%                              numeroCortes*2 modelos.
%
%

MODELS = []; % variavel onde vai guardar todos os modelos
% matrix de 4d

classes = strsplit(treino, '|');
classes(1) = [];

% passa por todas as classes
for i = 1 : length(classes)
        
    amostras = strsplit(char(classes(i)), ',');
    % --- pegando o tamanho das fotos ---
    amostra_treino = char(amostras(2));
    file_origem = strcat('./base/', amostra_treino);
    x = imread(file_origem);
    x = rgb2gray(x);
    % ---
    % --- recortando a imagem ---
    [sizeY sizeX] = size(x);
    valorYI = 1;
    valorYF = sizeY/numeroCortes;
    % ---------------------------
    
    % Passa por todos os cortes estipulados
    for corte=1 : (numeroCortes*2)
               
        X = []; % modelo para classe da vez (no corte da vez)
        % Separando exemplos de cada classe
        for j = 2 : length(amostras)
            amostra_treino = char(amostras(j));
            file_origem = strcat('./base/', amostra_treino);
            % imshow(file_origem);
            % tratando a imagem
            x = imread(file_origem);
            
            x = rgb2gray(x);
                        
            if (mod(corte, 2)==1)
                x = x(valorYI:valorYF, 1:(sizeX/2));          
            else
                x = x(valorYI:valorYF, (sizeX/2)+1:sizeX);                
            end
            % ---------------------------
            %imshow(x)
            x = linearFeaturesCrooped(x, downsampleX, downsampleY);
            
            X = [X, x]; % adicionando imagem no modelo
        end % fotos de cada classe
        MODELS(:, :, i, corte) = X;
        
        if (mod(corte,2)==0)
            valorYI = valorYF+1;
            valorYF = valorYF + (sizeX/numeroCortes);
        end
      
        
    end % cortes
    
end % classes


end

