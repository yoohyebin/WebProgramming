package que;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NoticeDAO {
	private Connection conn;

	private ResultSet rs;
	
	public NoticeDAO() {
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
		String SQL = "select noticeID from notice order by noticeID desc";
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
	
	public ArrayList<Notice> getList(int pageNumber)
	{
		String SQL = "select * from notice where noticeID < ? AND noticeAvailable = 1 order by noticeID desc limit 10";
		ArrayList<Notice> list = new ArrayList<Notice>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Notice n = new Notice();
				n.setNoticeID(rs.getInt(1) );
				n.setNoticeTitle(rs.getString(2));
				n.setNoticeUserID(rs.getString(3));
				n.setNoticeDate(rs.getString(4));
				n.setNoticeContent(rs.getString(5));
				n.setNoticeCount(rs.getInt(6));
				n.setNoticeAvailable(rs.getInt(7));
				list.add(n);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}	
	
	public int write(String noticeTitle, String noticeUserID, String noticeContent,int noticeCount)
	{
		String SQL = "insert into notice values (?, ?, ?, ?, ?, ?,?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, noticeTitle );
			pstmt.setString(3, noticeUserID );
			pstmt.setString(4, getDate() );
			pstmt.setString(5, noticeContent );
			pstmt.setInt(6, noticeCount );
			pstmt.setInt(7, 1 );
	
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
		
	public boolean nextPage(int pageNumber)
	{
		String SQL = "select * from notice where noticeID < ? AND noticeAvailable = 1 order by noticeID desc limit 10";
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
	
	public Notice getNotice(int noticeID) {
		String SQL = "select * from notice where noticeID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, noticeID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Notice n = new Notice();
				n.setNoticeID(rs.getInt(1) );
				n.setNoticeTitle(rs.getString(2));
				n.setNoticeUserID(rs.getString(3));
				n.setNoticeDate(rs.getString(4));
				n.setNoticeContent(rs.getString(5));
				n.setNoticeCount(rs.getInt(6));
				n.setNoticeAvailable(rs.getInt(7));
				return n;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	public int update(int noticeID, String noticeTitle, String noticeContent)
	{
		String SQL = "update notice set noticeTitle=?, noticeContent=? where noticeID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, noticeTitle );
			pstmt.setString(2, noticeContent );
			pstmt.setInt(3, noticeID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	public int count(int noticeID)
	{
		String SQL = "update notice set noticeCount=noticeCount+1 where noticeID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, noticeID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int noticeID)
	{
		String SQL = "update notice set noticeAvailable=0 where noticeID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, noticeID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
}
