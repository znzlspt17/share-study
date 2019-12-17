package day02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/day02/myServlet3.do")
public class MyServlet3 extends HttpServlet {

	@Override
	public void init() throws ServletException {
		System.out.println("called init()");
	}

	@Override
	public void destroy() {
		System.out.println("called destroy()");
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
		pw.println("<h1>Called Service()</h1>");
		pw.println("</body>");
		pw.println("</html>");
	}

}
