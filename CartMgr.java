package gamestore;

import java.util.Hashtable;

//장바구니 기능 : DB연동 X, 세션에 사용
public class CartMgr {

	//key:상품번호, value : 주문객체
	private Hashtable<Integer, OrderBean> hCart =
			new Hashtable<Integer, OrderBean>();
	
	//Cart Add : 기존에 장바구니 있는 사람이 있을경우, 없을 경우를 로직으로 구현
	public void addCart(OrderBean order) {
		int pid = order.getPid();
		int quantity = order.getQuantity();
		if(quantity>0) {
			if(hCart.containsKey(pid)) {//기존에 장바구니에 상품이 있는 경우
				//장바구니에 기존 주문 객체를 가져옴
				OrderBean temp = hCart.get(pid);
				//기존에 수량과 새로운 주문에 수량을 더한다.
				quantity +=temp.getQuantity();
				order.setQuantity(quantity);
				//수량이 증가된 객체를 장바구니 저장
				hCart.put(pid, order);
			}else {//기존에 장바구니에 상품이 없는 경우
				hCart.put(pid, order);
			}
		}
	}
	
	//Cart Update
	public void updateCart(OrderBean order) {
		//int -> Integer : AutoBoxing
		hCart.put(order.getPid(), order);
	}
	//Cart Delete
	public void deleteCart(OrderBean order) {
		//상품번호로 hCart에 객체를 찾아서 제거
		int pid = order.getPid();
		hCart.remove(pid);
	}
	//Cart List
	public Hashtable<Integer, OrderBean> getCartList(){
		return hCart;
	}
	
	
}








