package user;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import que.Que;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	public ArrayList<UserDTO> getList()
	{
		String SQL = "select * from BBSUser userAvailable = 1 order by userID desc limit 10";
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				UserDTO q = new UserDTO();
				q.setUserID(rs.getString(1));
				q.setUserPassword(rs.getString(2));
				q.setUserName(rs.getString(3));
				q.setUserGender(rs.getString(4));
				q.setUserEmail(rs.getString(5));
				q.setUserAvailable(rs.getInt(6));
				list.add(q);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}	
	public int login(String userID, String userPassword)
	{
		String SQL = "select userPassword,userAvailable From BBSUser where userID =?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			if( rs.next())
			{
				UserDTO u =new UserDTO();
				if(rs.getInt(2)==0)
					return 2;
				else if(rs.getString(1).equals(userPassword))
					return 1; //login success
				else
					return 0; //password error
			}
			return -1; //id not exist
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -2; //db error
	}
	
	public int join(UserDTO user)
	{
		String SQL = "insert into BBSUser values (?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPassword());
			pstmt.setString(3,user.getUserName());
			pstmt.setString(4,user.getUserGender());
			pstmt.setString(5,user.getUserEmail());
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
	
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1; //db error
	}
	public UserDTO getBbs(String userID) {
		String SQL = "select * from BBSUser where userID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				UserDTO q = new UserDTO();
				q.setUserID(rs.getString(1));
				q.setUserPassword(rs.getString(2));
				q.setUserName(rs.getString(3));
				q.setUserGender(rs.getString(4));
				q.setUserEmail(rs.getString(5));
				return q;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	public int update(String userID , String userPassword, String userName,String userGender,String userEmail)
	{
		String SQL = "update BBSUser set userPassword=?,userName=?,userGender=?,userEmail=? where userID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userPassword);
			pstmt.setString(2,userName);
			pstmt.setString(3,userGender);
			pstmt.setString(4,userEmail);
			pstmt.setString(5,userID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	public int reupdate(String userID , String userPassword, String userName,String userGender,String userEmail)
	{
		String SQL = "update BBSUser set userPassword=?,userName=?,userGender=?,userEmail=?,userAvailable=? where userID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userPassword);
			pstmt.setString(2,userName);
			pstmt.setString(3,userGender);
			pstmt.setString(4,userEmail);
			pstmt.setInt(5, 1);
			pstmt.setString(6,userID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
	public int delete(String userID)
	{
		String SQL = "update BBSUser set userAvailable=0 where userID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID );
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
	}
}
