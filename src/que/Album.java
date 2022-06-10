package que;

import java.io.InputStream;

public class Album {
	private int albumId;
	private String albumUserID;
	private String albumText;
	private String albumFileName;
	private InputStream albumData;
	private int albumAvailable;
	public int getAlbumId() {
		return albumId;
	}
	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}
	public String getAlbumText() {
		return albumText;
	}
	public void setAlbumText(String albumText) {
		this.albumText = albumText;
	}
	public String getAlbumFileName() {
		return albumFileName;
	}
	public void setAlbumFileName(String albumFileName) {
		this.albumFileName = albumFileName;
	}
	public InputStream getAlbumData() {
		return albumData;
	}
	public void setAlbumData(InputStream albumData) {
		this.albumData = albumData;
	}
	public int getAlbumAvailable() {
		return albumAvailable;
	}
	public void setAlbumAvailable(int albumAvailable) {
		this.albumAvailable = albumAvailable;
	}
	public String getAlbumUserID() {
		return albumUserID;
	}
	public void setAlbumUserID(String albumUserID) {
		this.albumUserID = albumUserID;
	}
}
