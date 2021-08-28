# Anotações de RxJS: Programação Reativa
A programação reativa afeta o fluxo de dados entre os objetos, no Angular temos os Observables, que são modificados e afetam os Subscribers. 
[Video aula](https://youtu.be/hrSYyr2sUac)
> ### Observables in [Angular](https://angular.io/guide/observables-in-angular#observables-in-angular "Link to this heading")
> Angular makes use of observables as an interface to handle a variety of common asynchronous operations. For example:
> -   You can define  [custom events](https://angular.io/guide/event-binding#custom-events-with-eventemitter)  that send observable output data from a child to a parent component.
> -   The HTTP module uses observables to handle AJAX requests and responses.
>-   The Router and Forms modules use observables to listen for and respond to user-input events.
 ```javascript
const  maioresAgrupadosPorGenero = pessoas =>
	pessoas
		.filter(e=> e.idade >= 18)
		.reduce( (a,b) => ({
		...a,
		[b.sexo] : {... (a[b.sexo] || []), b}
	}), {} )
	
const pessoas = {
	{nome: "João", sexo: "masculino", idade: 18},
	{nome: "José", sexo: "masculino", idade: 32},
	{nome: "Maria", sexo: "feminino", idade: 11},
	{nome: "Julia", sexo: "feminino", idade: 23}
}

maioresAgrupadosPorGenero(pessoas)
 ``` 
### Dúvida rápida sobre [Rest parameters](https://dev.to/sagar/three-dots---in-javascript-26ci)

## Princípios da programação reativa

 - Elasticidade: Reage à demanda e carga
 - Resiliência: Reage a falhas
 - Message Driven: Reage a eventos
 - Resposivo: Reage ao usuário
### Padrões do ReactiveX
 - Obervable Pattern
 - Iterator Pattern
 - Programação Multifuncional
 Tem programação Reactiva para várias linguagens e RxJS é uma delas

## Como ficaria em Rx?
 ```javascript
 import {from} from 'rxjs'
 import {filter, reduce} from 'rxjs/operators'
const  maioresAgrupadosPorGenero = () => source$ =>
	source$.pipe(
		.filter(e=> e.idade >= 18)
		.reduce( (a,b) => ({
		...a,
		[b.sexo] : {... (a[b.sexo] || []), b}
	}), {}
	)
	
const pessoas = {
	{nome: "João", sexo: "masculino", idade: 18},
	{nome: "José", sexo: "masculino", idade: 32},
	{nome: "Maria", sexo: "feminino", idade: 11},
	{nome: "Julia", sexo: "feminino", idade: 23}
}

from(pessoas)
	.pipe(maioresAgrupadosPorGenero())
	.subscribe(e=> console.log(e), err => console.error(err))
 ``` 
O que muda é a propagação dos dados, não temos o filtro e reduce de ```pessoas```, mas sim de ```source$``` . Usamos o Pipe não necessariamente um array, mas outras estruturas de dados.

## Observables e Promises
Ambos são capazes de encapsularem dados,, segue abaixo algumas diferenças:
> O **encapsulamento dos dados** é um mecanismo utilizado para reunir os dados e os métodos numa estrutura que pode esconder a implementação do objeto, ou seja, ele impede o acesso aos dados por um meio diferente dos serviços propostos. A encapsulação garante, desta maneira a integridade dos dados contidos no objeto. (fonte)[https://br.ccm.net/contents/413-poo-encapsulamento-dos-dados]

### 1# Promises x Observables: único valor x múltiplos valores
```javascript
	const {Observable} = rxjs
	//1 é o dado encapsulado
	Promise.resolve(1)
		.then(num => console.log(num))
	//Criar um callback dentro de um create
	Observable.create((observer) => {
		observer.next(1)
	}).subscribe(num => console.log(num))
```

```javascript
//Forma alternativa
	const {Observable} = rxjs
	//Observe que o uma vez que a promise é resolvida ela nao emite mais nada, imprimindo apenas o numero 1
	new Promise((resolve)=>{
		resolve(1)
		resolve(2)
	})
		.then(num => console.log('Promise', num))
	//Criar um callback dentro de um create
	Observable.create((observer) => {
		observer.next(1)
		observer.next(2)
	}).subscribe(num => console.log('Observable',num))
	//Seria impresso 
		//Observable 1 
		//Observable 2
```

### 2# Promises x Observables: Eager (execução imediata) x Lazy (execução por demanda)
```javascript
//O promise executa, mas o observable não resolve a não ser que seja chamada
	const {Observable} = rxjs
	new Promise((resolve)=>{
		console.log("Iniciando a promise")
		resolve(1)
		resolve(2)
	})
	//Criar um callback dentro de um create
	Observable.create((observer) => {
		console.log("Iniciando a observable")
		observer.next(1)
		observer.next(2)
	})
```
### 3# Promises x Observables: compartilhada (multicast) x compartilhada ou não (unicast/multicast)
No promise mantém um estado compartilhado e o bloco que é inscrito; A promise é executada uma única vez; e os blocos inscritos não sao resetados e recebem os valores da única vez que a promise executou.
O observer pode ter 

### (Cronologia e Cancelamento)[https://youtu.be/eYrTTcudV6g]
```javascript
	const {Observable} = rxjs
	const {share} = rxjs.operator
	//Como é um promise o bloco é setado uma única vez e não é re-executado
	const promise = new Promise( (resolve) => {
		console.log("Iniciando Promise")
		setTimeout( () => resolve(1), 3000)
	} )

	const observer = Observable.create( (observer) => {
		console.log("Iniciando o observable")
		setTimeout( () => observer.next(1), 3000)
	} ).pipe(
		share()
	)
//Quando adicionamos o share() configura o Observable para estado congelado
	promise.then( num => console.log('Promise', num))
	observer.subscribe( num => console.log('Observable', num) )
	setTimeout( () => {
		promise.then( num => console.log('Promise', num) )
		observer.subscribe(num => console.log('Observable', num), 2000)
	} )

```
### Promises: Assíncronas e Observables:  Síncronas ou Assíncronas

> Written with [StackEdit](https://stackedit.io/).
