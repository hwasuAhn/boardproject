package www.member;

public class MemberDTO {
	
    /** 회원 아이디, 식별자, PK */
    private String id;
    /** 비밀번호 */
    private String passwd;
    /** 성명 */
    private String mname;
    /** 전화번호 */
    private String tel;
    /** 이메일 */
    private String email;    
    /** 우편번호 */
    private String zipcode;
    /** 주소1*/
    private String address1;
    /** 주소2*/    
    private String address2;
    /** 직업 */
    private String job;
    /** 회원등급 */
    private String mlevel;
    /** 회원 가입일 */
    private String mdate;
    
	public MemberDTO() {}  //기본 생성자

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getMlevel() {
		return mlevel;
	}

	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", passwd=" + passwd + ", mname="
				+ mname + ", tel=" + tel + ", email=" + email + ", zipcode="
				+ zipcode + ", address1=" + address1 + ", address2=" + address2
				+ ", job=" + job + ", mlevel=" + mlevel + ", mdate=" + mdate
				+ "]";
	}
    
}  //----------------------------class MemberDTO end