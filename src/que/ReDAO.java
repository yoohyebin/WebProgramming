package que;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReDAO {
	
	private Connection conn;
	private ResultSet rs;
	public ReDAO() {
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
		String SQL = "select reID from ReText order by reID desc";
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
	public Re getRe(int reID) {
		String SQL = "select * from ReText where reID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, reID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Re q = new Re();
				q.setReID(rs.getInt(1) );
				q.setRenum(rs.getInt(2));
				q.setReUserID(rs.getString(3));
				q.setReText(rs.getString(4));
				q.setReDate(rs.getString(5));
				q.setReAvailable(rs.getInt(6));
				return q;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	public ArrayList<Re> getList(int pageNumber)
	{
		String SQL = "select * from ReText where reID < ? AND reAvailable = 1 order by reID desc limit 10";
		ArrayList<Re> list = new ArrayList<Re>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Re q = new Re();
				q.setReID(rs.getInt(1));
				q.setRenum(rs.getInt(2));
				q.setReUserID(rs.getString(3));
				q.setReText(rs.getString(4));
				q.setReDate(rs.getString(5));
				q.setReAvailable(rs.getInt(6));
				list.add(q);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}	
	public int write(int renum,String reUserID, String reText)
	{
		String SQL = "insert into ReText values (?,?, ?, ?, ?,?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setInt(2, renum);
			pstmt.setString(3, reUserID );
			pstmt.setString(4, reText);
			pstmt.setString(5, getDate() );
			pstmt.setInt(6, 1 );
	
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	public int update(int reID, String reText)
	{
		String SQL = "update ReText set reText=? where reID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, reText);
			pstmt.setInt(2, reID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int delete(int reID)
	{
		String SQL = "update ReText set reAvailable=0 where reID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, reID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
}
