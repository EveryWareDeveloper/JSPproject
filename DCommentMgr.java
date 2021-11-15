package gamestore;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

/*Dao : Data Access Object*/
public class DCommentMgr {

	private DBConnectionMgr pool;

	public DCommentMgr() {	
		pool = DBConnectionMgr.getInstance();
	}

	//Comment Insert
	public void insertDComment(DCommentBean bean){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblDComment(name,comment,regdate,num)values(?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getComment());
			pstmt.setInt(3, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	//Comment List
			public Vector<DCommentBean> getDComment(int num){
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				 Vector<DCommentBean> vlist = new Vector<>();
				try {
					con = pool.getConnection();
					sql = "select * from tblDComment where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					rs = pstmt.executeQuery();
					while(rs.next()){
						DCommentBean bean = new DCommentBean();
						bean.setDnum(rs.getInt("dnum"));
						bean.setName(rs.getString("name"));
						bean.setComment(rs.getString("comment"));
						bean.setRegdate(rs.getString("regdate"));
						bean.setNum(rs.getInt("num"));
						vlist.addElement(bean);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return vlist;
			}

		//Comment Count :
			public int getDCommentCount(int num){
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				int count  = 0;
				try {
					con = pool.getConnection();
					sql = "select count(num) from tblDComment where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					rs = pstmt.executeQuery();
					if(rs.next())
						count = rs.getInt(1);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return count;
			}
		
		//Comment Delete
			public void deleteDComment(int dnum){
				Connection con = null;
				PreparedStatement pstmt = null;
				String sql = null;
				try {
					con = pool.getConnection();
					sql = "delete from tblDComment where dnum=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, dnum);
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt);
				}
			}
		
		//Comment All Delete
			public void deleteAllDComment(int num){
				Connection con = null;
				PreparedStatement pstmt = null;
				String sql = null;
				try {
					con = pool.getConnection();
					sql = "delete from tblDComment where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt);
				}
			}
	}





















