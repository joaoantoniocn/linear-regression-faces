function [ resultados ] = estatisticaLinearRegression( MODELS, downsamplesize )
% 
% varre todas as pastas do diretorio indicado em CAMINHO_BASE e gera uma
% matriz com a taxa de acerto de cada classe
%
% entrada  -> downsamplesize | indica o tamanho do downsample usado nas
%                              imagens, geralmente cada base ultiliza um
%                              tamanho de downsample diferente.
%
% saida -> resultados        | Matriz com a taxa de acerto de cada classe
%

%   Detailed explanation goes here
    CAMINHO_BASE = './test/';
%    base = dir([CAMINHO_BASE,'/*.jpg']);
    pastas = dir(CAMINHO_BASE);
                         
    % passa por todas as pastas
    for i = 3 : length(pastas)
       
       nome_pasta = pastas(i).name;
       nome_pasta_completo = [CAMINHO_BASE, nome_pasta, '/'];
       nome_fotos = dir([nome_pasta_completo, '/*pgm']);
       
       % passa por todas as fotos de cada pasta
       for j=1 : length(nome_fotos)
           % imshow([nome_pasta_completo, nome_fotos(j).name]);
           % tratando a imagem
           x = imread([nome_pasta_completo, nome_fotos(j).name]);
           
           y = linearFeatures(x, downsamplesize);
           classificarLinearRegression(MODELS, y);
           
       end 
       
    end

end

