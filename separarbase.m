function [ ] = separarbase( file_name, nomes  )

    %random
    %rng(0,'twister');
 
%  destino = ['./individuos_qr'];
%  mkdir(destino);
    
 file_name = [file_name, '/'];
%  nome_fotos = dir([file_name, '/*jpg']);
%  
%  for i = 1 : length(nome_fotos)
%      
%     classe = nome_fotos(i).name(1:5);
%     
%     classeFolder = [destino, '/', classe];
%     mkdir(classeFolder);
%     
%     copyfile([file_name, nome_fotos(i).name], [classeFolder, '/', nome_fotos(i).name]);
%         
%     
%  end    
%  
    pastas = dir(file_name);
      
       
%     for i = 3 : length(pastas)
%         
%        nome_pasta = pastas(i).name;
%        nome_pasta_completo = [file_name, nome_pasta, '/'];
%        nome_fotos = dir([nome_pasta_completo, '/*jpg']);
%        
%        mkdir(['./test/', nome_pasta]);
%        mkdir(['./treino/', nome_pasta]);
%        for j = 1 : length(nome_fotos)
%            
%            % if j > (length(nome_fotos) - (length(nome_fotos)/4))
%              
%                 if j <= 3
%                     movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
%                 end
%                 
%                 if j == 4
%                     movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./test/', nome_pasta, '/', nome_fotos(j).name ])
%                 end    
%               
%             %end            
%        end   
%     end
% 
%         ---- random
%         [trainInd,valInd,testInd] = dividerand( length(nome_fotos),0.7,0.0,0.2);
%         test
%     
%         copyfile([ nome_pasta_completo, '/', nome_fotos(testInd(1)).name ], ['./test/', nome_pasta, '/', nome_fotos(testInd(1)).name ])
%         copyfile([ nome_pasta_completo, '/', nome_fotos(testInd(2)).name ], ['./test/', nome_pasta, '/', nome_fotos(testInd(2)).name ])
%         
%         treino
%         copyfile([ nome_pasta_completo, '/', nome_fotos(trainInd(1)).name ], ['./treino/', nome_pasta, '/', nome_fotos(trainInd(1)).name ])
%         copyfile([ nome_pasta_completo, '/', nome_fotos(trainInd(2)).name ], ['./treino/', nome_pasta, '/', nome_fotos(trainInd(2)).name ])
%         copyfile([ nome_pasta_completo, '/', nome_fotos(trainInd(3)).name ], ['./treino/', nome_pasta, '/', nome_fotos(trainInd(3)).name ])
%         copyfile([ nome_pasta_completo, '/', nome_fotos(trainInd(4)).name ], ['./treino/', nome_pasta, '/', nome_fotos(trainInd(4)).name ])
%         copyfile([ nome_pasta_completo, '/', nome_fotos(trainInd(5)).name ], ['./treino/', nome_pasta, '/', nome_fotos(trainInd(5)).name ])
        
%    end    
end

