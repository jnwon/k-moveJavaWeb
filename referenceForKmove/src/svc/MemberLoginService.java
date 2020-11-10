package svc;

import java.sql.Connection;

import dao.MemberDAO;

import static db.JdbcUtil.*;
import vo.MemberBean;

public class MemberLoginService {
	public int isLoginMember(MemberBean member) {
		System.out.println("MemberLoginService-isLoginMember");
		int loginResult = 0;
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		loginResult = memberDAO.selectLoginMember(member);
		
		close(con);
		
		return loginResult;
	}
}
