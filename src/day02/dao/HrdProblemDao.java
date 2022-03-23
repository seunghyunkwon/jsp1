package day02.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day01.OracleConnectUtil;
import day02.vo.Member;
import day02.vo.SaleSum;

public class HrdProblemDao {	 //Data Access Object : db의 sql실행 메소드정의 클래스

	private static HrdProblemDao hrdp = new HrdProblemDao();
	private HrdProblemDao() {	}
	public static HrdProblemDao getHrdProblemDao() {
		return hrdp;
	}
	//회원 insert     : insert
	public void insert(Member vo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "INSERT INTO MEMBER_TBL_02" + "(CUSTNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY)"
				+ "VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getCustno());
			pstmt.setString(2, vo.getCustname());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setDate(5, vo.getJoindate());
			pstmt.setString(6, vo.getGrade());
			pstmt.setString(7, vo.getCity());
			pstmt.execute();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("sql 실행 오류" + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	//회원 update		 : update
	public void Update(Member vo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "INSERT INTO MEMBER_TBL_02 SET PHONE=?, ADDRESS=?, CITY=? WHERE CUSTNO =?"
				+ "VALUES(?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPhone());
			pstmt.setString(2, vo.getAddress());
			pstmt.setString(3, vo.getCity());
			pstmt.setInt(4, vo.getCustno());
			pstmt.execute();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("sql 실행 오류" + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	//회원 전체 select   : selectMemberAll
	public List<Member> selectAll() {
		Connection conn = OracleConnectUtil.connect();
		String sql = "SELECT * FROM TBL_CUSTOM#";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> members = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				members.add(new Member(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7)));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:" + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return members;
	}
	//회원 pk select    : selectMember
	public static Member selectMember(String Custno) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "SELECT * FROM MEMBER_TBL_02 WHERE CUSTNO=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member vo = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Custno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new Member();
				vo.setCustno(rs.getInt(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getDate(5));
				vo.setGrade(rs.getString(6));
				vo.setCity(rs.getString(7));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:" + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return vo;
	}
	
	//매출집계 select   : selectSale
	public List<SaleSum> selectSale(){
		Connection conn = OracleConnectUtil.connect();
		String sql="SELECT mt.CUSTNO, CUSTNAME, decode(grade,'A','VIP','B','일반','C','직원')AS agrade, asum FROM MEMBER_TBL_02 mt,"
				+ "(SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt GROUP BY CUSTNO ORDER BY asum desc) sale WHERE mt.CUSTNO = sale.custno";
		PreparedStatement pstmt = null;
		ResultSet rs= null;		
		List<SaleSum> sales = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();	//select 
			
			while(rs.next()) {
				SaleSum temp = new SaleSum(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4));
				sales.add(temp);
			}
			pstmt.close();
			
		}catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		
		}
		
		OracleConnectUtil.close(conn);
		return sales;
	}
}
