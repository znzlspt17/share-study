package day01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/3dan.html")
public class Gudan extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		resp.setCharacterEncoding("utf-8");
		PrintWriter pw = resp.getWriter();
		pw.println("<html>");
		pw.println("<meta charset='utf-8' />");
		pw.println("<head>");
		pw.println("<title>");
		pw.println("구구단을 외자 구구단을 외자");
		pw.println("</title>");
		pw.println("</head>");
		pw.println("<body>");
		for (int i = 2; i < 10; i++) {
			for (int j = 1; j < 10; j++) {
				pw.println(i +" * "+ j + " = " + (i*j));
				pw.println("<br>");
			}
		}
		pw.println("</body>");

	}

}
