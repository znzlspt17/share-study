package day01;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hobby.do")
public class Hobit extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	private void doProcess(HttpServletRequest req, HttpServletResponse resp)
			throws UnsupportedEncodingException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		String hobit = req.getParameter("hobby");

		PrintWriter pw = resp.getWriter();

		pw.println("<html>");
		pw.println("<meta charset='utf-8' />");
		pw.println("<head>");
		pw.println("<title>");
		pw.println("구구단을 외자 구구단을 외자");
		pw.println("</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("당신의 취미는 " + hobit + "입니다");
		pw.println("</body>");
	}
}
