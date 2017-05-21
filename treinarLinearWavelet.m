function [ MODELS ] = treinarLinearWavelet(  )
%TREINARLINEAR
% varre todas as pastas do diretorio indicado em CAMINHO_BASE e gera uma
% matriz tridimensional onde cada dimensao desse matriz é o modelo de uma
% classe contida em CAMINHO_BASE
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
       nome_fotos = dir([nome_pasta_completo, '/*csv']);
       
       X = []; % modelo para classe da vez
       % passa por todas as fotos de cada pasta
       for j=1 : length(nome_fotos)
           % imshow([nome_pasta_completo, nome_fotos(j).name]);
           % tratando a imagem
           x = lercsv([nome_pasta_completo, nome_fotos(j).name]);
           
           % A extração das caracteriscas acabou ficando igual a da Crooped
           x = linearFeaturesCrooped(x);
           
           X = [X, x]; % adicionando imagem no modelo
       end 
       MODELS(:, :, i-2) = X;
    end
    

end

