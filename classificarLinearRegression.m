function [ classe ] = classificarLinearRegression( MODELS, y )
%CLASSIFICARLINEARREGRESSION Summary of this function goes here
%   
% recebe as features y e os modelos e devolve o id da classe que y pertence
%
% Entrada -> MODELS    | matriz tridimensional com todos os modelos, cada
%                        dimensal representa o modelo de uma classe.
% Entrada -> y         | features de uma imagem
%
% Saida -> classe      | id da classe de x em MODELS

    [linhas, colunas, dimensions] = size(MODELS); % dimensions = numero de classes
    
    Y = []; % vetor com a projecao yChapeu de cada classe.
    
    for(i=1 : dimensions)
    
        X = MODELS(:, :, i);        % i ésimo modelo
        B = inv(X' * X) * X' * y;     % vetor de parametros
        yChapeu = X*B;              % projecao
    end


end

