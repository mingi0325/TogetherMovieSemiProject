package cinema.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static db.JdbcUtil.*;

import cinema.model.dao.CinemaDAO;
import cinema.model.vo.Cinema;

public class CinemaService {

	public ArrayList<Cinema> selectCList() {
		CinemaDAO cineDAO = CinemaDAO.getInstance();
		Connection conn = getConnection();
		cineDAO.setConnection(conn);
		System.out.println("cinemaService : DAO >>" + cineDAO);
		ArrayList<Cinema> cList = cineDAO.getList();
		
		System.out.println("CineService : selectList >" + cList);
		close(conn);
		
		
		return cList;
	}

	public int insertFCinema(Cinema cinema) {
		CinemaDAO cineDAO = CinemaDAO.getInstance();
		Connection conn = getConnection();
		cineDAO.setConnection(conn);
		int result = cineDAO.insertFCinema(cinema);
		System.out.println("CineService : insertFCinema >" + result);
		if(result >0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
