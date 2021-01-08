# Anotações sobre Git
Algumas anotações sobre Git. 
```
//clonar repositório
	git clone <url>
//mantém o projeto sincronizado
	git pull
```
## Navegação do histórico
```
//verificar versão antiga de um determinado commit
	git checkout <commit> <file>
//desfazer alterações
	git checkout --<path_file>
	//desfaz o ultimo commit
	git checkout HEAD --<path_file>
	//desfaz as alterações até determinado commit
	git revert <commit>
```
## Reset
```
//reseta um repositório para um determinado commit
	git reset <commit>
//reseta e remove todas as alterações
	git reset --hard <commit>
```

## Branchs 
```
//cria uma branch
	git branch <branch>
//destroi uma branch
	git branch -d <branch>
```
## Merge & Rebase
```
//aplica commits de uma branch para branch atual
	git merge <branch>
//remove todos os commits temporariamente, aplica os commits da branch desejada e depois passa a cada commit original. Pode causar conflitos.
	git merge <branch>
```
## Fetch
```
//baixa as atualizações do remote porém não aplica norepositório
	git fetch
```
## Tags 
Não recebe mais commits, usado em versões estáveis. Guarda um estado de um repositório.
```
	git tag <nome>
	git push <remote> <tag>
```
# Guia de contribuição no Git
## Fork & Issues
Fork pode copiar o repositório de outro usuário e colar no seu repositório. É uma cópia independente.
Issues servem para reportar bugs etc, podem ser refenciados commits.
## Pull Request
Solicitação de que suas alterações sejam unidas para uma branch, ou que a cópia que foi feito o fork, seja adicionada.
[Guia do Github de como usar o pull request](https://guides.github.com/introduction/flow/)
### Verificando e aceitando pull request
```
	git fetch origin pull/[ID]/head:[NOMEDABRANCH]
	//exemplo:
	git fetch origin pull/2/head:minha_branch
```
O pull request pode ser visto dentro da plataforma Github.

> Written with [StackEdit](https://stackedit.io/).
