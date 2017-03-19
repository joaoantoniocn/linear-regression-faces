function [ ] = moverImagem( file_name  )

img01 = '+000E+00';
img02 = '+050E+00';
img03 = '+000E-35';
img04 = '+020E+10';
img05 = '+035E+40';
img06 = '+050E-40';
img07 = '+070E-35';
img08 = '+110E+15';
img09 = '+110E+65';
img10 = '-005E+10';
img11 = '-005E-10';
img12 = '-020E-10';
img13 = '-025E+00';
img14 = '-035E+40';
img15 = '-060E+20';
img16 = '-070E+45';
img17 = '-085E-20';
img18 = '-110E+40';
img19 = '-130E+20';

file_name = [file_name, '/'];
pastas = dir(file_name);

for i = 3 : length(pastas)
    
    nome_pasta = pastas(i).name;
    nome_pasta_completo = [file_name, nome_pasta, '/'];
    nome_fotos = dir([nome_pasta_completo, '/*pgm']);
    
%     mkdir(['./test/', nome_pasta]);
    mkdir(['./treino/', nome_pasta]);
    for j = 1 : length(nome_fotos)
        
        if((size(strfind(nome_fotos(j).name, img01)) > 0))
                movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
        end
        if (size(strfind(nome_fotos(j).name, img02)) > 0)
                movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
        end
        if (size(strfind(nome_fotos(j).name, img03)) > 0)
                movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
        end
        if (size(strfind(nome_fotos(j).name, img04)) > 0)
                movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
        end
        if (size(strfind(nome_fotos(j).name, img05)) > 0)
                movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
        end
        if (size(strfind(nome_fotos(j).name, img06)) > 0)
                movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
        end
        if (size(strfind(nome_fotos(j).name, img07)) > 0)
                movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
        end
        if (size(strfind(nome_fotos(j).name, img08)) > 0)
                movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
        end
        if (size(strfind(nome_fotos(j).name, img09)) > 0)
                movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
        end
        if (size(strfind(nome_fotos(j).name, img10)) > 0)
                movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
        end
        if (size(strfind(nome_fotos(j).name, img11)) > 0)
                movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
        end
        if (size(strfind(nome_fotos(j).name, img12)) > 0)
               movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
           
        end 
        if (size(strfind(nome_fotos(j).name, img13)) > 0)
               movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
           
        end 
        if (size(strfind(nome_fotos(j).name, img14)) > 0)
               movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
           
        end 
        if (size(strfind(nome_fotos(j).name, img15)) > 0)
               movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
           
        end 
        if (size(strfind(nome_fotos(j).name, img16)) > 0)
               movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
           
        end 
        if (size(strfind(nome_fotos(j).name, img17)) > 0)
               movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
           
        end 
        if (size(strfind(nome_fotos(j).name, img18)) > 0)
               movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
           
        end 
        if (size(strfind(nome_fotos(j).name, img19)) > 0)
               movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
           
        end 
        if (size(strfind(nome_fotos(j).name, img12)) > 0)
               movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
           
        end 
   end
 end
end
