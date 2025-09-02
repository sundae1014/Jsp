package jboard.util;

public class Sql {
	
	public static final String SELECT_TERMS = "SELECT * FROM TB_TERMS WHERE NO=?";
	
	//user
	public static final String SELECT_COUNT = "SELECT count(*) FROM tb_user ";
	public static final String WHERE_USID = "WHERE USID=?";
	public static final String WHERE_NICK = "WHERE NICK=?";
	public static final String WHERE_EMAIL = "WHERE EMAIL=?";
	public static final String WHERE_HP = "WHERE HP=?";
	
	public static final String INSERT_USER = "INSERT INTO TB_USER (USID, PASS, US_NAME, NICK, EMAIL, HP, ZIP, ADDR1, ADDR2, REG_Ip, REG_DATE) "
												+ "VALUES (?,STANDARD_HASH(?, 'SHA256'),?,?,?,?,?,?,?,?,SYSDATE)";
}
