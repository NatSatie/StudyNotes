# Como usar Hooks 📌
### Regras Básicas

 ✔️ Toda chamada de um Hook é use⬜() , ⬜ é o nome do Hooks correspondente
 
 ✔️ Chamado no alto-nível (top-level) da função 
 
 ✔️ Chamado em componentes que são funções
 
❌ Chamar em *loops*, *funções* ou *callbacks*. Exceto se for um Hooks customizado.

 ❌ Não pode ser chamado em uma classe

## useState()
Reage quando um dado é alterado, provocando uma nova renderização da UI.
```javascript
	function App(){
		const [number, setNumber] = useState(0);
	}
```
*number* é a variável que temos interesse de alterar, para isso chamamos *setNumber*. E *number* inicializa-se com *0* a partir da declaração de *useState(0)*.

🔎 **Curiosidade:** Essa nomenclatura usada em Hooks se chama [atribuição via desestruturação - destructuring assignment ](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment) em Javascript.

### Como useState faz diferença?
✅ Elimina a necessidade de criar uma classe com um construtor

✅ Reduzimos o número de callbacks

✅ Diminui as chamadas de *this.state*


```javascript
  return(
	    <button onClick={() => setNumber(number+1)}>
		    {number}
	    </button>
	)
```
    
## useEffect()
Segundo o React.js Hook de Efeito permite executar efeitos colaterais em componentes. Ele funciona quando é montado ou quando o estado da componente é alterado.

```javascript
    //Desta forma roda infinitamente
    useEffect( () => {
		    alert('side effect')
	    }
    )
```
## useContext()
## useRef()
## useReducer()
## useMemo()
## useCallback()

### Imagem do ciclo de vida do React Hooks
![Ciclo de vida de cada Hooks](https://raw.githubusercontent.com/Wavez/react-hooks-lifecycle/master/screenshot.jpg)

### Referências
[Site oficiial do React.js sobre Hooks](https://pt-br.reactjs.org/docs/hooks-state.html)
Youtube:[# 10 React Hooks Explained // Plus Build your own from Scratch](https://youtu.be/TNhaISOUy6Q)
Youtube: [Learn useState In 15 minutes](https://youtu.be/O6P86uwfdR0)
Github: [React Hooks Lifecycle](https://github.com/Wavez/react-hooks-lifecycle)
> Written with [StackEdit](https://stackedit.io/).
