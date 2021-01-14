package g2Etapa5;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Insere {
	static Connection con = null;

	public static void inserePessoa(String input) {
		try{
			Pessoa pessoa = InsereHelper.parsePessoa(input);
			
			con = DriverManager.getConnection(Credentials.getDatabaseUrl(), 
					  Credentials.getUser(), 
					  Credentials.getSenha());
			
			PreparedStatement insere = con.prepareStatement("insert into "
					+ "pessoa (pnome, sobrenome, data_nascimento, email, homepage, cep, numEndereco, rua)"
					+ "values (?,?,?,?,?,?,?,?)");
			
			insere.setString(1, pessoa.getPnome());
			insere.setString(2, pessoa.getSobrenome());
			insere.setDate(3, pessoa.getData_nascimento());
			insere.setString(4, pessoa.getEmail());
			insere.setString(5, pessoa.getHomepage());
			insere.setString(6, pessoa.getCep());
			insere.setInt(7, pessoa.getNumEndereco());
			insere.setString(8, pessoa.getRua());
			
			insere.executeUpdate();
			insere.close();
			con.close();
		}catch(SQLException e){
			System.err.println(e);
		}catch(Exception e){
			System.err.println(e);
		}
	}
	
	public static void insereCarro(String input) {
		try{
			Carro carro = InsereHelper.parseCarro(input);
			
			con = DriverManager.getConnection(Credentials.getDatabaseUrl(), 
					  Credentials.getUser(), 
					  Credentials.getSenha());
			
			PreparedStatement insere;
			if (carro.getCor().equals(""))
			{
				insere = con.prepareStatement("insert into "
								+ "carro(placa, ano, modelo) "
								+ "values (?,?,?)");
				
			}
			else
			{
				insere = con.prepareStatement("insert into "
								+ "carro (placa, ano, modelo, cor) "
								+ "values (?,?,?,?)");
			}
			insere.setString(1, carro.getPlaca());
			insere.setInt(2, carro.getAno());
			insere.setString(3, carro.getModelo());
			if (!carro.getCor().equals(""))
				insere.setString(4, carro.getCor());
			
			insere.executeUpdate();
			insere.close();
			con.close();
		}catch(SQLException e){
			System.err.println(e);
		}catch(Exception e){
			System.err.println(e);
		}
	}
	
	public static void inserePossui(String input) {
		try{
			Possui possui = InsereHelper.parsePossui(input);
			
			con = DriverManager.getConnection(Credentials.getDatabaseUrl(), 
					  Credentials.getUser(), 
					  Credentials.getSenha());
			
			PreparedStatement insere= con.prepareStatement("CALL insere_possui (?,?)");
			
			insere.setInt(1, possui.getCodigo());
			insere.setString(2, possui.getPlaca());
			
			insere.executeUpdate();
			insere.close();
			con.close();
		}catch(SQLException e){
			System.err.println(e);
		}catch(Exception e){
			System.err.println(e);
		}
	}
	
	public static void insereTelefone(String input) {
		try{
			Telefone telefone = InsereHelper.parseTelefone(input);
			
			con = DriverManager.getConnection(Credentials.getDatabaseUrl(), 
					  Credentials.getUser(), 
					  Credentials.getSenha());
			
			PreparedStatement insere= con.prepareStatement("CALL insere_telefone (?,?,?,?)");
			
			insere.setInt(1, telefone.getCodigo());
			insere.setInt(2, telefone.getDdd());
			insere.setInt(3, telefone.getPrefixo());
			insere.setInt(4, telefone.getNumero());
			
			insere.executeUpdate();
			insere.close();
			con.close();
		}catch(SQLException e){
			System.err.println(e);
		}catch(Exception e){
			System.err.println(e);
		}
	}

	public static void insereAmizade(String input) {
		try{
			TemAmizade temAmizade = InsereHelper.parseTemAmizade(input);
			
			con = DriverManager.getConnection(Credentials.getDatabaseUrl(), 
					  Credentials.getUser(), 
					  Credentials.getSenha());
			
			PreparedStatement insere;
			if (temAmizade.getData_amizade() == null)
				insere = con.prepareStatement("CALL insere_amizade (?,?)");
			else 
				insere = con.prepareStatement("CALL insere_amizade (?,?,?)");
			insere.setInt(1, temAmizade.getCodigo_pessoa());
			insere.setInt(2, temAmizade.getCodigo_amiga());
			if (temAmizade.getData_amizade() != null)
				insere.setDate(3, temAmizade.getData_amizade());
			
			insere.executeUpdate();
			insere.close();
			con.close();
		}catch(SQLException e){
			System.err.println(e);
		}catch(Exception e){
			System.err.println(e);
		}
	}

}
