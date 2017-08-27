function [ indiceModelo ] = classificarLinearRegressionCrooped( MODELS, x, downsampleX, downsampleY)
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
    
   % --- recortando a imagem ---
        % --- GTech ---
        x = imresize(x, [150, 150]);
        % ---
   [sizeY sizeX] = size(x);
    
    % ---------------------------
    
    
    % Classes
    for(i=1 : dimensions)
        
        valorYI = 1;
        valorYF = sizeY/cortes;
        distanciaClasse = 0;
        
        % Cortes por classe
        for corte=1 : (cortes*2)
            
            x2 = x;
            
            if (mod(corte, 2)==1)
                x2 = x2(valorYI:valorYF, 1:(sizeX/2));
            else
                x2 = x2(valorYI:valorYF, (sizeX/2)+1:sizeX);
            end
            %imshow(x); %vendo a classificacao
            y = linearFeaturesCrooped(x2, downsampleX, downsampleY);
            
            X = MODELS(:, :, i, corte);          % i ésimo modelo
            B = inv(X' * X) * X' * y;     % vetor de parametros
            yChapeu = X*B;                % projecao
            vetorSubtracao = y - yChapeu; % subtraindo modelo original por modelo de outras imagens
            distanciaCorte = norm(vetorSubtracao, 2); % distancia euclidiana do vetorSubtracao
            
            % A distância da classe vai ser a menor distancia entre todos
            % os cortes.
            if (corte == 1)
                distanciaClasse = distanciaCorte;
            elseif(distanciaCorte < distanciaClasse)
                    distanciaClasse = distanciaCorte;
            end           
                   
            if (mod(corte,2)==0)
                valorYI = valorYF+1;
                valorYF = valorYF + (sizeX/cortes);
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

