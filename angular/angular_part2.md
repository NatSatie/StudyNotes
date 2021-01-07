# Introdução de Angular (notas pessoais)
>Esse é um guia de notas de estudo de Angular na Udemy. Por favor sejam bonszinhos
Notas importantes de instalação [aqui](https://angular.io/tutorial/toh-pt0)
Quando o 
```javascript
    ng g c [nome da componente] --spec=false
```
não funciona, troque por ([fonte](https://stackoverflow.com/questions/62228834/angular-cli-command-issue-unknown-option-spec))
```javascript
    nc g c [nome da componente] --skipTests=true
```
## Propriety binding
é bem importante que mantenha consistente os proprty binding.

```javascript
app.component
<div>
  <jad-header></jad-header>
  <jad-student name="luke" [isJedi]="true"></jad-student>
  <jad-student name="han solo" [isJedi]="false"></jad-student>
  <jad-student name="leia" [isJedi]="false"></jad-student>
  <jad-student name="yoda" [isJedi]="true"></jad-student>

</div>
```
```javascript
student.component
<div>
  Student: {{name}}
  <div [hidden] = "!isJedi">
    Jedi Temple: Corusant
  </div>
</div>
```
## Erros de escrita

 1. Já escrevi "=" ao invés de ":" no javascript
 2. 

## Usando classes e propriety binding

```javascript
app.components.ts
import { Component } from '@angular/core';

@Component({
  selector: 'jad-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  luke  = {name: 'Luke', isJedi:true, temple:'Coruscant'};
  leia  = {name: 'Leia', isJedi:false};
  han = {name: 'Han Solo', isJedi:false};
}

```
```javascript
app.component.html
<div>
  <jad-header></jad-header>
  <jad-student [student]="luke" ></jad-student>
  <jad-student [student]="leia" ></jad-student>
  <jad-student [student]="han" ></jad-student>
</div>
```
```javascript
student.component.html
	<div>
	  Student: {{student.name}}
	  <div [hidden] = "!student.isJedi">
	    Jedi Temple: {{student.temple}}
	  </div>
	</div>
student.component.ts
import { Component, OnInit, Input } from '@angular/core';

import {Student} from './student.model'

@Component({
  selector: 'jad-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent implements OnInit {

  @Input() student: Student

  constructor() { }

  ngOnInit(): void {
  }

}
student.component.ts
export interface Student {
  name: string
  isJedi:boolean
  temple?: string
}

```
## Diretivas
O ng if permite verificar se a variavel é verdadeira, caso não seja não é emitido a componente

 - ngIf
 - ngFor
 - ngSwitch
	 - ngSwitchCase
	 - ngSwitchDefault

```javascript
student.component.html
<div>
  Student: {{student.name}}
  <div *ngIf="student.isJedi">
    Jedi Temple: {{student.temple}}
  </div>
</div>
```
```javascript
app.components.html
<div>
  <jad-header></jad-header>
  <jad-student *ngFor="let students of students" [student]="students" ></jad-student>
</div>
```
## Eventos
```javascript
import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import {Student} from './student.model'

@Component({
  selector: 'jad-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent implements OnInit {

  @Input() student: Student

  constructor() { }

  ngOnInit(): void {
  }

  clicked() : void{
    console.log(`you clicked me! Check ${this.student.name}`)
  }

}
```
```javascript
student.component.html
<div>
  <a href="#"(click)=clicked() >{{student?.name}} </a>
  Student: {{student.name}}
  <div *ngIf="student.isJedi">
    Jedi Temple: {{student.temple}}
  </div>
</div>
```
> Written with [StackEdit](https://stackedit.io/).
