package cinema.model.dao;

import static db.JdbcUtil.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import cinema.model.vo.Cinema;	

public class CinemaDAO {
	private static CinemaDAO cinemaDAO;
	private Connection conn;
	private Properties prop = new Properties();
	public CinemaDAO() {
		String filePath = CinemaDAO.class.getResource("/sql/CineSQL.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static CinemaDAO getInstance() {
		if(cinemaDAO == null) {
			cinemaDAO = new CinemaDAO();
		}
		return cinemaDAO;
	}
	
	public void setConnection(Connection con2) {
		this.conn = con2;
	}
	public ArrayList<Cinema> getList() {
		// dao에서 리스트에 보여줄 정보를 가져옴 일단 전부다 가져오자
		
		System.out.println("CinemaDAO:getList()실행");
		
		//stmt 실행
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getCinemaList");
		ArrayList<Cinema> list = null;
		
		try {
			System.out.println("try진입");		//현재 진입이 안대는중 왜지??
			System.out.println("cinema 커넥션 : "+conn);
			
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			System.out.println("cinemaDAO : stmt >>" + stmt);
			System.out.println("cinemaDAO : conn >>" + conn);
			list = new ArrayList<Cinema>();
			
			while(rset.next()) {
				Cinema cn = new Cinema(rset.getInt("CN_NO"),
										rset.getString("CN_NAME"),
										rset.getString("CN_TOPIC"),
										rset.getString("CN_AVAILABLE"),
										rset.getString("CN_ADRESS"),
										rset.getString("CN_SITELINK"),
										rset.getString("CN_MAPLINK"),
										rset.getString("CN_STATUS"),
										rset.getString("CN_AREA"),
										rset.getString("CN_FILE_PATH"),
										rset.getString("CN_FILENAME")
							);
				
				list.add(cn);
				System.out.println("list:" + list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	public int insertFCinema(Cinema cinema) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertCinema");
		int result = 0;
		
		//SEQ, 1, 2, 3, 4, 5, NULL, 6, 7, NULL, 8, 9, 10, 11, 12 , 13
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, cinema.getCn_name());
			pstmt.setString(2, cinema.getCn_topic());
			pstmt.setString(3, cinema.getCn_available());
			pstmt.setString(4, cinema.getCn_adress());
			pstmt.setString(5, cinema.getCn_sitelink());
			pstmt.setString(6, cinema.getCn_status());
			pstmt.setString(7, cinema.getArea());
			pstmt.setString(8, cinema.getCn_file_name());
			pstmt.setString(9, cinema.getCn_floor());
			pstmt.setString(10, cinema.getCn_pGuide());
			pstmt.setString(11, cinema.getCn_pConfirm());
			pstmt.setString(12, cinema.getCn_pPay());
			pstmt.setString(13, cinema.getCn_bus());
			pstmt.setString(14, cinema.getCn_metro());
			pstmt.setInt(15, cinema.getCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
}
