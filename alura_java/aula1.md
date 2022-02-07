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
 		// logica
 	}
 	
 	public void completarEndereco(){
 		// logica
 	}
 }
 ```

 Poderíamos melhorar ao isolar os métodos relaciondos ao Endereço, e criar uma classe chamada Endereco.

 Quando desenvolvemos, as classes se perdem, ficam difícil de fazer manutenção e outros.

### Encapsulamento 

O objetivo do encapsulamento é proteger e isolar certos métodos para evitar modificações indesejadas.

Um bom exemplo segue logo abaixo:

 ```
 public class Funcionario {
 	private double salario;
 	
 	public void reajustarSalario(double aumento){
 		double percentual = (aumento / salario) * 100;
 		if (percentual > 40){
 		    throw new IllegalArgumentException("percentual deve ser inferiror a 40%");
 		}
 		this.salario += aumento;
 	}
 }
 ```

 Um péssimo exemplo é:

 ```
 public class Funcionario {
 	private double salario;
 	
 	public void setSalario(double salario){
 	    this.salario = salario;
 	}
 }
 ```

 Nesse caso, se chamarmos `funcionario.setSalario(100000)`, podemos modificar o salário, sem verificação de valores e isso interfere no princípio do encapsulamento.

 ### Acoplamento

 Acoplamento serve para fazer agrupamento aos pares, então quando temos duas classes que usam umas e as outras. O problema do acoplamento pode surgir quando existe uma dependência de uma classe pra outra, exponto mais informações que deveria. Além disso, a manutenção de uma classe pode afetar a outra. Veja um bom exemplo:

 ```
Funcionario func = carregarBancoDeDados();
double reajustes = func.getValorRecebidoEmReajustes();
 ```

Compare com o exemplo ruim:

 ```
Funcionario func = carregarBancoDeDados();
double reajustes = 0;
List<Reajuste> reajustes = func.getReajustes();

for(Reajuste r: reajustes){
    valorTotalReajustes += r.getValor();
}
 ```

 Nesse caso estamos fazendo uma chamada de getReajustes() mas ao mudar a chamada, temos que alterar a lista e o ciclo de for, então o código está muito acoplado à classe Funcionario.

Uma situação comum, é alterar em uma classe A e tem que modificar a classe B e assim vai.

## Extraindo validações



Considere que o sistema de remuneração do funcionário precisa de uma validação que exige apenas 40% o valor do aumento e que esse aumento seja realizado apenas a cada 6 meses. Observe o código atual:



```
public class ReajusteService {
	public void reajustarSalario(Funcionario func, BigDecimal aumento){
		BigDecimal salario = func.getSalario();
		BigDecimal percentualReajuste = aumento.divide(salario, RoundingMode.HALF_UP);
		
		if (percentualReajuste.compareTo(new BigDecimal("0.4") > 0)){
			throw new ValidacaoException("Reajuste nao pode ser superior a 40% do salario");
		}
		
		LocalDate lastUpdate = func.getLastUpdate();
		LocalDate now = LocalDate.now();
		
		long monthsLastUpdate = ChronoUnit.MONTHS.between(lastUpdate, now);
		
		if (monthsLastUpdate < 6){
			throw new ValidacaoException("Intervalo entre reajustes nao pode ser inferior a 6 meses.");
		}
		
		BigDecimal newSalary = sal.add(aumento);
		func.atualizarSalario(newSalary);
	}
}
```

O código atual está vulnerável a falhas colaterais ao mudarem as regras de negócio, e múltiplas validações podem falhar em um mesmo trecho de código ao modificar.

Então o que precisamos fazer é o isolamento das validações.

```
public interface Validacao {
	public void validar(Funcionario func, BigDecimal rise);
}

public class ValidacaoPercentual implements Validacao{
	public void validar(Funcionario func, BigDecimal rise){
		// logica da validacao
	}
}

public class ValidacaoUltimoAumento implements Validacao{
	public void validar(Funcionario func, BigDecimal rise){
		// logica da validacao
	}
}

public class ReajusteService {
	private List<Validacoes> validacoes;
	
	public ReajusteService(List<Validacoes> validacoes){
		this.validacoes = validacoes;
	}

	public void reajustarSalario(Funcionario func, BigDecimal aumento){
		this.validacoes.foreach(v -> v.validar(func, aumento));
		
		BigDecimal newSalary = sal.add(aumento);
		func.atualizarSalario(newSalary);
	}
}
```

Dessa forma, o código está extensivo. Dessa forma podemos controlar o crescimento da classe com validações separadas, aumentando a qualidade de manutenção.

### Princípio de Aberto e Fechado





