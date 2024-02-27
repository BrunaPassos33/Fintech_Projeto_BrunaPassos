package com.fintech;

import java.util.Scanner;

public class FintechCalculos {

	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("Digite o saldo inicial da conta");
		double saldoIni = scanner.nextDouble();
		
		System.out.print("Digite o valor do depósito");
		double valorDeposito = scanner.nextDouble();
		
		double saldoTotal = saldoIni + valorDeposito;
		System.out.println("Saldo final após depósito:R$" +saldoTotal);
		
		scanner.close();
		
	}

}
