package vo;

public class CustomerDTO {
	private String cid;
	private String name;
	private String hp;
	private String address;
	private String rdate;
	
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		if(hp == null) {
			return "없음";
		}else {			
			return hp;
		}
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getAddress() {
		if(address == null) {
			return "없음";
		}else {			
			return address;
		}
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	@Override
	public String toString() {
		return "CustomerVo [cid=" + cid + ", name=" + name + ", hp=" + hp + ", address=" + address + ", rdate=" + rdate
				+ "]";
	}
	
	
}
