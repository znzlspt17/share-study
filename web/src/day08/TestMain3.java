package day08;

import java.sql.Connection;

import dao.MakeConnection;

public class TestMain3 {

	public static void main(String[] args) {
		Connection conn = MakeConnection.getInstance().getConnection();

		System.out.println("conn : " + conn);
	}
	
	

}
