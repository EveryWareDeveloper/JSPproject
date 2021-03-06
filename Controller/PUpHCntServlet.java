package gamestore;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/gamestore/pUpHCnt")
public class PUpHCntServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		ProductMgr pMgr = new ProductMgr();
		int pid = Integer.parseInt(request.getParameter("pid"));
		pMgr.upHCnt(pid);
		//guest.jsp에서 좋아요 기능에는 gid값이 넘어옴.
		/*
		 * String id = request.getParameter("id"); if(id!=null)
		 */
			response.sendRedirect("productDetail.jsp?pid="+pid);		
	}	
}







