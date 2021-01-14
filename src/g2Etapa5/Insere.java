package g2Etapa5;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Insere {
	static Connection con = null;
	
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
			
			int qtdeLinhasAfetadas = insere.executeUpdate();
			System.out.println("Linhas Afetadas: "+qtdeLinhasAfetadas + "\n");
			
			insere.close();
			con.close();
		}catch(SQLException e){
			System.err.println(e);
		}catch(Exception e){
			System.err.println(e);
		}
	}

}
