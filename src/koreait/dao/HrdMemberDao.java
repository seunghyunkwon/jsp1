package koreait.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day01.OracleConnectUtil;
import koreait.vo.HrdMember;

public class HrdMemberDao {
	private static HrdMemberDao dao = new HrdMemberDao();
	private HrdMemberDao()	{}
	public static HrdMemberDao getInstance() {
		return dao;
	}
	
	public void insert(HrdMember vo) {
		Connection conn = OracleConnectUtil.connect();
//		String sql = "INSERT INTO MEMBER_TBL_02" + "(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)"
//				+ "VALUES(member_seq.nextval, ?, ?, ?, sysdate, ?, ?)";
		
		String sql = "INSERT INTO MEMBER_TBL_02" + "(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)"
				+ "VALUES(?, ?, ?, ?, sysdate, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getCustno());
			pstmt.setString(2, vo.getCustName());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getGrade());
			pstmt.setString(6, vo.getCity());
			pstmt.execute();	
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("HrdMemberDao Insert 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	public int getNextseq() {
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT MEMBER_SEQ.NEXTVAL FROM DUAL";
		int result = 0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getInt(1);
			pstmt.close();
		} catch (Exception e) {
			System.out.println("HrdMemberDao SEQ 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return result;
	}
	//회원정보수정 : phone, address, city 
	public void update(HrdMember vo) { 
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER_TBL_02 SET phone=?, address=?, city=? WHERE custno = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPhone());
			pstmt.setString(2, vo.getAddress());
			pstmt.setString(3, vo.getCity());
			pstmt.setInt(4, vo.getCustno());
			pstmt.execute();
			pstmt.close();

		} catch (SQLException e) {
			System.out.println("HrdMemberDao update 오류 :" + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	
	public HrdMember selectOne(int custno) {
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT * FROM MEMBER_TBL_02 WHERE CUSTNO = ?";
		HrdMember result = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				result = new HrdMember(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getDate(5),
						rs.getString(6),
						rs.getString(7));
			pstmt.close();
		} catch (Exception e) {
			System.out.println("HrdMemberDao selectOne 오류 : " + e.getMessage());
		}
		return result;
	}
	
	public List<HrdMember> selectAll(){
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT * FROM MEMBER_TBL_02";
		List<HrdMember> list = new ArrayList<HrdMember>();
		try {
			pstmt = conn.prepareStatement(sql);
			//매개변수 값이 필요없는 sql : set메소드 없음
			rs = pstmt.executeQuery();

			while(rs.next()) {
				//테이블 조회된 컬럼을 자바 객체로 생성해서 저장 (매핑)
				list.add(new HrdMember(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getDate(5),
						rs.getString(6),
						rs.getString(7)));
			}
		} catch (Exception e) {
			System.out.println("HrdMemberDao selectAll 오류 : " + e.getMessage());
		}
		
		return list;
	}
	
	//이름을 입력하고 전달받아 검색하기
	public List<HrdMember> searchName(String name){
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT * FROM MEMBER_TBL_02 WHERE CUSTNAME=?";
		List<HrdMember> list = new ArrayList<HrdMember>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				//테이블 조회된 컬럼을 자바 객체로 생성해서 저장 (매핑)
				list.add(new HrdMember(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getDate(5),
						rs.getString(6),
						rs.getString(7)));
			}
		} catch (Exception e) {
			System.out.println("HrdMemberDao searchName 오류 : " + e.getMessage());
		}
		
		return list;
	}
	
	/*
	 * public List<HrdMember> search(String col, String find){ List<HrdMember> list
	 * = new ArrayList<HarMember>(); String sql = "SELECT "
	 * 
	 * }
	 */

}
