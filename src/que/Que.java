package que;

public class Que {
	private int queID;
	private String queTitle;
	private String queUserID;
	private String queDate;
	private String queContent;
	private int queCount;
	private int queAvailable;
	public int getQueID() {
		return queID;
	}
	public void setQueID(int queID) {
		this.queID = queID;
	}
	public String getQueTitle() {
		return queTitle;
	}
	public void setQueTitle(String queTitle) {
		this.queTitle = queTitle;
	}
	public String getQueUserID() {
		return queUserID;
	}
	public void setQueUserID(String queUserID) {
		this.queUserID = queUserID;
	}
	public String getQueDate() {
		return queDate;
	}
	public void setQueDate(String queDate) {
		this.queDate = queDate;
	}
	public String getQueContent() {
		return queContent;
	}
	public void setQueContent(String queContent) {
		this.queContent = queContent;
	}
	public int getQueAvailable() {
		return queAvailable;
	}
	public void setQueAvailable(int queAvailable) {
		this.queAvailable = queAvailable;
	}
	public int getQueCount() {
		return queCount;
	}
	public void setQueCount(int queCount) {
		this.queCount = queCount;
	}
}