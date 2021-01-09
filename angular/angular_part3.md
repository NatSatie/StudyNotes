
# Introdução de Angular (projeto)
(Curso de referência)[https://github.com/cod3rcursos/meat-app-starter]
```
git clone https://github.com/cod3rcursos/meat-app-starter.git
npm install //dependendo do computador pode demorar

//Caso dê mais erros:
	npm i --package-lock-only
	//Para verificar as vulnerabilidades
	npm audit fix
//Para rodar seu projeto:
ng serve --open
```
Algumas anotações do que aconteceu: (esquisito)
```
ng g c header --skipTests=true
	To disable this warning use "ng config -g cli.warnings.versionMismatch false".
The option '--skipTests' is not registered with the generate command. Run `ng generate --help` for a list of supported options.
```
> Obs: fiz esse curso em 2021, e recebi várias notificações no meu npm install de bibliotecas que não existem mais ou não se usa
> anotações: quando fiz algumas coisas em Angular, ele não aceitava sem um <div>

```
```
$ ng g c home --specs=false
** NG Live Development Server is listening on localhost:4200, open your browser on http://localhost:4200 **
 10% building modules 4/4 modules 0 activeYour global Angular CLI version (11.0.6) is greater than your local version (1.2.7). The local Angular CLI version is used.
To disable this warning use "ng config -g cli.warnings.versionMismatch false".
The option '--specs' is not registered with the generate command. Run `ng generate --help` for a list of supported options.
```
 11% building modules 15/26 modules 11 active ...admin-lte\plugins\iCheck\flat\red.csswebpack: wait until bundle finished: /
Hash: 74c03c8ed72fa723a645
Time: 75261ms
chunk    {0} polyfills.bundle.js, polyfills.bundle.js.map (polyfills) 240 kB {5} [initial] [rendered]
chunk    {1} styles.bundle.js, styles.bundle.js.map (styles) 266 kB {5} [initial] [rendered]
chunk    {2} main.bundle.js, main.bundle.js.map (main) 7.51 kB {4} [initial] [rendered]
chunk    {3} scripts.bundle.js, scripts.bundle.js.map (scripts) 139 kB {5} [initial] [rendered]
chunk    {4} vendor.bundle.js, vendor.bundle.js.map (vendor) 2.67 MB [initial] [rendered]
chunk    {5} inline.bundle.js, inline.bundle.js.map (inline) 0 bytes [entry] [rendered]
webpack: Compiled successfully.
webpack: Compiling...
Hash: 74c03c8ed72fa723a645
Time: 9308ms
chunk    {0} polyfills.bundle.js, polyfills.bundle.js.map (polyfills) 240 kB {5} [initial]
chunk    {1} styles.bundle.js, styles.bundle.js.map (styles) 266 kB {5} [initial]
chunk    {2} main.bundle.js, main.bundle.js.map (main) 7.51 kB {4} [initial]
chunk    {3} scripts.bundle.js, scripts.bundle.js.map (scripts) 139 kB {5} [initial]
chunk    {4} vendor.bundle.js, vendor.bundle.js.map (vendor) 2.67 MB [initial]
chunk    {5} inline.bundle.js, inline.bundle.js.map (inline) 0 bytes [entry]
webpack: Compiled successfully.
```
## Quando a porta está sendo usada:
https://stackoverflow.com/questions/39091735/port-4200-is-already-in-use-when-running-the-ng-serve-command#:~:text=If%20you%20want%20to%20quit,also%20release%20the%204200%20port.

## Rotas
```javascript
//componentes dinâmicas
	<div>
		<router-outlet></router-outlet>
	</div>
//como exportamos
	export const ROUTES: Route = [
		{path: '', component: RestaurantsComponent},
		{path: 'restaurant/id', component: RestaurantComponents},
		{path: 'about', component: AboutComponents}
	]
	//quando é usado
	@NgModule({
		declarations: [...],
		imports: [..., RouterModule.forRoot(ROUTES)],
	})
	export class AppModule
//Aplicação
	<a routerLink='/restaurants'>Restaurantes </a>
	//OU
	<a [routerLink]="['/restaurants']">Restaurantes </a>
```
>RouterLinkActive : Tracks whether the linked route of an element is currently active, and allows you to specify one or more CSS classes to add to the element when the linked route is active.
```javascript
<li routerLinkactive="active"><a [routerLink]="['./about']">Sobre</a></li>
```
[Anotações](https://angular.io/api/router/RouterLinkActive)

## Injeção de Dependência
Padrões de projeto
```javascript
//informar como o angular que será injetado
@Component({ providers: [MyFirstService]})
export class MyFirstComponent{
	constructor( private firstService: MyFirstService){
	}
}

@NgModule({
	declarations: [...],
	providers: [MyFirstService]
})
export class AppModule{}
```
Outras [refs](https://imasters.com.br/back-end/angular-groking-injecao-de-dependencia-e-testes)
## Serviços
### Escopos
 - módulo - provider
 - componente e filhos - provider
 - somente na component - viewprovider
```javascript
//informar como o angular que será injetado
@Injectable()
export class MyFirstComponent{
	constructor( private http: Http){
	}
	list(){
		return this.http.get('/url')
	}
}
```
### Tipos de Serviços
 - Title
 - Http
 - Router

> Written with [StackEdit](https://stackedit.io/).
