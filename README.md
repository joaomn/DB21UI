# DB21UI


Escola de Música:

Uma escola de música precisa manter uma base de dados organizada com o objetivo
de prover informações sobre músicos, orquestras, sinfonias e instrumentos:

● Cada orquestra é catalogada contendo o seu nome, cidade, país e data
correspondentes à sua criação;

● Orquestras executam sinfonias, as mais variadas. Os profundos conhecedores
de música são capazes até de selecionar a orquestra que melhor desempenha uma
determinada sinfonia. De cada uma sinfonia, é possível saber o seu nome, o
compositor e a data de sua criação;

● Orquestras são constituídas de músicos, os mais variados, de acordo com a
sua função dentro da mesma: maestro, flautista, etc. Cada músico é catalogado
contendo: nome do músico, identidade, nacionalidade e data de nascimento. Um
músico só pode pertencer a uma orquestra;

● Músicos tocam sinfonias, porém em alguns casos, alguns músicos podem
mudar de função segundo a sinfonia (por exemplo, um violinista pode virar maestro).
A data em que um músico apresenta uma determinada sinfonia também é importante
no contexto.

● Cada músico pode ser apto a tocar vários instrumentos, mas em cada sinfonia
toca apenas um instrumento, pois depende de sua função na sinfonia.

● Foi pedido para adicionar o atributo grupo em instrumento, mas depois pediram para retira-lo


########################################################################################################

modelo entitade relacionamento (MER) :

![image](https://user-images.githubusercontent.com/97440058/234094649-13ba35cb-ee63-42e5-9b21-687104a0b036.png)


modelo relacional (MR) :


![image](https://user-images.githubusercontent.com/97440058/234094870-ec76666e-4011-4b78-9e5f-0ee9776c4a9e.png)



################################################################################

                                RELATORIOS PEDIDOS
                               
1 # Nome do musico e sua referente orquestra, caso nao haja musico na orquestra o campo fica vazio

2 # Liste quantos musicos há em cada orquestra

3 # Musicos ordenados por seu id  

4 # Contar quantas funções cada musico tem ordenando do que tem mais funcoes para o que tem menos

5 # Liste o nome do musico, sua nacionalidade, sua função principal e quantas funções o mesmo pode desemprenhar diferentes.

6 # Liste o nome do musico, seu id e sua idade

7 # Liste o nome e quantas apresentações cada orquestra fez 

8 # Liste quantas apresentações cada orquestra fez no ano de 2022

9 # Liste o nome e quantas apresentações cada orquestra fez no ano de 2022

10 # Liste o nome do musico, a identidade do musico, o nome da sua orquestra e que instrumento ele toca ordenado pelo nome do musico

11 # Liste os musicos que sao menores  de 21 anos

12 # Liste todas as orquestras que tocam mozart, diga o nome de cada sinfonia e as ordene da orquestra mais velha para a mais nova

13 # Liste todos os músicos que tocaram  Beethovem, a data em que apresentaram e os ordene pela apresentação mais recente.

14 # Liste quantas sinfonias  sao executadas por cada orquestra, a idade da orquestra e seu pais  ordenando pela orquestra mais velha

15 # Liste os musicos que tem a funcao de matestro, diga seu nome, identidade, nacionalidade, idade e ordene do mais velho para o mais novo

16 # Liste todos os instrumentos e quantos musicos são aptos a tocar cada um deles

17 # Liste musicos, dizendo seu nome,sua identidade,sua idade e o nome da orquestra em que ele pertence. apenas musicos com mais de 30 anos que pertencem a orquestras centenarias

18 # Lista das orquestras que tocam musicas criadas entre 1700 e 1800 com o nome de cada sinfonia e seu respectivo autor

19 # Liste sinfonias que sao executadas por musicos menores que 30 anos que tenham a funcao maestro

20 # Liste sinfonias que foram apresentatas no ano de 2023 e se a nacionalidade do musico for brasileira o campo deve conter sim, caso contrario nao


############################################################################################################


