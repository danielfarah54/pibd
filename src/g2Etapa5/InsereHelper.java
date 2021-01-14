package g2Etapa5;

public final class InsereHelper {
	
	static String parseTabela(String input) {
		return input.split(": ")[0];
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
	
}
