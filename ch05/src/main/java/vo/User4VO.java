package vo;

public class User4VO {
	private String name;
	private String gender;
	private String age;
	private String address;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAddress() {
		if(address == null) {
			address = "없음";
		}
		
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "User4VO [name=" + name + ", gender=" + gender + ", age=" + age + ", address=" + address + "]";
	}
	
	
}
