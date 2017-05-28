--- Termina��es dos arquivos ---

Arquivos sem termina��es exclusivas:	Usam a extra��o de Caracter�sticas normal do artigo "./linear Regression.pdf".
					Trabalham com as pastas "./test/" e "./treino" que contem os arquivos em formato de imagem que ser�o usados para treino e teste das bases.
					Feito para trabalhar com folders, onde os resultados ser�o extra�dos 1 fold por rodada, ou seja, se existem N folders, o arquivo ter� que 
					ser N vezes e o conteudo das pastas "./test/" e "./treino" ter� que ser substituido em cada rodada.
					
Arquivos com termina��es em *File:	Trabalham com holdouts em vez de folders. Nesse caso as classes da base a ser rodada ter� que estar na pasta "./base/" e os arquivos ter�o
					estar em formato de imagem.
					Usa um arquivo "*.txt" que contem as informa��es necess�rias para separar as bases de treino e teste de cada holdout.
					
Arquivos com termina��es em *Cropped:	Usam a extra��o de Caracter�sticas normal do artigo "./linear Regression.pdf". Por�m faz isso de forma modular, onde cada classe em vez de
					ser representada por apenas 1 modelo, ser� representada por numeroCortes*2 modelos. numeroCortes indica quantos cortes horizontais ser�o
					feitos na imagem, por padr�o ser� feito apenas um corte na vertical separando a imagem em 2.
					
					O "Models" (variavel que contem os Modelos de cada classe) � uma Matriz com 4 dimensoes (ao inv�s de 3, n�mero usado pelos arquivos sem a
					termina��o "*Crooped") onde cada 3" dimens�o representa uma classe e a 4" dimensao representa os modelos daquela classe. Cada classe tera
                              		numeroCortes*2 modelos.

Arquivos com termina��es em *Wavelet: 	Usam uma varia��o da extra��o de caracter�ticas encontrada em "./linear Regression.pdf", onde a redu��o de dimensionalidade em vez de ser
					feito por um resize ou downsample � feito atravez do wavelets.
					
					Apesar de n�o conter a termina��o *File, tamb�m carregam a base a partir de um arquivo igual os com a termina��o *File.
                              
                             

--- Configura��o dos holdouts ---

Ser�o carregadas de um arquivo "*.txt".

A configura��o que eu usei foi a seguinte:

Cada linha contem um holdout;
Dentro de cada holdout a parte de treino e teste est� separada por ';' ponto de v�rgula;
Dentro do treino/teste, cada classe est� separada por '|' e o primeiro elemento da classe � o nome da classe;
Dentro de cada classe, as amostras est�o separadas por ',' v�rgula.

