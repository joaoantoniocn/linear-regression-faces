function [ fractional_cov, media_features ] = fractionalcovariancia( base_treino, r )
%FRACTIONALCOVARIANCIA Calcula a matriz de covariancia fractional
% MODEL = cada coluna uma amostra, cada linha uma feature
% r = potencia do pca fracionario. r entre [0 1]

    media_features = mean(base_treino'); % m�dia das features da base
    media_features = power(media_features, r); % m�dia fracion�ria
    media_features = media_features'; % transformando em um vetor coluna
    
    fractional_cov = zeros(length(media_features));
   
    for i = 1 : length(base_treino(1,:))
        Xi = base_treino(:, i); % i-�sima amostra
        Xi = power(Xi, r); % Xi fracionario
        
        subtracao = Xi - media_features;
        subtracaoT = subtracao'; % transposta
        Xi = [];            % liberando memoria
        multiplicacao = subtracao * subtracaoT;
        subtracao = [];
        subtracaoT = [];
        
        fractional_cov = fractional_cov + multiplicacao;
        multiplicacao = []; % liberando memoria
    end    
    
    fractional_cov = fractional_cov / (length(base_treino(1,:)) - 1);
end

