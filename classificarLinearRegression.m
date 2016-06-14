function [ indiceModelo ] = classificarLinearRegression( MODELS, y )
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
     menorDistancia = 0;   
     indiceModelo = 0;
     
    for(i=1 : dimensions)
        
        X = MODELS(:, :, i);          % i ésimo modelo
        B = inv(X' * X) * X' * y;     % vetor de parametros
        yChapeu = X*B;                % projecao
        vetorSubtracao = y - yChapeu; % subtraindo modelo original por modelo de outras imagens
        distancia = norm(vetorSubtracao, 2); % distancia euclidiana do vetorSubtracao
        
        % verifica qual modelo tem a menor distancia e retorna esse modelo
        if(i == 1)
            menorDistancia = distancia;
            indiceModelo = i;
        end
        if(distancia < menorDistancia)  
            menorDistancia = distancia;
            indiceModelo = i;
        end
    end


end

