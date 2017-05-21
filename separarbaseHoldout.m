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
% % --- criar diretório para classes
% classes = strsplit(treino, '|');
% classes(1) = [];
% classes = classes';
% 
% % Apagando antigo holdout
% rmdir('./test', 's');
% rmdir('./treino', 's');
% 
% % Criando pastas para o novo holdout
% mkdir('./test');
% mkdir('./treino');
% 
% % Criando pasta para as classes
% for i = 1 : length(classes)
%     classe = strsplit(char(classes(i)), ',');
%     classe = classe(1);
%     classeTreino = strcat('./treino/', classe);
%     classeTest = strcat('./test/', classe);
%     
%     mkdir(char(classeTreino));
%     mkdir(char(classeTest));
% end
% 
% % Separando treino
% classes = strsplit(treino, '|');
% for i = 1 : length(classes)
%     classe = strsplit(char(classes(i)), ',');
%     
%     Separando exemplos de cada classe
%     for j = 2 : length(classe)
%         amostra_treino = char(classe(j));
%         file_origem = strcat('./base/', amostra_treino);
%         file_destino = strcat('./treino/', amostra_treino);
%         copyfile (char(file_origem), char(file_destino));
%     end
%     
% end
% 
% % Separando test
% classes = strsplit(teste, '|');
% for i = 1 : length(classes)
%     classe = strsplit(char(classes(i)), ',');
%     
%     % Separando exemplos de cada classe
%     for j = 2 : length(classe)
%         amostra_treino = char(classe(j));
%         file_origem = strcat('./base/', amostra_treino);
%         file_destino = strcat('./test/', amostra_treino);
%         copyfile (char(file_origem), char(file_destino));
%     end
%     
% end
%    
end

