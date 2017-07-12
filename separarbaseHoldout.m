function [treino teste ] = separarbaseHoldout( file_name, indice  )

% Atualmente usado para separar as bases em wavelet
% ----------------------------
% Cada linha contem um holdout;
% Dentro de cada holdout a parte de treino e teste est� separada por ';' ponto de v�rgula;
% Dentro do treino/teste, cada classe est� separada por '|' e o primeiro elemento da classe � o nome da classe;
% Dentro de cada classe, as amostras est�o separadas por ',' v�rgula.
% ----------------------------
% file_name = nome do arquivo que contem a separa��o da base
% indice = holdout da vez

result = fileread(file_name);
result = strsplit(result, '\n');
result = result';

holdout = char(result(indice));
holdout = strsplit(holdout, ';');
treino = char(holdout(1));
teste = char(holdout(2));

% ------- Renomear a extens�o dos arquivos
treino = strrep(treino, '.csv', '.png');
teste = strrep(teste, '.csv', '.png');

end

