package gamestore;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/*Dao : Data Access Object*/
public class BoardMgr {

	private DBConnectionMgr pool;
	public static final String SAVEDIRECTORY = "E:/Jsp/eclipse-workspace/myapp/src/main/webapp/gamestore/fileupload";
	public static final String ENCODING = "EUC-KR";
	public static final int MAXPOSTSIZE = 10 * 1024 * 1024;// 10mb

	public BoardMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	// Board Insert : ���Ͼ��ε� , contentType(text, html)
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			// ���� ���ε� ���
			File dir = new File(SAVEDIRECTORY);
			if (!dir.exists()) {
				// dir.mkdir();//���������� ���縦 �ؾ��� ��������
				dir.mkdirs();// ���������� ��� ��������
			}

			MultipartRequest multi = new MultipartRequest(req, SAVEDIRECTORY, MAXPOSTSIZE, ENCODING,
					new DefaultFileRenamePolicy());
			String filename = null;
			int filesize = 0;
			if (multi.getFilesystemName("filename") != null) {
				filename = multi.getFilesystemName("filename");
				filesize = (int) multi.getFile("filename").length();				
			}
			// ���� contentType : TEXT, HTML
			String content = multi.getParameter("content");// �Խù� ����
			String boardid = multi.getParameter("boardid");// �Խù� ����
			String contentType = multi.getParameter("contentType");// �Խù� Ÿ��
			if (contentType.equalsIgnoreCase("TEXT")) {
				content = UtilMgr.replace(content, "<", "&lt;");
			}
			// �亯�� ���� ref
			int ref = getMaxNum(boardid) + 1;
			
			con = pool.getConnection();
			sql = "insert tblBoard(name,content,subject,ref,pos,depth,";
			sql += "regdate,pass,count,ip,filename,filesize,boardid)";
			sql += "values(?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?, ?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, content);
			pstmt.setString(3, multi.getParameter("subject"));
			pstmt.setInt(4, ref);
			pstmt.setString(5, multi.getParameter("pass"));
			pstmt.setString(6, multi.getParameter("ip"));
			pstmt.setString(7, filename);
			pstmt.setInt(8, filesize);
			pstmt.setString(9, boardid);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	private void alert(String string) {
		// TODO Auto-generated method stub
		
	}

	// Board Max Num : ref�� ���忡 �ʿ��� ��
	public int getMaxNum(String boardid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxNum = 0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from tblBoard where boardid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardid);
			rs = pstmt.executeQuery();
			if (rs.next())
				maxNum = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxNum;
	}

	// Board Total Count : �� �Խù���
	// keyField : name, subject, content
	public int getTotalCount(String keyField, String keyWord, String boardid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if (keyWord.trim().equals("") || keyWord == null) {
				// �˻��� �ƴ� ���
				sql = "select count(*) from tblBoard where boardid=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, boardid);
			} else {
				sql = "select count(*) from tblBoard where " + keyField + " like ? and where boardid=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setString(2, boardid);
			}
			rs = pstmt.executeQuery();
			if (rs.next())
				totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}

	// Board List : keyField, keyWord, start(���۹�ȣ), cnt(�� �������� ������ �Խù� ����)
	public Vector<BoardBean> getBoardList(String keyField, String keyWord, int start, int cnt, String boardid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();		
			try {
				con = pool.getConnection();
				if (keyWord.trim().equals("") || keyWord == null) {// �˻��� �ƴ� ���
					sql = "select * from tblBoard where boardid= ? order by ref desc, pos limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, boardid);
					pstmt.setInt(2, start);
					pstmt.setInt(3, cnt);
				} else {// �˻��� ���
					sql = "select * from tblBoard where " + keyField + " like ? and boardid= ? ";
					sql += "order by ref desc, pos limit ?, ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + keyWord + "%");
					pstmt.setString(2, boardid);
					pstmt.setInt(3, start);
					pstmt.setInt(4, cnt);
				}
				rs = pstmt.executeQuery();
				while (rs.next()) {
					BoardBean bean = new BoardBean();
					bean.setNum(rs.getInt("num"));
					bean.setName(rs.getString("name"));
					bean.setSubject(rs.getString("subject"));
					bean.setPos(rs.getInt("pos"));
					bean.setRef(rs.getInt("ref"));
					bean.setDepth(rs.getInt("depth"));
					bean.setRegdate(rs.getString("regdate"));
					bean.setCount(rs.getInt("count"));
					bean.setFilename(rs.getString("filename"));
					bean.setBoardid(rs.getString("boardid"));
					vlist.addElement(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}		
		return vlist;
	}

	// Board Read : �Խù� �Ѱ� �о����
	public BoardBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblBoard where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setIp(rs.getString("ip"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));
				bean.setBoardid(rs.getString("boardid"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// Count up : ��ȸ�� ����
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set count = count +1 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Board Delete : �Խù� ����(���ε� ���ϱ��� ����)
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			// �Խù��� �����Ǳ� ���� ���ϸ� Ȯ��
			String filename = getBoard(num).getFilename();
			sql = "delete from tblBoard where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			if (pstmt.executeUpdate() == 1) {// ���������� ������ �Ǿ��ٸ� ���ϵ� ����
				if (filename != null && !filename.equals("")) {
					File f = new File(SAVEDIRECTORY + filename);
					if (f.exists()) {
						UtilMgr.delete(SAVEDIRECTORY + filename);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}

	}

	// Board Update : �Խù� ����
	// name, subject, content 3���� ����
	public void updateBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set name=?, subject=?, content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Board Update2 : �Խù� ����(���ε� ���ϱ��� ����)
	public void updateBoard2(MultipartRequest multi) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			int num = Integer.parseInt(multi.getParameter("num"));
			String name = multi.getParameter("name");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String filename = multi.getFilesystemName("filename");
			if (filename != null && filename.equals("")) {
				// ������ ������ ����
				BoardBean bean = getBoard(num);
				String tempFile = bean.getFilename();
				if (tempFile != null && filename.equals("")) {
					File f = new File(SAVEDIRECTORY + tempFile);
					if (f.exists())
						UtilMgr.delete(SAVEDIRECTORY + tempFile);
				}
				int filesize = (int) multi.getFile("filename").length();
				sql = "update tblBoard set name=?, subject=?, content=?, filename=?," + " filesize=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, subject);
				pstmt.setString(3, content);
				pstmt.setString(4, filename);
				pstmt.setInt(5, filesize);
				pstmt.setInt(6, num);
			} else {
				sql = "update  tblBoard set name=?, subject=?, content=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, subject);
				pstmt.setString(3, content);
				pstmt.setInt(4, num);
			}
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Board Reply : �Խù� �亯
	public void replyBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblBoard(name,content,subject,ref,pos,depth,regdate,";
			sql += "pass,count,ip)values(?, ?, ?, ?, ?, ?, now(), ?, 0, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getContent());
			pstmt.setString(3, bean.getSubject());
			////////////////////////////////////
			pstmt.setInt(4, bean.getRef());// ���۰� ������ ref => �亯���� �׷� ���
			pstmt.setInt(5, bean.getPos() + 1);// ���۰� pos+1
			pstmt.setInt(6, bean.getDepth() + 1);// ���۰��� depth+1
			////////////////////////////////////
			pstmt.setString(7, bean.getPass());
			pstmt.setString(8, bean.getIp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Board Reply Up : �亯�� ��ġ�� ����
	public void replyUpBoard(int ref, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set pos=pos+1 where ref=? and pos>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pos);
			pstmt.setInt(2, ref);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Post 1000 : �Խù� 1000�� �Է�
	public void post1000() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblBoard(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql += "values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0);";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 1000; i++) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	public static void main(String[] args) {
		BoardMgr mgr = new BoardMgr();
		// mgr.insertBoard(null);
		// System.out.println("��������Ȯ��");
		mgr.post1000();
		// System.out.println(10.0/3);//�Ǽ�/���� -> �Ǽ�/�Ǽ�
	}
}