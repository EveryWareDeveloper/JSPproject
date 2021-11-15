package gamestore;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import gamestore.MemberMgr;

public class MemberMgr {

	private DBConnectionMgr pool;

	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	// ID 중복확인
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from tblMember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	// 우편번호 검색
	public Vector<ZipcodeBean> zipcodeRead(String area3) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ZipcodeBean> vlist = new Vector<ZipcodeBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblZipcode where area3 like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + area3 + "%");// '%강남대로%'
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ZipcodeBean bean = new ZipcodeBean();
				bean.setZipcode(rs.getString(1));
				bean.setArea1(rs.getString(2));
				bean.setArea2(rs.getString(3));
				bean.setArea3(rs.getString(4));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	// 회원가입
	public boolean insertMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert tblMember(id,pwd,name,gender,birthday,email,zipcode,address,hp)"
					+ "values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			pstmt.setString(9, bean.getHp());

			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// 로그인
	public int loginMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int mode = 0;
		try {
			if (!checkId(id))
				return mode;
			con = pool.getConnection();
			sql = "select id, pwd from tblMember where id = ? and pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next())
				mode = 2;
			else
				mode = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return mode;
	}

	//로그인 체크
	public boolean loginCheck(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select count(id) from tblMember where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()&&rs.getInt(1)==1) 
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	// 회원정보 가져오기
	public MemberBean getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberBean bean = new MemberBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblMember where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setId(rs.getString("id"));
				bean.setPwd(rs.getString("pwd"));
				bean.setName(rs.getString("name"));
				bean.setGender(rs.getString("gender"));
				bean.setBirthday(rs.getString("birthday"));
				bean.setEmail(rs.getString("email"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				bean.setHp(rs.getString("hp"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// 회원정보 수정
	public boolean updateMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update tblMember set pwd=?, name=?, gender=?, "
					+ "birthday=?, email=?, zipcode=?, address=?, hp=? "
					+ "where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getPwd());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getGender());
			pstmt.setString(4, bean.getBirthday());
			pstmt.setString(5, bean.getEmail());
			pstmt.setString(6, bean.getZipcode());
			pstmt.setString(7, bean.getAddress());			
			pstmt.setString(8, bean.getHp());
			pstmt.setString(9, bean.getId());
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//회원 탈퇴 - 탈퇴하기
    public boolean deleteMember(String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            sql = "delete  from tblMember where id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            if(pstmt.executeUpdate()==1)
                flag=true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
	/// admin mode/////////////
	public Vector<MemberBean> getMemberList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<MemberBean> vlist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select * from tblMember";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString("id"));
				bean.setPwd(rs.getString("pwd"));
				bean.setName(rs.getString("name"));
				bean.setGender(rs.getString("gender"));
				bean.setBirthday(rs.getString("birthday"));
				bean.setEmail(rs.getString("email"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				bean.setHp(rs.getString("hp"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	// Admin Login
	public boolean adminCheck(String admin_id, String admin_pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select admin_id, admin_pwd from tblAdmin where admin_id = ? and admin_pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, admin_id);
			pstmt.setString(2, admin_pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	//name,hp로 id찾기
	   public MemberBean findId(String name, String hp) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      MemberBean bean = new MemberBean();
	      try {
	         con = pool.getConnection();
	         sql = "select id from tblMember where name = ? and hp = ?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, name);
	         pstmt.setString(2, hp);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            bean.setId(rs.getString("id"));
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt, rs);
	      }
	      return bean;
	   }
	
		
		
		public Vector<MemberBean> getPayMember(String id) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				Vector<MemberBean> vlist = new Vector<>();
				try {
					con = pool.getConnection();
					sql = "select name, email, hp, zipcode, address from tblMember where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						MemberBean bean = new MemberBean();
						bean.setName(rs.getString("name"));
						bean.setEmail(rs.getString("email"));
						bean.setHp(rs.getString("hp"));
						bean.setZipcode(rs.getString("zipcode"));
						bean.setAddress(rs.getString("address"));						
						vlist.addElement(bean);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return vlist;
			}
		
		//admin 에서 멤버에게 메일 보내기
		public void sendAccount(String id) {
			MemberBean bean = getMember(id);
			String pwd = bean.getPwd();
			String title = "OOO.com에서 아이디와 비밀번호 전송합니다.";
			String content = "<font color='red'><b>id : " + id; 
			content+= " / pwd : " + pwd+"</b></font>";
			String toEmail = bean.getEmail();
			MailSend.send(title, content, toEmail);
		}
		
		
		
		
		
		
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
		
		
		//id와 email를 조건 : pwd 리턴
				//select pwd from tblMember id=? and email=?
				public String findPwd(String id, String email) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					String pwd = null;
					try {
						con = pool.getConnection();
						sql = "select pwd from tblMember where id=? and email=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, id);
						pstmt.setString(2, email);
						rs = pstmt.executeQuery();
						if(rs.next()) 
							pwd = rs.getString(1);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return pwd;
				}
				
				
		public boolean sendPwd(String id, String email) {
			boolean flag = false;
			MemberMgr mgr = new MemberMgr();
			String pwd = mgr.findPwd(id, email);
			if(pwd!=null) {
				String title = "OOO.com에서 id와 pwd를 전송합니다.";
				String content = "id/pwd : " + id + " / " + pwd;
				MailSend.send(title, content, email);
				flag = true;
			}
			return flag;
		}
}
