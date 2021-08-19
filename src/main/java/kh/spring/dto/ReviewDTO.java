package kh.spring.dto;

import java.sql.Date;

public class ReviewDTO {
	private int seq;
	private String id;
	private String reviewID;
	private int parentseq;
	private String contents;
	private String reviewable;
	private Date Regdate;

	public ReviewDTO() {
	}
	
	public ReviewDTO(int seq, String id, String reviewID, int parentseq, String contents, String reviewable, Date regdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.reviewID = reviewID;
		this.parentseq = parentseq;
		this.contents = contents;
		this.reviewable = reviewable;
		Regdate = regdate;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReviewID() {
		return reviewID;
	}
	public void setReviewID(String reviewID) {
		this.reviewID = reviewID;
	}
	public int getParentseq() {
		return parentseq;
	}

	public void setParentseq(int parentseq) {
		this.parentseq = parentseq;
	}

	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getReviewable() {
		return reviewable;
	}

	public void setReviewable(String reviewable) {
		this.reviewable = reviewable;
	}

	public Date getRegdate() {
		return Regdate;
	}

	public void setRegdate(Date regdate) {
		Regdate = regdate;
	}
}
