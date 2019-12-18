package day09;

import dao.BoardDAO;

public class TestMain5 {

	public static void main(String[] args) {

		BoardDAO dao = new BoardDAO();

		System.out.println(dao.getTotalCount());
		dao.close();
	}
}
