
# Introdução de Angular (Seção 1,2,3)
>Esse é um guia de notas de estudo de Angular na Udemy. Por favor sejam bonszinhos

Angular é uma framework que usa HTML, CSS e Javascript. 
Trabalha com conceito de classes de orientação a objetos,
Angular pode ser usado em 4 linguagens: ES5, ECMASCRIPT 2015, Typescript e Dart

## Revisão de Typecript
É uma linguagem que faz parte extensão do Javascript. Typecript ofercece tipos estáticos, encapsulamento de classes e módulos, suporta código js.

Anotações para o windows: https://stackoverflow.com/questions/33535879/how-to-run-typescript-files-from-command-line

```javascript
	tsconfig.json
{
	//configurações para o compilador
	"compileOnSave":true,
	"compilerOptions": {
		"outDir":"dist"
		"onEmitOnError": false
	}
}
```
Dentro da aplicação será criado um app.js automaticamente quando cria um app.ts
```javascript
	app.ts
	let message: string = "Hallo world"
	console.log(message)
	//isso vai causar um erro no atom
		//nonEmitOnError pode silenciar esses erros
		let episode: number = 4
		episode = '4'
	//
		let favoriteDroid
		favoriteDroid = 'BB-8'
	

```

```javascript
	app.js
	//automaticamente isso é compilado
```
### Funções
```javascript
let shortestRun = function(parsecs: number): boolean {
	return parsecs < 12
}
//arrow fuctions
	let tieFighters = ships.filter(function (ship) {
		return ship.type === 'TieFighter'
	})
	let ties = ships.filter(ship => ship.type ==='TieFighter')
	//lado esquerdo os parametros
	//lado direito implementação
//exemplo 2
let call: (name:string) => void
call = name => console.log("do you copy," + name + "?")
call("r2") >Do you copy, r2?
```
### Parâmetros são opcionais.
```javascript
//marcação de opcional é "?" 
function inc(speed:number, inc?:number) : number {
	let i = inc || 1
	return speed * i
}
```
### Parâmetros rest
```javascript
//marcação é "[]" 
//sem marcação rest
	function countJedis(jedis:number[]) : number {
		return jedis.reduce( (a,b) => a + b, 0)
	}
	countJedis([2,3,4]) >9
//com marcação rest
	function countJedis(...jedis:number[]) : number {
		return jedis.reduce( (a,b) => a + b, 0)
	}
	/NÃO PRECISO DE COLCHETES! apenas vírgula basta
	countJedis(2,3,4) >9
```
### Funções parte 2
```javascript
//podemos usar em uma string
	console.log('hello ${args}')
//operações ternárias
	console.log('hello ${call a function here} : "esse eh verdadeiro" ? "esse eh falso"')
```

## Classes
É um modelo que define atributos e comportamentos
```javascript
class Spacecraft {
	//atributo
	propulsor: string
	constructor (public propulsor: string) {
		this.propulsor = propulsor
	}
	jumpIntoHyperspace(){
		console.log("Entering hyperspace with" + this.propuls)
	}
}

let falcon = new Spacecraft("hyperdrive")
falcon.jumpIntoHyperspace()
```

### Herança
```javascript
class MilleniumFalcon extends Spacecraft{
	constructor(){
		super("hyperdrive")	
	}
	jumpInHyperspace(){
		if (Math.random() >= 0.5){
			super.jumpIntoHyperSpace()
		} else { console.log("Failed") }
	}
}
```
### Interface (não muito bem anotado)

```javascript
interface Containership{
	cargoContainers: number
}
class MilleniumFalcon extends Spacecraft implements Containership
	cargoContainers: number
	constructor(){
		super("hyperdrive")	
	}
```

### Módulos
Contém classes, interfaces, funções, variáveis.

```javascript
base-ships.ts
arquivo da classe
import {Spacecraft } from "./base-ships"
```
### Namespace
evita colisões e cria módulos internos
```javascript
	namespace Utilities{
		export class ShipCleaner{...}]
		
	}
```
```javascript
	//NOPE NOPE NOPE
	export namespace Utilities{
		export class ShipCleaner{...}]
		
	}
```
## Aula 13: organizando os exemplos em módulos
## Implementação de tipos
## Importação de Bibliotecas

> Written with [StackEdit](https://stackedit.io/).
