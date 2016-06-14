function [ MODELS ] = treinarLinear( downsamplesize )
%TREINARLINEAR
% varre todas as pastas do diretorio indicado em CAMINHO_BASE e gera uma
% matriz tridimensional onde cada dimensao desse matriz é o modelo de uma
% classe contida em CAMINHO_BASE
%
% entrada  -> downsamplesize | indica o tamanho do downsample usado nas
%                              imagens, geralmente cada base ultiliza um
%                              tamanho de downsample diferente.
%
% saida -> MODELS            | Matriz tridimensional onde cada dimensão
%                              representa o modelo de uma classe.
%

%   Detailed explanation goes here
    CAMINHO_BASE = './treino/';
%    base = dir([CAMINHO_BASE,'/*.jpg']);
    pastas = dir(CAMINHO_BASE);
        
    MODELS = []; % variavel onde vai guardar todos os modelos
                 % matrix de 3d
                 
    % passa por todas as pastas
    for i = 3 : length(pastas)
       
       nome_pasta = pastas(i).name;
       nome_pasta_completo = [CAMINHO_BASE, nome_pasta, '/'];
       nome_fotos = dir([nome_pasta_completo, '/*pgm']);
       
       X = []; % modelo para classe da vez
       % passa por todas as fotos de cada pasta
       for j=1 : length(nome_fotos)
           % imshow([nome_pasta_completo, nome_fotos(j).name]);
           % tratando a imagem
           x = imread([nome_pasta_completo, nome_fotos(j).name]);
           
           x = linearFeatures(x, downsamplesize);
           
           X = [X, x]; % adicionando imagem no modelo
       end 
       MODELS(:, :, i-2) = X;
    end
    

end

