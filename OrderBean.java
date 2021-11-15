package gamestore;


public class OrderBean {

private int oid;
private	String id;
private int pid;
private String odate;
private int quantity;
private String state;
private int payment;
private double point;


public double getPoint() {
	return point;
}
public void setPoint(double point) {
	this.point = point;
}
public int getOid() {
	return oid;
}
public void setOid(int oid) {
	this.oid = oid;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public String getOdate() {
	return odate;
}
public void setOdate(String odate) {
	this.odate = odate;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public int getPayment() {
	return payment;
}
public void setPayment(int payment) {
	this.payment = payment;
}


}
