package gamestore;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Hashtable;
import java.util.Vector;

import shop.OrderBean;

public class paymentMgr {
	
	private DBConnectionMgr pool;
	
	public paymentMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	

	//Payment Insert
	public void insertPayform(PaymentBean payform) {		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblPayment(id,name,email,hp,zipcode,address,totalPrice)"
					+ "values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, payform.getId()); //����ID
			pstmt.setString(2, payform.getName()); // �ֹ��� �̸�
			pstmt.setString(3, payform.getEmail()); // �̸���
			pstmt.setString(4, payform.getHp()); // �޴�����ȣ
			pstmt.setString(5, payform.getZipcode()); // �����ȣ
			pstmt.setString(6, payform.getAddress()); // �ּ�
			pstmt.setInt(7, payform.getTotalPrice()); // �� �����ݾ�
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Payment List
	public Vector<PaymentBean> getPaymentList(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<PaymentBean> vlist = new Vector<PaymentBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblPayment where id=? order by no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PaymentBean payment = new PaymentBean();
				payment.setId(rs.getString("id")); //����ID
				payment.setName(rs.getString("name"));
				payment.setEmail(rs.getString("email"));
				payment.setHp(rs.getString("hp"));
				payment.setZipcode(rs.getString("zipcode"));
				payment.setAddress(rs.getString("address"));
				payment.setTotalPrice(rs.getInt("totalPrice"));
				vlist.addElement(payment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;

	}
	
	
}












