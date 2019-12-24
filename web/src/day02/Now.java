package day02;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/day02/now.do")
public class Now extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);

	}

	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd:hh:mm:ss");

		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");

		String getMsg;
		PrintWriter pw = resp.getWriter();

		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>");
		pw.println("Monday.java");
		pw.println("</title>");
		pw.println("</haed>");
		pw.println("<body>");
		// getMsg = getTime();
		getMsg = sdf.format(d);
		pw.println("<h1> Today is Monday : 현재 시간은 " + getMsg + " 입니다. </h1>");
		pw.println("</body>");
		pw.println("</html>");
	}

	@SuppressWarnings("unused")
	private String getTime() {
		Date date = new Date();
		Calendar calendar = GregorianCalendar.getInstance();
		StringBuffer sb = new StringBuffer();
		calendar.setTime(date);
		sb.append("현재 시간은 ");
		sb.append(calendar.get(Calendar.YEAR));
		sb.append("/");
		sb.append(calendar.get(Calendar.MONTH));
		sb.append("/");
		sb.append(calendar.get(Calendar.DAY_OF_MONTH));
		sb.append(":");
		sb.append(calendar.get(Calendar.HOUR));
		sb.append(":");
		sb.append(calendar.get(Calendar.MINUTE));
		sb.append(":");
		sb.append(calendar.get(Calendar.SECOND));
		sb.append(" 입니다.");
		return sb.toString();
	}
}
