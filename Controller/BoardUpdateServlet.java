package gamestore;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/gamestore/gamestoreUpdate")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		//응답에 대한 인코딩(비번 틀리면 한글로 자바스크립트 코드 전송)
		response.setContentType("text/html; charset=EUC-KR");
		HttpSession session = request.getSession();
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		String dbPass = bean.getPass();
		//update.jsp에서 입력한 비번
		String inPass = request.getParameter("pass");
		if(dbPass.equals(inPass)) {//비번이 일치
			BoardMgr mgr = new BoardMgr();
			bean.setName(request.getParameter("name"));
			bean.setSubject(request.getParameter("subject"));
			bean.setContent(request.getParameter("content"));
			mgr.updateBoard(bean);
			
			String nowPage = request.getParameter("nowPage");
			String numPerPage = request.getParameter("numPerPage");
			response.sendRedirect("read.jsp?nowPage="+nowPage
					+"&numPerPage="+numPerPage+"&num="+bean.getNum());
		}else{//비번 틀렸다고 경고창
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('입력하신 비밀번호가 아닙니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}


















