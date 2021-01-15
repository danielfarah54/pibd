package g2Etapa5;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.sql.Date;

public class Seleciona {
	static Connection con = null;
	static Statement stm = null;
	static ResultSet rs = null;
	static ResultSetMetaData md = null;
	static String sel = "";
	
	static String selectPessoa() {
		try {
			sel = "";
			
			// Abrir a conexão
			con = DriverManager.getConnection(Credentials.getDatabaseUrl(), 
											  Credentials.getUser(), 
											  Credentials.getSenha());
			// Criar o comando
			stm = con.createStatement();
			rs = stm.executeQuery("select * from pessoa");
			// Criar o metadado da tabela
			md = rs.getMetaData();
			int nroColunas = md.getColumnCount();
			// Exibir os metadados/dados
			for (int i = 1; i <= nroColunas; i++) {
				System.out.printf("%s\t", md.getColumnName(i));
				sel = sel + md.getColumnName(i) + ", ";
			}
			sel = sel + "\n";
			System.out.printf("\n");

			ArrayList<Pessoa> listPessoa = new ArrayList<Pessoa>();

			int codigo;
			String pnome;
			String sobrenome;
			Date data_nascimento;
			String email;
			String homepage;
			String cep;
			int numEndereco;
			String rua;
			Pessoa pessoa;
			// Usar os dados e mostra-los
			while (rs.next()) {
				pessoa = new Pessoa();

				codigo = rs.getInt("codigo");
				pnome = rs.getString("pnome");
				sobrenome = rs.getString("sobrenome");
				data_nascimento = rs.getDate("data_nascimento");
				email = rs.getString("email");
				homepage = rs.getString("homepage");
				cep = rs.getString("cep");
				numEndereco = rs.getInt("numEndereco");
				rua = rs.getString("rua");

				pessoa.setCodigo(codigo);
				pessoa.setPnome(pnome);
				pessoa.setSobrenome(sobrenome);
				pessoa.setData_nascimento(data_nascimento);
				pessoa.setEmail(email);
				pessoa.setHomepage(homepage);
				pessoa.setCep(cep);
				pessoa.setNumEndereco(numEndereco);
				pessoa.setRua(rua);
				listPessoa.add(pessoa);
			}
			for (Pessoa umaPessoa : listPessoa) {
				sel = sel + umaPessoa.getCodigo() + ", " + umaPessoa.getPnome() + ", " + umaPessoa.getSobrenome() + ", "
						+ umaPessoa.getData_nascimento() + ", " + umaPessoa.getEmail() + ", " + umaPessoa.getHomepage()
						+ ", " + umaPessoa.getCep() + ", " + umaPessoa.getNumEndereco() + ", " + umaPessoa.getRua()
						+ "\n ";

				System.out.printf("%s\n",
						umaPessoa.getCodigo() + ", " + umaPessoa.getPnome() + ", " + umaPessoa.getSobrenome() + ", "
								+ umaPessoa.getData_nascimento() + ", " + umaPessoa.getEmail() + ", "
								+ umaPessoa.getHomepage() + ", " + umaPessoa.getCep() + ", "
								+ umaPessoa.getNumEndereco() + ", " + umaPessoa.getRua());
			}
			// Fechar os objetos
			rs.close();
			stm.close();
			con.close();
		} catch (SQLException e) {
			System.err.println(e);
		} catch (Exception e) {
			System.err.println(e);
		}
		return sel;
	}

	static String selectCarro() {
		try {
			sel = "";

			// Abrir a conexão
			con = DriverManager.getConnection(Credentials.getDatabaseUrl(), 
					  Credentials.getUser(), 
					  Credentials.getSenha());
			// Criar o comando
			stm = con.createStatement();
			rs = stm.executeQuery("select * from carro");
			// Criar o metadado da tabela
			md = rs.getMetaData();
			int nroColunas = md.getColumnCount();
			// Exibir os metadados/dados
			for (int i = 1; i <= nroColunas; i++) {
				System.out.printf("%s\t", md.getColumnName(i));
				sel = sel + md.getColumnName(i) + ", ";
			}
			sel = sel + "\n";
			System.out.printf("\n");

			ArrayList<Carro> listCarro = new ArrayList<Carro>();

			String placa;
			int ano;
			String cor;
			String modelo;
			Carro carro;
			// Usar os dados e mostra-los
			while (rs.next()) {
				carro = new Carro();

				placa = rs.getString("placa");
				ano = rs.getInt("ano");
				cor = rs.getString("cor");
				modelo = rs.getString("modelo");
				
				carro.setPlaca(placa);
				carro.setAno(ano);
				carro.setCor(cor);
				carro.setModelo(modelo);
				listCarro.add(carro);
			}
			for (Carro umCarro : listCarro) {
				sel = sel + umCarro.getPlaca() + ", " + umCarro.getAno() + ", " + umCarro.getCor() + ", " +
							umCarro.getModelo()	+ "\n ";

				System.out.printf("%s\n",
						umCarro.getPlaca() + ", " + umCarro.getAno() + ", " + umCarro.getCor() + ", " +
								umCarro.getModelo());
			}
			// Fechar os objetos
			rs.close();
			stm.close();
			con.close();
		} catch (SQLException e) {
			System.err.println(e);
		} catch (Exception e) {
			System.err.println(e);
		}
		return sel;
	}

	static String selectPossui() {
		try {
			sel = "";

			// Abrir a conexão
			con = DriverManager.getConnection(Credentials.getDatabaseUrl(), 
					  Credentials.getUser(), 
					  Credentials.getSenha());
			// Criar o comando
			stm = con.createStatement();
			rs = stm.executeQuery("select * from possui");
			// Criar o metadado da tabela
			md = rs.getMetaData();
			int nroColunas = md.getColumnCount();
			// Exibir os metadados/dados
			for (int i = 1; i <= nroColunas; i++) {
				System.out.printf("%s\t", md.getColumnName(i));
				sel = sel + md.getColumnName(i) + ", ";
			}
			sel = sel + "\n";
			System.out.printf("\n");

			ArrayList<Possui> listPossui = new ArrayList<Possui>();

			int codigo;
			String placa;
			Possui possui;
			// Usar os dados e mostra-los
			while (rs.next()) {
				possui = new Possui();

				placa = rs.getString("placa");
				codigo = rs.getInt("codigo");
				
				possui.setCodigo(codigo);
				possui.setPlaca(placa);
				listPossui.add(possui);
			}
			for (Possui umaPosse: listPossui) {
				sel = sel + umaPosse.getCodigo() + ", " + umaPosse.getPlaca() + "\n ";

				System.out.printf("%s\n",
						umaPosse.getCodigo() + ", " + umaPosse.getPlaca());
			}
			// Fechar os objetos
			rs.close();
			stm.close();
			con.close();
		} catch (SQLException e) {
			System.err.println(e);
		} catch (Exception e) {
			System.err.println(e);
		}
		return sel;
	}

	static String selectTelefone() {
		try {
			sel = "";

			// Abrir a conexão
			con = DriverManager.getConnection(Credentials.getDatabaseUrl(), 
					  Credentials.getUser(), 
					  Credentials.getSenha());
			// Criar o comando
			stm = con.createStatement();
			rs = stm.executeQuery("select * from telefone");
			// Criar o metadado da tabela
			md = rs.getMetaData();
			int nroColunas = md.getColumnCount();
			// Exibir os metadados/dados
			for (int i = 1; i <= nroColunas; i++) {
				System.out.printf("%s\t", md.getColumnName(i));
				sel = sel + md.getColumnName(i) + ", ";
			}
			sel = sel + "\n";
			System.out.printf("\n");

			ArrayList<Telefone> listTelefone = new ArrayList<Telefone>();

			int codigo;
			int ddd;
			int prefixo;
			int numero;
			Telefone telefone;
			// Usar os dados e mostra-los
			while (rs.next()) {
				telefone = new Telefone();

				codigo = rs.getInt("codigo");
				ddd = rs.getInt("ddd");
				prefixo = rs.getInt("prefixo");
				numero = rs.getInt("numero");
				
				telefone.setCodigo(codigo);
				telefone.setDdd(ddd);
				telefone.setNumero(numero);
				telefone.setPrefixo(prefixo);
				listTelefone.add(telefone);
			}
			for (Telefone umTelefone: listTelefone) {
				sel = sel + umTelefone.getCodigo() + ", " + "("+ umTelefone.getDdd() + ")" +
							umTelefone.getPrefixo() + "-" + umTelefone.getNumero() + "\n ";

				System.out.printf("%s\n",
						 umTelefone.getCodigo() + ", " + "("+ umTelefone.getDdd() + ")" +
						 umTelefone.getPrefixo() + "-" + umTelefone.getNumero());
			}
			// Fechar os objetos
			rs.close();
			stm.close();
			con.close();
		} catch (SQLException e) {
			System.err.println(e);
		} catch (Exception e) {
			System.err.println(e);
		}
		return sel;
	}

	static String selectTemAmizade() {
		try {
			sel = "";

			// Abrir a conexão
			con = DriverManager.getConnection(Credentials.getDatabaseUrl(), 
					  Credentials.getUser(), 
					  Credentials.getSenha());
			// Criar o comando
			stm = con.createStatement();
			rs = stm.executeQuery("select * from temAmizade");
			// Criar o metadado da tabela
			md = rs.getMetaData();
			int nroColunas = md.getColumnCount();
			// Exibir os metadados/dados
			for (int i = 1; i <= nroColunas; i++) {
				System.out.printf("%s\t", md.getColumnName(i));
				sel = sel + md.getColumnName(i) + ", ";
			}
			sel = sel + "\n";
			System.out.printf("\n");

			ArrayList<TemAmizade> listTemAmizade = new ArrayList<TemAmizade>();

			int codigo_pessoa;
			int codigo_amiga;
			Date data_amizade;
			TemAmizade temAmizade;
			// Usar os dados e mostra-los
			while (rs.next()) {
				temAmizade = new TemAmizade();

				codigo_pessoa = rs.getInt("codigo_pessoa");
				codigo_amiga = rs.getInt("codigo_amiga");
				data_amizade = rs.getDate("data_amizade");
				
				temAmizade.setCodigo_amiga(codigo_amiga);
				temAmizade.setCodigo_pessoa(codigo_pessoa);
				temAmizade.setData_amizade(data_amizade);
				listTemAmizade.add(temAmizade);
			}
			for (TemAmizade umaAmizade: listTemAmizade) {
				sel = sel + umaAmizade.getCodigo_pessoa() + ", " + umaAmizade.getCodigo_amiga() + ", " + 
							umaAmizade.getData_amizade() + "\n ";

				System.out.printf("%s\n",
						umaAmizade.getCodigo_pessoa() + ", " + umaAmizade.getCodigo_amiga() + ", " + 
						umaAmizade.getData_amizade());
			}
			// Fechar os objetos
			rs.close();
			stm.close();
			con.close();
		} catch (SQLException e) {
			System.err.println(e);
		} catch (Exception e) {
			System.err.println(e);
		}
		return sel;
	}
}
