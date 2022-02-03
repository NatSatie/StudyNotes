# Princípios SOLID

SOLID consiste em 

- Single responsibility principle
- Open closed principle
- Liskov substitution principle
- Interface segregation principle
- Dependency inversion principle

## Principios básicos da POO (programação orientada a objetos)

### Coesão

Considere que dentro de um projetos devem ter classes em harmonia e coesa. 

```
public class Funcionario {
	private String nome;
	private String cpf;
	private Cargo cargo;
	private BigDecimal salario;
	
	public boolean isGerente(){
		return Cargo.GERENTE == this.cargo;
	}
}
```

E se aumentasse a complexidade, a classe est[a coesa?

 ```
 public class Funcionario {
 	private String nome;
 	private String cpf;
 	private Cargo cargo;
 	private BigDecimal salario;
 	private String cep;
 	private String logradouro;
 	private String bairro;
 	private String cidade;
 	private String uf;
 	
 	public void formatarCPf(){
 		// logica para formatacao do cpf
 	}
 	
 	public void formatarCep(){
 		// logica para formatacao do cpf
 	}
 	
 	public void formatarCPf(){
 		// logica para formatacao do cpf
 	}
 	
 	public void formatarCPf(){
 		// logica para formatacao do cpf
 	}
 }
 ```



