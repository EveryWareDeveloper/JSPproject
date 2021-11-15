package gamestore;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import gamestore.OrderBean;

public class ProductMgr {
	private DBConnectionMgr pool;
	public static final String SAVEDIRECTORY = 
			"E:/Jsp/eclipse-workspace/myapp/src/main/webapp/gamestore/img";
	public static final String ENCODING = "EUC-KR";
	public static final int MAXPOSTSIZE = 10*1024*1024;//10mb
	
	public ProductMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Product List
	public Vector<ProductBean> getProductList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> vlist = new Vector<ProductBean>();
		try {
			con = pool.getConnection();
			sql = "select pid, name, price, img, hcnt, discount, detail, rdate, type, stock from tblProduct "
					+ "order by pid desc";			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setPid(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(3));
				bean.setImg(rs.getString(4));				
				bean.setHcnt(rs.getInt(5));
				bean.setDiscount(rs.getInt(6));
				bean.setDetail(rs.getString(7));
				bean.setRdate(rs.getString(8));
				bean.setType(rs.getString(9));
				bean.setStock(rs.getInt(10));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();			
		} finally {
			pool.freeConnection(con, pstmt, rs);			
		}		
		return vlist;		
	}
	
	//Product Detail
	public ProductBean getProduct(int pid) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        ProductBean bean = new ProductBean();
        try {
            con = pool.getConnection();
            sql = "select pid, name, price, img, hcnt, discount, detail, rdate, type, stock "
                    + "from tblProduct where pid=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, pid);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                 bean.setPid(rs.getInt(1));
                    bean.setName(rs.getString(2));
                    bean.setPrice(rs.getInt(3));
                    bean.setImg(rs.getString(4));
                    bean.setHcnt(rs.getInt(5));
                    bean.setDiscount(rs.getInt(6));
                    bean.setDetail(rs.getString(7));
                    bean.setRdate(rs.getString(8));
                    bean.setType(rs.getString(9));
                    bean.setStock(rs.getInt(10));
                   }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return bean;
    }
	
	//Product Stock Reduce(���� -> ������)
	public void reduceProduct(OrderBean order) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblProduct set stock = stock-? where pid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, order.getQuantity());//�ֹ�����
			pstmt.setInt(2, order.getPid());//��ǰ��ȣ
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	///admin mode////
	
	//Product Insert
	//insert tblProduct(name,price,detail,date,stock,image)
	 //values(?,?,?,?,?,?)
	//�̹��� ���Ͼ��ε� �ƴҰ��� �̹����� : ready.gif
	public boolean insertProduct(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			MultipartRequest multi = new MultipartRequest(req, SAVEDIRECTORY,
					MAXPOSTSIZE, ENCODING, new DefaultFileRenamePolicy());
			con = pool.getConnection();
			sql = "insert tblProduct(name,price,detail,rdate,stock,img)"
					+ "values(?,?,?,?,?,?)";			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
			pstmt.setString(3, multi.getParameter("detail"));
			pstmt.setString(4, UtilMgr.getDay());
			pstmt.setInt(5, Integer.parseInt(multi.getParameter("stock")));
			if(multi.getFilesystemName("img")!=null)
				pstmt.setString(6, multi.getFilesystemName("img"));
			else
				pstmt.setString(6, "ready.gif");
			if(pstmt.executeUpdate()==1) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//Product Update : �̹��� ���� ���� ����.
	public boolean updateProduct(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			MultipartRequest multi = new MultipartRequest(req, SAVEDIRECTORY,
					MAXPOSTSIZE, ENCODING, new DefaultFileRenamePolicy());
			con = pool.getConnection();
			if(multi.getFilesystemName("img")!=null) {//�̹����� ����
				sql = "update tblProduct set name=?, price=?,"
						+ "detail=?, stock=?, img=? where pid=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
				pstmt.setString(3, multi.getParameter("detail"));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("stock")));
				pstmt.setString(5, multi.getFilesystemName("img"));
				pstmt.setInt(6, Integer.parseInt(multi.getParameter("pid")));
			}else {//�̹��� ���� �ƴ�.
				sql = "update tblProduct set name=?, price=?,"
						+ "detail=?, stock=? where pid=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
				pstmt.setString(3, multi.getParameter("detail"));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("stock")));
				pstmt.setInt(5, Integer.parseInt(multi.getParameter("pid")));
			}
			if(pstmt.executeUpdate()==1) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//Product Delete : ��ǰ �̹����� �������� ����.
	public boolean deleteProduct(int pid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "delete from tblProduct where pid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pid);
			if(pstmt.executeUpdate()==1) 
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	// ���� �˻�
		public Vector<ProductBean> searchRead(String name) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<ProductBean> vlist = new Vector<ProductBean>();
			try {
				con = pool.getConnection();
				sql = "select name, img, pid from tblproduct where name like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + name + "%");
				rs = pstmt.executeQuery();
				while (rs.next()) {
					ProductBean bean = new ProductBean();
					bean.setName(rs.getString(1));
					bean.setImg(rs.getString(2));
					bean.setPid(rs.getInt(3));
					vlist.addElement(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
	
	//product ī�װ���
	public Vector<ProductBean> getType(String type){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        Vector<ProductBean> vlist = new Vector<ProductBean>();
        try {
            con = pool.getConnection();
            sql = "select pid, name, img from tblProduct where type =?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, type);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                ProductBean bean = new ProductBean();
                bean.setPid(rs.getInt(1));
                bean.setName(rs.getString(2));
                bean.setImg(rs.getString(3));
                vlist.addElement(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            pool.freeConnection(con, pstmt, rs);

        }

        return vlist;

    }
	
	//product ���ΰ���
		public Vector<ProductBean> getDiscount(String discount){
	        Connection con = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        String sql = null;
	        Vector<ProductBean> vlist = new Vector<ProductBean>();
	        try {
	            con = pool.getConnection();
	            sql = "select pid, name, img from tblProduct where discount>0";
	            pstmt = con.prepareStatement(sql);
	            rs = pstmt.executeQuery();
	            while(rs.next()) {
	                ProductBean bean = new ProductBean();
	                bean.setPid(rs.getInt(1));
	                bean.setName(rs.getString(2));
	                bean.setImg(rs.getString(3));
	                vlist.addElement(bean);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            pool.freeConnection(con, pstmt, rs);
	        }
	        return vlist;
	    }
	//HCnt Up : '���ƿ�' 1�� ���� 
		public void upHCnt(int pid) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "update tblproduct set hcnt=hcnt+1 where pid=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, pid);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
}

