package day11;

import dao.ProductDAO;
import vo.ProductVO;

public class TestMain6 {

	public static void main(String[] args) {

		ProductDAO dao = new ProductDAO();
		ProductVO vo = dao.findByName("블랙머니");

		System.out.println(vo.getPno() + " : " + vo.getPname() + " : " + vo.getImgfile());

	}

}
