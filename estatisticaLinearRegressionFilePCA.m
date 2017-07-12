function [ resultados ] = estatisticaLinearRegressionFilePCA( MODELS, teste, pca_treino, media_treino, num_features)
% entrada  -> MODELS         | Matriz com os modelos de cada classe
%
% entrada  -> teste          | indica quais arquivos do diretório './base/'
%                              serão usados para o teste
%
%
% saida -> resultados        | Matriz com a taxa de acerto de cada classe
%

resultados = [];

classes = strsplit(teste, '|');
classes(1) = [];
for i = 1 : length(classes)
    amostras = strsplit(char(classes(i)), ',');
    
    resultadoClasse = 0;
    % Separando exemplos de cada classe
    for j = 2 : length(amostras)
        amostra_teste = char(amostras(j));
        file_origem = strcat('./base/', amostra_teste);
        
        x = imread(file_origem);
        
        y = linearFeaturesPCA(x, pca_treino, media_treino, num_features);
        
        if(classificarLinearRegression(MODELS, y) == i)
            resultadoClasse = resultadoClasse + 1;
        end
        
    end
    
    resultados = [resultados; cellstr(amostras(1)), resultadoClasse/(length(amostras)-1)];
    
end

end

