function [ MODELS ] = treinarLinearCrooped( downsampleX, downsampleY, numeroCortes )
%TREINARLINEAR
% varre todas as pastas do diretorio indicado em CAMINHO_BASE e gera uma
% matriz tridimensional onde cada dimensao desse matriz é o modelo de uma
% classe contida em CAMINHO_BASE
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

%   Detailed explanation goes here
CAMINHO_BASE = './treino/';
%    base = dir([CAMINHO_BASE,'/*.jpg']);
pastas = dir(CAMINHO_BASE);

MODELS = []; % variavel onde vai guardar todos os modelos
% matrix de 4d

% passa por todas as pastas
for i = 3 : length(pastas)
    
    nome_pasta = pastas(i).name;
    nome_pasta_completo = [CAMINHO_BASE, nome_pasta, '/'];
    nome_fotos = dir([nome_pasta_completo, '/*bmp']);
    
    valorYI = 1;
    valorYF = downsampleX/numeroCortes;
    
    for corte=1 : (numeroCortes*2)
               
        X = []; % modelo para classe da vez
        % passa por todas as fotos de cada pasta
        for j=1 : length(nome_fotos)
            % imshow([nome_pasta_completo, nome_fotos(j).name]);
            % tratando a imagem
            x = imread([nome_pasta_completo, nome_fotos(j).name]);
            x = imresize(x, [downsampleX, downsampleY]); % resize
            x = rgb2gray(x);
            
            if (mod(corte, 2)==1)
                x = x(valorYI:valorYF, 1:(downsampleY/2));
            else
                x = x(valorYI:valorYF, (downsampleY/2)+1:downsampleY);
            end
             imshow(x); %vendo o treinamento
            x = linearFeaturesCrooped(x);
            
            X = [X, x]; % adicionando imagem no modelo
        end
        MODELS(:, :, i-2, corte) = X;
        
        if (mod(corte,2)==0)
            valorYI = valorYF+1;
            valorYF = valorYF + (downsampleX/numeroCortes);
        end
      
        
    end
    
end


end

