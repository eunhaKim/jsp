package photoGallery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class PhotoGalleryDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	private PhotoGalleryVO vo = null;
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {} 
			finally {
				pstmtClose();
			}
		}
	}

	// photoGallery전체 자료 가져오기
	public ArrayList<PhotoGalleryVO> getPhotoGalleryList() {
		ArrayList<PhotoGalleryVO> vos = new ArrayList<PhotoGalleryVO>();
		try {
			sql = "select * from photoGallery order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new PhotoGalleryVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPart(rs.getString("part"));
				vo.setTitle(rs.getString("title"));
				vo.setPhotoCount(rs.getInt("photoCount"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setpDate(rs.getString("pDate"));
				vo.setGoodCount(rs.getInt("goodCount"));
				vo.setReadNum(rs.getInt("readNum"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 가장 큰 idx값 가져오기
	public int getPhotoGalleryMaxIdx() {
		int maxIdx = 1;
		try {
			sql = "select idx from photoGallery order by idx desc limit 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) maxIdx = rs.getInt("idx") + 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return maxIdx;
	}

	// photoGallery테이블에 레코드 삽입처리
	public int setPhotoGalleryInput(PhotoGalleryVO vo) {
		int res = 0;
		try {
			conn.setAutoCommit(false);
			
			sql = "insert into photoGallery values (?,?,?,?,?,?,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getIdx());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getPart());
			pstmt.setString(4, vo.getTitle());
			pstmt.setInt(5, vo.getPhotoCount());
			pstmt.setString(6, vo.getHostIp());
			pstmt.executeUpdate();
			pstmtClose();
			
			String[] fSNames = vo.getfSName().split("/");
			for(String fSName : fSNames) {
				sql = "insert into photoStorage values (default,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, vo.getIdx());
				pstmt.setString(2, fSName);
				pstmt.executeUpdate();
				pstmtClose();
			}
			
			conn.commit();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
			try {
				if(conn != null) conn.rollback();	// 예외오류 발생시는 기존에 작업된 sql문의 모두 rollback처리된다.
			} catch (Exception e2) {}
		}
		return res;
	}
}
