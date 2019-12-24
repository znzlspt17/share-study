package day02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/day02/myServlet2.do")
public class MyServlet2 extends GenericServlet {

	@Override
	public void init() throws ServletException {
		System.out.println("초기화 메서드 호출중");
	}

	@Override
	public void destroy() {
		System.out.println("서블릿 제거중");
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

		System.out.println("service() 호출");
		PrintWriter pw = res.getWriter();

		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>");
		pw.println("Monday.java");
		pw.println("</title>");
		pw.println("</haed>");
		pw.println("<body>");
		pw.println("</body>");
		pw.println("</html>");
	}

}
