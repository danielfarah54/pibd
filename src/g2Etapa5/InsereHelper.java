package g2Etapa5;

import java.sql.Date;

public final class InsereHelper {
	
	static String parseTabela(String input) {
		return input.split(": ")[0];
	}

	static Pessoa parsePessoa(String input) {
		String[] parse;
		String pnome;
		String sobrenome;
		Date data_nascimento;
		String email;
		String homepage;
		String cep;
		int numEndereco;
		String rua;
		
		input = input.split(": ")[1];
		parse = input.split(", ");
		pnome = parse[0];
		sobrenome = parse[1];
		data_nascimento = Date.valueOf(parse[2]);
		email = parse[3];
		homepage = parse[4];
		cep = parse[5];
		numEndereco = Integer.parseInt(parse[6]);
		rua = parse[7];
		
		System.out.printf("pnome = %s\n", pnome);
		System.out.printf("sobrenome = %s\n", sobrenome);
		System.out.printf("data_nascimento = %s\n", data_nascimento);
		System.out.printf("email = %s\n", email);
		System.out.printf("homepage = %s\n", homepage);
		System.out.printf("cep = %s\n", cep);
		System.out.printf("numEndereco = (%d)\n", numEndereco);
		System.out.printf("rua = %s\n", rua);
		
		Pessoa pessoa = new Pessoa();
		pessoa.setCep(cep);
		pessoa.setData_nascimento(data_nascimento);
		pessoa.setEmail(email);
		pessoa.setHomepage(homepage);
		pessoa.setNumEndereco(numEndereco);
		pessoa.setNumEndereco(numEndereco);
		pessoa.setPnome(pnome);
		pessoa.setRua(rua);
		pessoa.setSobrenome(sobrenome);
		return pessoa;
	}
	
	static Carro parseCarro(String input) {
		String[] parse;
		String placa;
		String modelo;
		String cor = "";
		int ano;
		
		input = input.split(": ")[1];
		parse = input.split(", ");
		placa = parse[0];
		modelo = parse[1];
		ano = Integer.parseInt(parse[2]);
		if (parse.length == 4) 
			cor = parse[3];
		
		System.out.printf("placa = %s\n", placa);
		System.out.printf("modelo = %s\n", modelo);
		System.out.printf("ano = (%d)\n", ano);
		if (!cor.equals(""))
			System.out.printf("cor = %s\n", cor);
		
		Carro carro = new Carro();
		carro.setAno(ano);
		carro.setCor(cor);
		carro.setModelo(modelo);
		carro.setPlaca(placa);
		return carro;
	}

	static Possui parsePossui(String input) {
		String[] parse;
		int codigo;
		String placa;
		
		input = input.split(": ")[1];
		parse = input.split(", ");
		codigo = Integer.parseInt(parse[0]);
		placa = parse[1];
		
		System.out.printf("placa = (%d)\n", codigo);
		System.out.printf("modelo = %s\n", placa);
		
		Possui possui = new Possui();
		possui.setCodigo(codigo);
		possui.setPlaca(placa);
		return possui;
	}

	static Telefone parseTelefone(String input) {
		String[] parse;
		int codigo;
		int ddd;
		int prefixo;
		int num;
		
		input = input.split(": ")[1];
		parse = input.split(", ");
		codigo = Integer.parseInt(parse[0]);
		ddd = Integer.parseInt(parse[1]);
		prefixo = Integer.parseInt(parse[2]);
		num = Integer.parseInt(parse[3]);
		
		System.out.printf("placa = (%d)\n", codigo);
		System.out.printf("placa = (%d)\n", ddd);
		System.out.printf("placa = (%d)\n", prefixo);
		System.out.printf("placa = (%d)\n", num);
		
		Telefone telefone = new Telefone();
		telefone.setCodigo(codigo);
		telefone.setDdd(ddd);
		telefone.setNumero(num);
		telefone.setPrefixo(prefixo);
		return telefone;
	}

	static TemAmizade parseTemAmizade(String input) {
		String[] parse;
		int codigo_pessoa;
		int codigo_amiga;
		Date data_amizade = null;
		
		input = input.split(": ")[1];
		parse = input.split(", ");
		codigo_pessoa = Integer.parseInt(parse[0]);
		codigo_amiga = Integer.parseInt(parse[1]);
		if (parse.length == 3)
			data_amizade = Date.valueOf(parse[2]);
		
		System.out.printf("amiga = (%d)\n", codigo_amiga);
		System.out.printf("pessoa = (%d)\n", codigo_pessoa);
		if (parse.length == 3)
			System.out.printf("data_amizade = %s\n", data_amizade);
		
		TemAmizade temAmizade = new TemAmizade();
		temAmizade.setCodigo_amiga(codigo_amiga);
		temAmizade.setCodigo_pessoa(codigo_pessoa);
		temAmizade.setData_amizade(data_amizade);
		return temAmizade;
	}
}
