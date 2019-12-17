package day04;

import dao.GProductDAO;
import vo.GProductVO;

public class TestMain {

	public static void main(String[] args) {
		/*
		 * MemberDAO dao = new MemberDAO(); MemberVO vo = dao.isExists("aaa", "bbb");
		 * 
		 * if (vo == null) System.out.println("전재하지 아늠"); else
		 * System.out.println("존재함 : 이름 : " + vo.getName()); 멤버 다오 테스트
		 */

		GProductDAO gdao = new GProductDAO();
		GProductVO gvo = new GProductVO();
		System.out.println(gdao);

//		dao.insertOne(4000, 20, 392, "손난로어플", "설명 : 어플을 실행하기만 해도! 따듯해집니다! 단 돈 4000원!  에서 20% 할인행사 3200원에 모시겠습니다",
//				"../images/warm.jpg", "../images/warm.jpg");
		/*
		 * for (Iterator<productVO> iterator = dao.selectAll().iterator();
		 * iterator.hasNext();) { vo = iterator.next();
		 * System.out.println(vo.toString()); }
	 */
//
//		if ((vo = dao.selectOne(7)) != null) {
//			System.out.println(vo.toString());
//		}

		gdao.close();
	}
}
