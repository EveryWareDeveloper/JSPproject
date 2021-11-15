package gamestore;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class OrderMgr {
	
	private DBConnectionMgr pool;
	
	public OrderMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Order Insert
	public void insertOrder(OrderBean order) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblOrder(oid,pid,quantity,odate,state,id)"
					+ "values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, order.getOid());
			pstmt.setInt(2, order.getPid());
			pstmt.setInt(3, order.getQuantity());
			pstmt.setString(4, UtilMgr.getDay());
			//접수중(1),접수(2),입금확인(3),배송준비(4),배송중(5),완료(6)
			pstmt.setString(5, "1");
			pstmt.setString(6, order.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Order List
	//select * from tblOrder where id=? order by no desc
	public Vector<OrderBean> getOrderList(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<OrderBean> vlist = new Vector<OrderBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblOrder where id=? order by oid desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean order = new OrderBean();
				order.setOid(rs.getInt("oid"));//주문번호
				order.setId(rs.getString("id"));//주문한 사람
				order.setPid(rs.getInt("pid"));//주문상품번호
				order.setQuantity(rs.getInt("quantity"));//주문수량
				order.setOdate(rs.getString("odate"));;//주문날짜
				order.setState(rs.getString("state"));//주문상태
				vlist.addElement(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
////admin mode/////
    
    //Order All List : 모든 고객의 주문 리스트
    public Vector<OrderBean> getOrderList(){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        Vector<OrderBean> vlist = new Vector<OrderBean>();
        try {
            con = pool.getConnection();
            sql = "select * from tblOrder order by oid desc";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                OrderBean order = new OrderBean();
                order.setOid(rs.getInt("oid"));
                order.setId(rs.getString("id"));
                order.setPid(rs.getInt("pid"));
                order.setQuantity(rs.getInt("quantity"));
                order.setOdate(rs.getString("odate"));
                order.setState(rs.getString("state"));
                vlist.addElement(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vlist;
    }
    
    //Order Detail
    public OrderBean getOrderDetail(int oid/*주문번호*/) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        OrderBean order = new OrderBean();
        try {
            con = pool.getConnection();
            sql = "select * from tblOrder where oid=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, oid);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                order.setOid(rs.getInt("oid"));
                order.setId(rs.getString("id"));
                order.setPid(rs.getInt("pid"));
                order.setQuantity(rs.getInt("quantity"));
                order.setOdate(rs.getString("odate"));
                order.setState(rs.getString("state"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return order;
    }
    
    //Order Update(주문상태)
    public boolean updateOrder(int oid/*주문번호*/, String state/*주문상태*/) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            sql = "update tblOrder set state=? where oid=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, state);
            pstmt.setInt(2, oid);
            if(pstmt.executeUpdate()==1) flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    
    //Order Delete
    public boolean deleteOrder(int oid) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            sql = "delete from tblOrder where oid=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, oid);
            if(pstmt.executeUpdate()==1) flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
	
}













