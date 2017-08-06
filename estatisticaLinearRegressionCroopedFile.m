function [ resultados ] = estatisticaLinearRegressionCroopedFile( MODELS, teste, downsampleX, downsampleY)
% entrada  -> MODELS         | Matriz com os modelos de cada classe
%
% entrada  -> teste          | indica quais arquivos do diretório './base/'
%                              serão usados para o teste
%
% entrada  -> downsamplesize | indica o tamanho do downsample usado nas
%                              imagens, geralmente cada base ultiliza um
%                              tamanho de downsample diferente.
% entrada  -> cortes         | numero de cortes feitos na imagem para o
%                              treino.
%
% saida -> resultados        | Matriz com a taxa de acerto de cada classe
%

resultados = [];

classes = strsplit(teste, '|');
classes(1) = [];

% passa por todas as classes
for i = 1 : length(classes)
    
    amostras = strsplit(char(classes(i)), ',');
    
    resultadoClasse = 0;
    % passa por todas as fotos de cada classes
    for j = 2 : length(amostras)
        amostra_teste = char(amostras(j));
        file_origem = strcat('./base/', amostra_teste);
        % imshow(file_origem);
        % tratando a imagem
        x = imread(file_origem);
%         x = imresize(x, [downsampleX, downsampleY]); % resize
        x = rgb2gray(x); % de colorido para preto e branco
        
        if(classificarLinearRegressionCrooped(MODELS, x, downsampleX, downsampleY) == i)
            resultadoClasse = resultadoClasse + 1;
        end
        
    end % amostras de cada classe
    
    resultados = [resultados; cellstr(amostras(1)), resultadoClasse/(length(amostras)-1)];
    
end % classes

end

