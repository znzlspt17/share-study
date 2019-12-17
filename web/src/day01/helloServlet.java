package day01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello2.html")
public class helloServlet extends HttpServlet {
	// 1. Httpservlet 상속
//	2. doGet() 오버라이드
//	3. 내가 만든 프로그램을 등록 @어노테이션으로

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// requset 요청, response 응답;
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='utf-8' />");
		out.println("<title>Hello </title>");
		out.println("</head>");
		out.println("<body>");
		out.println("hell안녕o");
		out.println("</body>");
		out.println("</html>");
	}
}
