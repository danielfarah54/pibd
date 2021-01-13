package g2Etapa5;

import java.sql.Date;

public class Pessoa {
	private int codigo;
	private String pnome;
	private String sobrenome;
	private Date data_nascimento;
	private String email;
	private String homepage;
	private String cep;
	private int numEndereco;
	private String rua;

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public Date getData_nascimento() {
		return data_nascimento;
	}

	public void setData_nascimento(Date data_nascimento) {
		this.data_nascimento = data_nascimento;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public int getNumEndereco() {
		return numEndereco;
	}

	public void setNumEndereco(int numEndereco) {
		this.numEndereco = numEndereco;
	}

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getPnome() {
		return pnome;
	}

	public void setPnome(String pnome) {
		this.pnome = pnome;
	}

	public String getSobrenome() {
		return sobrenome;
	}

	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}
}
