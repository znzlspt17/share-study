/*
 * package day08;
 * 
 * import java.net.Inet4Address; import java.net.InetAddress; import
 * java.net.UnknownHostException; import java.text.SimpleDateFormat; import
 * java.util.ArrayList; import java.util.Date;
 * 
 * import dao.BoardDAO; import vo.BoardVO;
 * 
 * public class TestMain4 {
 * 
 * public static void main(String[] args) { // // BoardDAO dao = new BoardDAO();
 * // System.out.println(dao); // ArrayList<BoardVO> list = new
 * ArrayList<BoardVO>(); // // System.out.
 * println("============================ 절취선 ============================"); //
 * Date d = new Date(); // SimpleDateFormat sdf = new
 * SimpleDateFormat("yyyy-MM-dd"); // InetAddress local = null; // try { //
 * local = InetAddress.getLocalHost(); // } catch (UnknownHostException e) { //
 * e.printStackTrace(); // } // BoardVO vo = new BoardVO("김개똥", "김아무개보아라",
 * "이보게 김아무개 대머리 깎아라", 0, local.toString(), 0); // dao.add(vo); // //
 * dao.modify(13, "13번은 내가 먹었다", "테러리스트와는 협상하지 않는다!!!"); // // list =
 * dao.selectAll(); // for (BoardVO boardVO : list) { //
 * System.out.println(boardVO.toString()); // } // // dao.delete(13); //
 * System.out.
 * println("============================ 절취선 ============================"); //
 * list = dao.selectAll(); // for (BoardVO boardVO : list) { //
 * System.out.println(boardVO.toString()); // } // // dao.close(); BoardVO vo =
 * new BoardVO(); BoardDAO dao = new BoardDAO(); for (int i = 0; i <= 200; i++)
 * { vo.setTitle("" + i); vo.setContents("" + i); vo.setWriter("테스트" + i);
 * vo.setIp(null); dao.add(vo); } dao.close();
 * 
 * }
 * 
 * }
 */