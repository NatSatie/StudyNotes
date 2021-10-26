# Melhoria de performance

[Vídeo de Referência](https://www.youtube.com/watch?v=NmU2nNehNNY&ab_channel=Rocketseat)

## Algoritmo de Reconciliação

[Referência](https://pt-br.reactjs.org/docs/reconciliation.html)

### Momentos que usamos o `memo`

1. Pure Functional Components: Se as componentes que o retorno será sempre o mesmo, ele precisa de recursos externos para funcionar
2. Renderiza frequentemente: 
3. Re-renderiza com as mesmas propriedades/props
4. Componentes médios para grandes

### Momentos que usamos o `useMemo`

