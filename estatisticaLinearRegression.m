function [ resultados ] = estatisticaLinearRegression( MODELS, downsampleX, downsampleY )
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
    
    resultados = [];
    
    % passa por todas as pastas
    for i = 3 : length(pastas)
       
       nome_pasta = pastas(i).name;
       nome_pasta_completo = [CAMINHO_BASE, nome_pasta, '/'];
       nome_fotos = dir([nome_pasta_completo, '/*pgm']);
       
       resultadoClasse = 0;
       % passa por todas as fotos de cada pasta
       for j=1 : length(nome_fotos)
           % imshow([nome_pasta_completo, nome_fotos(j).name]);
           % tratando a imagem
           x = imread([nome_pasta_completo, nome_fotos(j).name]);
           
           y = linearFeatures(x, downsampleX, downsampleY);
           if(classificarLinearRegression(MODELS, y) == i-2)
               resultadoClasse = resultadoClasse + 1;
           end  
           
       end 
       
       resultados = [resultados; cellstr(nome_pasta), resultadoClasse/length(nome_fotos)];
       
    end

end

