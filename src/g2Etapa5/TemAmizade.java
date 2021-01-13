package g2Etapa5;

import java.sql.Date;

public class TemAmizade {
	private int codigo_pessoa;
	private int codigo_amiga;
	private Date data_amizade;

	public int getCodigo_pessoa() {
		return codigo_pessoa;
	}

	public void setCodigo_pessoa(int codigo_pessoa) {
		this.codigo_pessoa = codigo_pessoa;
	}

	public int getCodigo_amiga() {
		return codigo_amiga;
	}

	public void setCodigo_amiga(int codigo_amiga) {
		this.codigo_amiga = codigo_amiga;
	}

	public Date getData_amizade() {
		return data_amizade;
	}

	public void setData_amizade(Date data_amizade) {
		this.data_amizade = data_amizade;
	}

}
