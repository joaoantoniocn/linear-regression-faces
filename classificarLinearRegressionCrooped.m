function [ indiceModelo ] = classificarLinearRegressionCrooped( MODELS, x)
%CLASSIFICARLINEARREGRESSION Summary of this function goes here
%   
% recebe as features y e os modelos e devolve o id da classe que y pertence
%
% Entrada -> MODELS    | matriz tridimensional com todos os modelos, cada
%                        dimensal representa o modelo de uma classe.
% Entrada -> y         | features de uma imagem
%
% Saida -> classe      | id da classe de x em MODELS

    [linhas, colunas, dimensions, cortes] = size(MODELS); % dimensions = numero de classes
    
    cortes = cortes/2;
    menorDistancia = 0;   
    indiceModelo = 0;
    
    [tamX, tamY] = size(x); % tamanho da foto
    
    
    % Classes
    for(i=1 : dimensions)
        
        valorYI = 1;
        valorYF = tamX/cortes;
        distanciaClasse = 0;
        
        % Cortes por classe
        for corte=1 : (cortes*2)
            
            x2 = x;
            
            if (mod(corte, 2)==1)
                x2 = x2(valorYI:valorYF, 1:(tamY/2));
            else
                x2 = x2(valorYI:valorYF, (tamY/2)+1:tamY);
            end
            %imshow(x); %vendo a classificacao
            y = linearFeaturesCrooped(x2);
            
            X = MODELS(:, :, i, corte);          % i ésimo modelo
            B = inv(X' * X) * X' * y;     % vetor de parametros
            yChapeu = X*B;                % projecao
            vetorSubtracao = y - yChapeu; % subtraindo modelo original por modelo de outras imagens
            distanciaCorte = norm(vetorSubtracao, 2); % distancia euclidiana do vetorSubtracao
            distanciaClasse = distanciaClasse + distanciaCorte; % somando a distancia de todos os cortes
            
            if (mod(corte,2)==0)
                valorYI = valorYF+1;
                valorYF = valorYF + (tamX/cortes);
            end
        end % cortes
             
        % verifica qual modelo tem a menor distancia e retorna esse modelo
        if(i == 1)
            menorDistancia = distanciaClasse;
            indiceModelo = i;
        end
        if(distanciaClasse < menorDistancia)  
            menorDistancia = distanciaClasse;
            indiceModelo = i;
        end
    end


end

