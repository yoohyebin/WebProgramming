package que;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class QueDAO {
	private Connection conn;

	private ResultSet rs;
	
	public QueDAO() {
		try {
			String dbURL = "jdbc:mysql://203.230.193.204:3306/201721366";
			String dbID ="201721366";
			String dbPassword="201721366";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate()
	{
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //db error
	}
	
	public int getNext()
	{
		String SQL = "select queID from question order by queID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public ArrayList<Que> getList(int pageNumber)
	{
		String SQL = "select * from question where queID < ? AND queAvailable = 1 order by queID desc limit 10";
		ArrayList<Que> list = new ArrayList<Que>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Que q = new Que();
				q.setQueID(rs.getInt(1) );
				q.setQueTitle(rs.getString(2));
				q.setQueUserID(rs.getString(3));
				q.setQueDate(rs.getString(4));
				q.setQueContent(rs.getString(5));
				q.setQueCount(rs.getInt(6));
				q.setQueAvailable(rs.getInt(7));
				list.add(q);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}	
	public int write(String queTitle, String queUserID, String queContent,int queCount)
	{
		String SQL = "insert into question values (?, ?, ?, ?, ?, ?,?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, queTitle );
			pstmt.setString(3, queUserID );
			pstmt.setString(4, getDate() );
			pstmt.setString(5, queContent );
			pstmt.setInt(6, queCount );
			pstmt.setInt(7, 1 );
	
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public boolean nextPage(int pageNumber)
	{
		String SQL = "select * from question where queID < ? AND queAvailable = 1 order by queID desc limit 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	public Que getQue(int queID) {
		String SQL = "select * from question where queID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, queID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Que q = new Que();
				q.setQueID(rs.getInt(1) );
				q.setQueTitle(rs.getString(2));
				q.setQueUserID(rs.getString(3));
				q.setQueDate(rs.getString(4));
				q.setQueContent(rs.getString(5));
				q.setQueCount(rs.getInt(6));
				q.setQueAvailable(rs.getInt(7));
				return q;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	public int update(int queID, String queTitle, String queContent)
	{
		String SQL = "update question set queTitle=?, queContent=? where queID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, queTitle );
			pstmt.setString(2, queContent );
			pstmt.setInt(3, queID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int count(int queID)
	{
		String SQL = "update question set queCount=queCount+1 where queID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, queID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int queID)
	{
		String SQL = "update question set queAvailable=0 where queID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, queID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
}
