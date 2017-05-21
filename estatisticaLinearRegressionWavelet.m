function [ resultados ] = estatisticaLinearRegressionWavelet( MODELS, teste )
%
% varre todas as pastas do diretorio indicado em CAMINHO_BASE e gera uma
% matriz com a taxa de acerto de cada classe
%
% saida -> resultados        | Matriz com a taxa de acerto de cada classe
%

% %   Detailed explanation goes here
%     CAMINHO_BASE = './test/';
% %    base = dir([CAMINHO_BASE,'/*.jpg']);
%     pastas = dir(CAMINHO_BASE);

resultados = [];

classes = strsplit(teste, '|');
for i = 1 : length(classes)
    amostras = strsplit(char(classes(i)), ',');
    
    resultadoClasse = 0;
    % Separando exemplos de cada classe
    for j = 2 : length(amostras)
        amostra_teste = char(amostras(j));
        file_origem = strcat('./base/', amostra_teste);
        x = lercsv(file_origem);
        
        % A extração das caracteriscas acabou ficando igual a da Crooped
        y = linearFeaturesCrooped(x);
        
        if(classificarLinearRegression(MODELS, y) == i)
            resultadoClasse = resultadoClasse + 1;
        end
        
    end
    
    resultados = [resultados; cellstr(amostras(1)), resultadoClasse/(length(amostras)-1)];
    
end

end

