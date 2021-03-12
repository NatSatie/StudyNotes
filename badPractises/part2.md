# Minhas péssimas práticas como programadora😨
Comecei a trabalhar no meu primeiro emprego como estagiária. Resolver problemas torna-se muito mais complexo do que resolver exercícios na academia e gostaria de compartilhar meus péssimos hábitos que estão sendo corrigidos no momento.

## Chamar valores undefined e null

### Situação 1: Cadeia de condicionais
Recentemente vi Lead Tech programando e quero registrar e ressaltar como experiência e prática andam juntos. Esse era o tipo de código que ele viu:

``` javascript
	// PROBLEMA: A componente estava mostrando uma tag definida como "Disponível" ou "Indisponível"
		// Falha: Se o variableStatus está como "undefined" não é para aparecer nenhuma das opções abaixo
		(variableStatus.IsActive) ? ("Disponível") : ("Indisponível")
```

``` javascript
	// SOLUÇÃO: Devemos fazer uma verificação se o Status é um booleano
		( typeof(variableStatus.IsActive) !== 'boolean' ) && ( 
			(variableStatus.IsActive) ? ("Disponível") : ("Indisponível") 
		)
		// !== significa estritamente não igual, isso só e somente vai atender a condição se o variableStatus for um booleano.
```

### Situação 2: Esqueci do AND de novo!

``` javascript
	// PROBLEMA: Dado uma string chamada text, quero verificar se ela é vazia ou não.
	conditional ? function : ''
```

``` javascript
	// SOLUÇÃO: 
	conditional && function
```

## Mais ideias

- Returns desnecessários
- Funções que não conhecia
- Uso adequado de map, forEach
- Usando margins, padding no CSS

> Written with [StackEdit](https://stackedit.io/).
