package g2Etapa5;

public final class Credentials {
	static final String USER = "postgres";
	static final String SENHA = "postgres";
	static final String DATABASE_URL = "jdbc:postgresql://localhost/pibd";

	public static String getUser() {
		return USER;
	}

	public static String getSenha() {
		return SENHA;
	}

	public static String getDatabaseUrl() {
		return DATABASE_URL;
	}
}
