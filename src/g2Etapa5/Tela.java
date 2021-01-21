package g2Etapa5;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

class ActionEventDemo implements ActionListener {
	JFrame frame = new JFrame("Consulta da base de dados");
	JButton sendSeleciona = new JButton("Consultar");
	JButton sendInsere = new JButton("Inserir");

	JLabel labelSeleciona = new JLabel("Digite uma tabela: ");
	JLabel labelInsere = new JLabel("Insere na tabela: ");
	JTextField tfSeleciona = new JTextField(10);
	JTextField tfInsere = new JTextField(10);
	JTextArea ta = new JTextArea();

	ActionEventDemo() {
		prepareGUI();

	}

	public void prepareGUI() {
		// Creating the Frame
		JFrame frame = new JFrame();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(800, 600);
		// Creating the MenuBar and adding components
		JMenuBar mb = new JMenuBar();
		JMenu m1 = new JMenu("File");
		JMenu m2 = new JMenu("Help");
		mb.add(m1);
		mb.add(m2);
		JMenuItem m11 = new JMenuItem("Open");
		JMenuItem m22 = new JMenuItem("Save as");
		m1.add(m11);
		m1.add(m22);

		// Creating the panel at bottom and adding components
		JPanel panel = new JPanel(); // the panel is not visible in output

		panel.add(labelSeleciona); // Components Added using Flow Layout
		panel.add(tfSeleciona);
		panel.add(sendSeleciona);

		panel.add(labelInsere); // Components Added using Flow Layout
		panel.add(tfInsere);
		panel.add(sendInsere);
		
		// Text Area at the Center

		// Adding Components to the frame.
		frame.getContentPane().add(BorderLayout.SOUTH, panel);
		frame.getContentPane().add(BorderLayout.NORTH, mb);
		frame.getContentPane().add(BorderLayout.CENTER, ta);
		frame.setVisible(true);

		sendSeleciona.addActionListener(this);
		sendInsere.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		if (e.getSource() == sendSeleciona) {
			String[] input = tfSeleciona.getText().split(" ", 2);
			String pk = "-1";
			if (input.length == 2)
				pk = input[1];
			System.out.printf("pk(%s)\n", pk);
			String tabela = input[0];
			switch (tabela) {
			case "carro":
				ta.setText(tabela + "\n" + Seleciona.selectCarro(pk));
				break;
			case "possui":
				ta.setText(tabela + "\n" + Seleciona.selectPossui(pk));
				break;
			case "telefone":
				ta.setText(tabela + "\n" + Seleciona.selectTelefone(pk));
				break;
			case "temAmizade":
				ta.setText(tabela + "\n" + Seleciona.selectTemAmizade(pk));
				break;
			default:
				ta.setText(tabela + "\n" + Seleciona.selectPessoa(pk));
			}
		}
		if (e.getSource() == sendInsere) {
			String pk = "-1";
			String input = tfInsere.getText();
			String tabela = InsereHelper.parseTabela(input);
			System.out.printf("input = %s\n tabela=%s\n\n", input, tabela);
			switch (tabela) {
			case "pessoa":
				Insere.inserePessoa(input);
				break;
			case "carro":
				 Insere.insereCarro(input);
				break;
			case "possui":
				Insere.inserePossui(input);
				break;
			case "telefone":
				Insere.insereTelefone(input);
				break;
			case "temAmizade":
				Insere.insereAmizade(input);
				break;
			default:
				System.out.printf(tfInsere.getText() + "\n");
				ta.setText(tfSeleciona.getText() + "\n" + Seleciona.selectPessoa(pk));

			}
		}
		tfSeleciona.setText("");
		tfInsere.setText("");
	}
}

public class Tela {
	public static void main(String[] args) {
		new ActionEventDemo();
	}
}
