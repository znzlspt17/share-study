package day07;

import dao.MakeConnection;

public class TestMain2 {

	public static void main(String[] args) {

		MakeConnection mc1 = MakeConnection.getInstance();
		MakeConnection mc2 = MakeConnection.getInstance();

		System.out.println("mc1 : " + mc1);
		System.out.println("mc2 : " + mc2);
	}

}
