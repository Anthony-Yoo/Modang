package com.modang.vo;

public class BDCommentVo {

	private int commentNo;
	private int boardNo;
	private int userNo;
	private String writeDate;
	private String content;
	private int groupNo;
	private int groupOrder;
	private int depth;
	private String nick;
	private String id;
	private String profileImage;		/*프로필이미지명*/
	
	
	public BDCommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BDCommentVo(int commentNo, int boardNo, int userNo, String writeDate, String content, int groupNo,
			int groupOrder, int depth, String nick, String id, String profileImage) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.writeDate = writeDate;
		this.content = content;
		this.groupNo = groupNo;
		this.groupOrder = groupOrder;
		this.depth = depth;
		this.nick = nick;
		this.id = id;
		this.profileImage = profileImage;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getGroupOrder() {
		return groupOrder;
	}

	public void setGroupOrder(int groupOrder) {
		this.groupOrder = groupOrder;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	@Override
	public String toString() {
		return "BDCommentVo [commentNo=" + commentNo + ", boardNo=" + boardNo + ", userNo=" + userNo + ", writeDate="
				+ writeDate + ", content=" + content + ", groupNo=" + groupNo + ", groupOrder=" + groupOrder
				+ ", depth=" + depth + ", nick=" + nick + ", id=" + id + ", profileImage=" + profileImage + "]";
	}
}
