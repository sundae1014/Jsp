package dto;

public class TransactionDTO {

	private int t_no;
	private String t_a_no;
	private int t__dist;
	private int t_amount;
	private String t_datetime;
	
	private String t_a_no_to;
	
	public String getT_a_no_to() {
		return t_a_no_to;
	}
	public void setT_a_no_to(String t_a_no_to) {
		this.t_a_no_to = t_a_no_to;
	}
	public int getT_no() {
		return t_no;
	}
	public void setT_no(int t_no) {
		this.t_no = t_no;
	}
	public void setT_no(String t_no) {
		if(t_no != null) {
			this.t_no = Integer.parseInt(t_no);
		}
	}
	public String getT_a_no() {
		return t_a_no;
	}
	public void setT_a_no(String t_a_no) {
		this.t_a_no = t_a_no;
	}
	public int getT__dist() {
		return t__dist;
	}
	public void setT__dist(int t__dist) {
		this.t__dist = t__dist;
	}
	public void setT__dist(String t__dist) {
		if(t__dist != null) {
			this.t__dist = Integer.parseInt(t__dist);
		}
	}
	public int getT_amount() {
		return t_amount;
	}
	public void setT_amount(int t_amount) {
		this.t_amount = t_amount;
	}
	public void setT_amount(String t_amount) {
		if(t_amount != null) {
			this.t_amount = Integer.parseInt(t_amount);
		}
	}
	public String getT_datetime() {
		return t_datetime;
	}
	public void setT_datetime(String t_datetime) {
		this.t_datetime = t_datetime;
	}
	@Override
	public String toString() {
		return "TransactionDTO [t_no=" + t_no + ", t_a_no=" + t_a_no + ", t__dist=" + t__dist + ", t_amount=" + t_amount
				+ ", t_datetime=" + t_datetime + "]";
	}
	
	
}
