package gamestore;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//���� : ȭ�鿡 �������� view(jsp)�� �ƴϰ� ������� �ڵ尡 ó���Ǵ� �ڹ�����
//URL ȣ�� : http://localhost/myapp/gamestore/gamestorePost
@WebServlet("/gamestore/gamestorePost")
public class BoardPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		BoardMgr mgr = new BoardMgr();
		mgr.insertBoard(request);
		response.sendRedirect("board.jsp");
	}
}








