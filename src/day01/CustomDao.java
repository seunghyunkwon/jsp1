package day01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day01.OracleConnectUtil;
import day01.Custom;

public class CustomDao {

	// 필드 값이 없는 클래스이다. -> new 연산으로 객체를 생성했을 때 서로 다른 필드 값을 갖는 것이 없다.
	// -> static 키워드로 실행 가능한 메소드이다.	static은 메모리의 공유영역이다.
	// -> jdbc에서 dao 클래스는 static으로 하지 않는다. -> 싱글턴 객체로 사용한다.
	
	private static CustomDao dao = new CustomDao();
	private CustomDao() {	}
	public static CustomDao getCustomDao() {
		return dao;
	}
	
	
	
	// select 쿼리 (기본키 컬럼으로 조회하고 결과 반환하기)
	public static Custom selectOne(String custom_id) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "SELECT * FROM TBL_CUSTOM# WHERE CUSTOM_ID=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Custom vo = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custom_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new Custom();
				vo.setCustom_id(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setEmail(rs.getString(3));
				vo.setAge(rs.getInt(4));
				vo.setReg_date(rs.getDate(5));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:" + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return vo;
	}

	public void insert(Custom vo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "INSERT INTO TBL_CUSTOM#" + "(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)"
				+ "VALUES(?, ?, ?, ?, sysdate)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCustom_id());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setInt(4, vo.getAge());
			pstmt.execute();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("sql 실행 오류" + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}

//	public void update(String custom_id, String email) {	//방법1
	public void update(Custom vo) { // 방법2
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE TBL_CUSTOM# SET email=? WHERE CUSTOM_ID = ?";
//		String custom_id=null;
//		String email=null;
		try {
			pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1, email);				//방법1
//		pstmt.setString(2, custom_id);			//방법1

			pstmt.setString(1, vo.getEmail()); // 방법2
			pstmt.setString(2, vo.getCustom_id()); // 방법2
			pstmt.execute();
			pstmt.close();

		} catch (SQLException e) {
			System.out.println("sql 실행오류 :" + e.getMessage());
		}
	}

	public void delelte(String custom_id) { // custom_id는 이 메소드를 호출할 때 값이 전달된다.
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM TBL_CUSTOM# WHERE CUSTOM_ID=?";
//		String custom_id = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custom_id);
			pstmt.execute();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("sql 실행오류 :" + e.getMessage());
		}
		System.out.println("정상적으로 회원 탈퇴되었습니다.");
		OracleConnectUtil.close(conn);
	}

	// selectOne() 메소드와 쿼리는 동일하지만 리턴형식이 다른 예
	public boolean idCheck(String id) {
		Connection conn = OracleConnectUtil.connect();
		boolean result = false;
		String sql = "SELECT * FROM TBL_CUSTOM# WHERE CUSTOM_ID=?";
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (!rs.next()) // 값이 있으면 true 없으면 false
				result = true;

			pstmt.close();
			//
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:" + e.getMessage());
		}
		return result; // ID가 중복되면 false, 중복되지않으면 true
	}

	// select 쿼리 (조건 없음)
	public List<Custom> selectAll() {
		Connection conn = OracleConnectUtil.connect();
		String sql = "SELECT * FROM TBL_CUSTOM#";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Custom> customs = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				customs.add(new Custom(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5)));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:" + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return customs;
	}

}
