package que;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;

public class AlbumDAO {
	private Connection conn;

	private ResultSet rs;
	
	public AlbumDAO() {
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
	
	
	public int getNext()
	{
		String SQL = "select albumId from album order by albumId desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 1; //db error
	}
	
	public int write(String userID,String albumText, String albumFileName) 
	{
	
		File albumFile = new File(albumFileName);
		FileInputStream fin = null;
		try {
			fin = new FileInputStream(albumFile);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String SQL = "insert into album values (?,?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() );
			pstmt.setString(2, userID );
			if( fin != null ) pstmt.setBinaryStream(3, fin, (int)albumFile.length() );
			pstmt.setString(4, albumText );
			pstmt.setInt(5, 1);
	
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public Album getAlbum(int albumId) {
		String SQL = "select * from album where albumId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, albumId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Album bbs = new Album();
				bbs.setAlbumId(rs.getInt(1) );
				bbs.setAlbumUserID(rs.getString(2));
				bbs.setAlbumData(rs.getBinaryStream(3));
				bbs.setAlbumText(rs.getString(4));
				bbs.setAlbumAvailable(rs.getInt(5));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}

	public ArrayList<Album> getList(int pageNumber)
	{
		String SQL = "select * from album where albumId < ? AND albumAvailable = 1 order by albumId desc limit 10";
		ArrayList<Album> list = new ArrayList<Album>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Album bbs = new Album();
				bbs.setAlbumId(rs.getInt(1) );
				bbs.setAlbumUserID(rs.getString(2));
				bbs.setAlbumData(rs.getBinaryStream(3));
				bbs.setAlbumText(rs.getString(4));
				bbs.setAlbumAvailable(rs.getInt(5));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}

	public boolean nextPage(int pageNumber)
	{
		String SQL = "select * from album where albumId < ? AND albumAvailable = 1 order by albumId desc limit 10";
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
	public int update(int albumId, String albumText)
	{
		String SQL = "update album set albumText=? where albumId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, albumText );
			pstmt.setInt(2, albumId );
			
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int update(int albumId, String albumText, String albumFileName)
	{
		File albumFile = new File(albumFileName);
		FileInputStream fin = null;
		try {
			fin = new FileInputStream(albumFile);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return 2;
		}
		
		String SQL = "update album set albumText=?, albumFile=? where albumId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, albumText );
			if( fin != null ) pstmt.setBinaryStream(2, fin, (int)albumFile.length() );
			pstmt.setInt(3, albumId );
			
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	
	public int delete(int albumId)
	{
		String SQL = "update album set albumAvailable=0 where albumId=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, albumId );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
}
