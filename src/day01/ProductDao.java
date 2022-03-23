package day01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day01.OracleConnectUtil;
import day01.Product;

public class ProductDao {
	// singleton

	private static ProductDao pdao = new ProductDao();

	private ProductDao() {
	}

	public static ProductDao getProductDao() {
		return pdao;
	}

	// select 쿼리 (기본키 컬럼으로 조회하고 결과 반환하기)
	public static Product selectOne(String pcode) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "SELECT * FROM TBL_PRODUCT# WHERE PCODE=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product po = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				po = new Product();
				po.setPcode(rs.getString(1));
				po.setCategory(rs.getString(2));
				po.setPrice(rs.getInt(4));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류:" + e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return po;
	}

	public void insert(Product po) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "INSERT INTO TBL_PRODUCT#" + "(PCODE, CATEGORY, PNAME, PRICE)"
				+ "VALUES(?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, po.getPcode());
			pstmt.setString(2, po.getCategory());
			pstmt.setString(3, po.getPname());
			pstmt.setInt(4, po.getPrice());
			pstmt.execute();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("sql 실행 오류" + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}

	public void update(Product po) { 
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE TBL_PRODUCT# SET PNAME=? WHERE PCODE = ?";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, po.getPname()); // 방법2
			pstmt.setString(2, po.getPcode()); // 방법2
			pstmt.execute();
			pstmt.close();

		} catch (SQLException e) {
			System.out.println("sql 실행오류 :" + e.getMessage());
		}
	}
	
	public void delelte(String Pcode) { 
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM TBL_PRODUCT# WHERE PCODE=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Pcode);
			pstmt.execute();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("sql 실행오류 :" + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	
	// selectAll
		public List<Product> selectAll() {
			Connection conn = OracleConnectUtil.connect();
			String sql = "SELECT * FROM TBL_PRODUCT#";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> product = new ArrayList<>();
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					product.add(new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
				}
				pstmt.close();
			} catch (SQLException e) {
				System.out.println("SQL 실행 오류:" + e.getMessage());
			}
			OracleConnectUtil.close(conn);
			return product;
		}
	
}
