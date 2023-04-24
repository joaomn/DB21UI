
-- nome do musico e sua referente orquestra, caso nao haja musico na orquestra o cmapo fica vazio
SELECT case when mus.nome is null then "" else mus.nome end "Musicista", orq.nome "Orquestra"
from pertence pert
inner join musico mus on pert.Musico_idMusico = mus.idMusico
right join orquestra orq on pert.Orquestra_idOrquestra = orq.idOrquestra
		order by mus.Nome;

-- LISTE qunatos musicos há em cada orquestra
         
SELECT orq.nome "Oquestra", count(mus.idmusico) "Musicos Cadastrados"
	from pertence pert 
	right join orquestra orq on pert.Orquestra_idOrquestra = orq.idOrquestra
    left join musico mus on pert.Musico_idMusico = mus.idMusico
		group by orq.idOrquestra;
        
 -- musicos ordenaods por seu id       
select * from TOCA
	order by musico_idmusico;


-- contar quantas funções cada musico tem ordenando do que tem mais funcoes para o que tem menos

select mus.Nome , mus.identidade , count(func.IdFuncao) 
	from musico mus
	left join funcao func on mus.idMusico = func.Musico_idMusico
		group by mus.idMusico
        order by  count(func.IdFuncao) desc;


    
    -- liste o nome do musico, sua nacionalidade, sua função principal e quantas funções o mesmo pode desemprenhar diferentes.
    SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
    
    select mus.nome"Musicista", mus.nacionalidade" Nacionalidade", func.nome "Função Principal", count(func.idfuncao) "Qtd de funçoes"
    from musico mus 
    inner join funcao func on mus.idMusico = func.Musico_idMusico
		group by mus.idMusico; 
        
   
 -- liste o nome do music, seu id e sua idade
SELECT nome, idMusico, TIMESTAMPDIFF(YEAR, Dt_nascimento, NOW()) AS idade FROM musico;

   
-- liste o nome do musico, sua identidade, sua nacionalidade, quantas sinfonias ele toca e quantas apresentações ele fez
SELECT mus.nome , mus.identidade, mus.nacionalidade, sinf.nome, count( apre.Dt_apresentacao ) "apresentações do musicista a partir de 2022"
from apresenta apre 
inner join musico mus on mus.idMusico = apre.Musico_idMusico
inner join sinfonia sinf on apre.Sinfonia_idSinfonia = sinf.idSinfonia
	group by mus.idMusico
    order by count( (select apre.Dt_apresentacao >= '2022-01-01' )) desc, mus.Nome;


-- liste o nome e quantas apresentações cada orquestra fez 
SELECT orq.nome, case when apre.Dt_apresentacao is null then 0 else count(apre.Dt_apresentacao) end "numero de apresentações"
from apresenta apre
right join sinfonia sinf on apre.Sinfonia_idSinfonia = sinf.idSinfonia
inner join executa exec on sinf.idSinfonia = exec.Sinfonia_idSinfonia
left join orquestra orq on exec.Orquestra_idOrquestra = orq.idOrquestra
	 group by orq.idOrquestra
    order by  case when apre.Dt_apresentacao > '2022-01-01' then 0 else count(apre.Dt_apresentacao) end  desc;



-- liste quantas apresentações cada orquestra fez no ano de 2022
select count(Dt_apresentacao) from apresenta where Dt_apresentacao like '2022%';

-- liste o nome e quantas apresentações cada orquestra fez no ano de 2022
SELECT orq.nome, COUNT(DISTINCT apre.Dt_apresentacao) AS "numero de apresentacoes em 2022"
FROM apresenta apre
right JOIN sinfonia sinf ON apre.Sinfonia_idSinfonia = sinf.idSinfonia
inner JOIN executa exec ON sinf.idSinfonia = exec.Sinfonia_idSinfonia
inner JOIN orquestra orq ON exec.Orquestra_idOrquestra = orq.idOrquestra
WHERE apre.Dt_apresentacao LIKE '2022-%'
GROUP BY orq.idOrquestra;


-- liste o nome do musico, a identidade do musico, o nome da sua orquestra e que instrumento ele toca ordenado pelo nome do musico
select mus.nome "Musicista",mus.Identidade "Identidade", orq.nome "Orquestra", inst.nome "Instrumento"
from musico mus 
inner join pertence pert on mus.idMusico = pert.Musico_idMusico
inner join orquestra orq on pert.Orquestra_idOrquestra = orq.idOrquestra
inner join toca toc on mus.idMusico = toc.Musico_idMusico
inner join instrumento inst on inst.IdInstrumento = toc.Instrumento_IdInstrumento
	order by mus.Nome;

-- liste os musicos que sao menores  de 21 anos
select mus.nome, mus.identidade, idade.idade  
from musico mus
inner join idade_musico idade on idade.idMusico = mus.idMusico
where  idade.idade < 21;

-- lieste todas as orquestras que tocam mozart, diga o nome de cada sinfonia e as ordene da orquestra mais velha para a mais nova

select orq.nome, sinf.nome, sinf.compositor,TIMESTAMPDIFF(YEAR, orq.Dt_criacao, NOW()) "idade orq"
from executa exc 
	inner join orquestra orq on exc.Orquestra_idOrquestra = orq.idOrquestra
	inner join sinfonia sinf on exc.Sinfonia_idSinfonia = sinf.idSinfonia
		where sinf.Compositor like 'mozar%'
			order by TIMESTAMPDIFF(YEAR, orq.Dt_criacao, NOW()) desc;
            
-- liste todos os músicos que tocaram  Beethovem, a data em que apresentaram e os ordene pela apresentação mais recente.
select mus.nome, sinf.nome,sinf.Compositor, func.nome, apr.Dt_apresentacao
from apresenta apr 
inner join musico mus on apr.Musico_idMusico = mus.idMusico
inner join sinfonia sinf on apr.Sinfonia_idSinfonia = sinf.idSinfonia
inner join funcao func on apr.Funcao_IdFruncao = func.idfuncao
where sinf.Compositor like 'beethoven'
order by apr.Dt_apresentacao desc;

-- liste quantas sinfonias  sao executadas por cada orquestra, a idade da orquestra e seu pais  ordenando pela orquestra mais velha.

select orq.nome "Orquestra", TIMESTAMPDIFF(YEAR, orq.Dt_criacao, NOW()) "Idade da Orqestra", orq.pais "País", count(exc.Sinfonia_idSinfonia) "Sinfonias executadas"
from executa exc
right join orquestra orq on exc.Orquestra_idOrquestra = orq.idOrquestra
inner join sinfonia sinf on exc.Sinfonia_idSinfonia = sinf.idSinfonia
group by orq.idOrquestra
order by TIMESTAMPDIFF(YEAR, orq.Dt_criacao, NOW()) desc;

-- liste os musicos que tem a funcao de matestro, diga seu nome, identidade, nacionalidade, idade e ordene do mais velho para o mais novo
select mus.nome "Musico", mus.identidade "Identidade", mus.Nacionalidade "Nacionalidade", idade.idade "Idade", func.nome "Função"
from musico mus
inner join idade_musico idade on mus.idMusico = idade.idmusico
inner join funcao func on mus.idMusico = func.Musico_idMusico
where func.Nome like 'maestro'
order by idade.idade desc;

-- liste todos os instrumentos e quantos musicos são aptos a tocar cada um deles
select inst.nome, count(toc.Musico_idMusico)
from toca toc 
right join instrumento inst on toc.Instrumento_IdInstrumento = inst.IdInstrumento
left join musico mus on toc.Musico_idMusico = mus.idMusico
group by inst.IdInstrumento
order by count(toc.Musico_idMusico) desc; 

-- liste musicos, dizendo seu nome,sua identidade,sua idade e o nome da orquestra em que ele pertence. apenas musicos com mais de 30 anos que pertencem a orquestras centenarias
select mus.nome "Musico", mus.identidade" CPF", idade.idade "Idade", orq. nome "Orquestra", TIMESTAMPDIFF(YEAR, orq.Dt_criacao, NOW()) " Idade da Orquestera"
from pertence pert 
inner join musico mus on pert.Musico_idMusico = mus.idMusico
inner join orquestra orq on pert.Orquestra_idOrquestra = orq.idOrquestra
inner join idade_musico idade on idade.idmusico = mus.idMusico
where idade.idade >= 30 and TIMESTAMPDIFF(YEAR, orq.Dt_criacao, NOW()) >= 100;

-- lista das orquestras que tocam musicas criadas entre 1700 e 1800 com o nome de cada sinfonia e seu respectivo autor
select orq.nome" Orquestra", sinf.nome "Sinfonia", sinf.compositor "Compositor"
from executa exc
inner join orquestra orq on exc.Orquestra_idOrquestra = orq.idOrquestra
inner join sinfonia sinf on exc.Sinfonia_idSinfonia = sinf.idSinfonia
where sinf.Dt_criacao between '1700-01-01' and '1800-12-31';



-- liste sinfonias que sao executadas por musicos menores que 30 anos que tenham a funcao maestro
select sinf.nome "Sinfonia", mus.nome "Musico", idade.idade "Idade do Musico", func.nome "Função" 
from apresenta apre 
inner join sinfonia sinf on apre.Sinfonia_idSinfonia = sinf.idSinfonia
inner join musico mus on apre.Musico_idMusico = mus.idMusico
inner join funcao func on apre.Funcao_IdFruncao = func.idfuncao
inner join idade_musico idade on idade.idmusico = mus.idMusico
where idade.idade < 30 and func.Nome like 'maestro';


-- liste sinfonias que foram apresentatas no ano de 2023 e se a nacionalidade do musico for brasileira o campo deve conter sim, caso contrario nao
select sinf.nome, mus.nome, case when mus.nacionalidade like 'Brasileira' then "SIM" else "NÃO" end "É Brasileiro?"
from apresenta apre 
inner join musico mus on apre.Musico_idMusico = mus.idMusico
inner join sinfonia sinf on apre.Sinfonia_idSinfonia = sinf.idSinfonia
where apre.Dt_apresentacao >= '2023-01-01';

    
		
