function [treino teste ] = separarbaseHoldout( file_name, indice  )

% Atualmente usado para separar as bases em wavelet
% ----------------------------
% Cada linha contem um holdout;
% Dentro de cada holdout a parte de treino e teste está separada por ';' ponto de vírgula;
% Dentro do treino/teste, cada classe está separada por '|' e o primeiro elemento da classe é o nome da classe;
% Dentro de cada classe, as amostras estão separadas por ',' vírgula.
% ----------------------------
% file_name = nome do arquivo que contem a separação da base
% indice = holdout da vez

result = fileread(file_name);
result = strsplit(result, '\n');
result = result';

holdout = char(result(indice));
holdout = strsplit(holdout, ';');
treino = char(holdout(1));
teste = char(holdout(2));

% ------- Renomear a extensão dos arquivos
treino = strrep(treino, '.csv', '.png');
teste = strrep(teste, '.csv', '.png');

end

