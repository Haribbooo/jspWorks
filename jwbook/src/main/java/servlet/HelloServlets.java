package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HellowServlets
 */
@WebServlet("/hello")
public class HelloServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HelloServlets() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//컨텐츠 유형 (서버에서 브라우져로 html로 보내줌)
		response.setContentType("text/html; charset-utf-8"); 
		
		PrintWriter out = response.getWriter();
			out.append("<html><head><title>Hello World</title></head>")
			   .append("<body><h2>안녕 ~ Servlet</h2></body></html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
