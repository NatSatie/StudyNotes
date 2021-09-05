# Interpretando dados com React Profiler

Quando trata-se de uma aplicação um tanto complexa, é natural que as soluções que antes tinham sido colocadas tornem-se obsoletas, devido ao consumo de dados e a complexidade das relações entre componentes da árvore DOM.

Por isso, a partir de uma aplicação já pré-pronta ( [Github do projeto Pokemon List](https://github.com/NatSatie/pokemon-list), vamos verificar quais são as falhas do projeto e identificar o que temos que melhorar no requisito de performance e desempenho.

## O React Profiler

É uma ferramenta da extensão [React Dev Tools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi) do Google Chrome usada para avaliar quantas vezes a componente foi carregada em uma aplicação de React.

Ao observar a imagem abaixo, temos uma sequência de barras coloridas que correspondem às componentes que são carregadas no React. 

TODO: add image

As informações do Flaregraph mais importantes estão dentro das barras que consiste em:

- Nome da Componente (um provedor de contexto, componente JSX ou HTML)
- Tempo para renderizar
- Tempo total que a componente existe dentro dessa commit
- Cor: Pode estar cinza sólido, rachurado, tons de verde ou tons de amarelo

## Como usar o Flaregraph React Profiler 

No flaregraph, eu gosto de escolher **uma ação** para analisar. Então para a plataforma podemos escolher uma interação que será gravada as ações necessárias.

Nesse caso, escolhi procurar o pokemon #123 e faço a busca.

todo: adicionar gif com a ação para gravar

Com isso, temos informações importantes para interpretar na barra superior. Especialmente nas setas e no `6/6`.

todo: adicionar imagem com o tempo

O número `6/6` significa que temos seis commits, quando uma componente é renderizada a fase do commit é feita a comparação entre um estado e outro a partir da DOM [1].

Cada barra corresponde ao tempo de demorou cada commit foi feito, normalmente isso acontece em alguns milissegundos.

todo: adicionar gif com cada commit

## Cores do flaregraph

Como foi visto, temos algumas cores para o flaregraph que são importantes para definir o que deve e que não deve ser otimizado.

Quando o objeto está com **tons de verde** quer dizer que foi renderizado naquele commit. **Tons de amarelo** corresponde a objetos que foram renderizados mas precisa ser otimizado. Objetos em **cinza** significa que não foi renderizando naquele commit. **Componentes rachurados** significa que não renderizaram.

Por isso, quando o objeto está sendo atualizado várias vezes ou demora muito tempo para carregar em um único commit, o objeto é identficado em amarelo. E são essas componentes que devem ser otimizadas.

## Como otimizar?

Agora que sabemos apontar quais são os problemas de performance da aplicação, podemos pensar em formas de melhorar. 

- Usar hooks como useMemo(), useCallback() [3]
- Usar memo() [4]
- Algoritmo de Reconciliação [5] [6]



 ### Referências

[1] [Profiling Performance of React Apps using React Profiler](https://blog.bitsrc.io/profiling-performance-of-react-apps-using-react-profiler-d02d77f3c96a)

[2] [Profiler API by Reactjs.org](https://reactjs.org/docs/profiler.html?)

[3] [use hooks reference](https://pt-br.reactjs.org/docs/hooks-reference.html#usecallback)

[4] [Use React.memo() wisely](https://dmitripavlutin.com/use-react-memo-wisely/)

[5] [Reconciliação (Reconciliation)](https://pt-br.reactjs.org/docs/reconciliation.html)

[6] Vídeo RocketSeat: [React - Guia definitivo de performance (useMemo, useCallback, memo)](https://youtu.be/NmU2nNehNNY)

