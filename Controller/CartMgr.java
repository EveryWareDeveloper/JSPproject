package gamestore;

import java.util.Hashtable;

//��ٱ��� ��� : DB���� X, ���ǿ� ���
public class CartMgr {

	//key:��ǰ��ȣ, value : �ֹ���ü
	private Hashtable<Integer, OrderBean> hCart =
			new Hashtable<Integer, OrderBean>();
	
	//Cart Add : ������ ��ٱ��� �ִ� ����� �������, ���� ��츦 �������� ����
	public void addCart(OrderBean order) {
		int pid = order.getPid();
		int quantity = order.getQuantity();
		if(quantity>0) {
			if(hCart.containsKey(pid)) {//������ ��ٱ��Ͽ� ��ǰ�� �ִ� ���
				//��ٱ��Ͽ� ���� �ֹ� ��ü�� ������
				OrderBean temp = hCart.get(pid);
				//������ ������ ���ο� �ֹ��� ������ ���Ѵ�.
				quantity +=temp.getQuantity();
				order.setQuantity(quantity);
				//������ ������ ��ü�� ��ٱ��� ����
				hCart.put(pid, order);
			}else {//������ ��ٱ��Ͽ� ��ǰ�� ���� ���
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
		//��ǰ��ȣ�� hCart�� ��ü�� ã�Ƽ� ����
		int pid = order.getPid();
		hCart.remove(pid);
	}
	//Cart List
	public Hashtable<Integer, OrderBean> getCartList(){
		return hCart;
	}
	
	
}








