package net.e4net.s1.board.vo;

import lombok.Data;
import net.e4net.eiwaf.web.util.page.PageVO;

@Data
public class ReplyVO extends PageVO {
    private Integer replyRno;        // 댓글 번호
    private Integer replyBno;        // 게시글 번호
    private String replyText;    // 댓글 내용
    private String replyer;        // 댓글 작성자
    private String replyName;    // 댓글 작성자의 이름(회원의 이름)
    private String replyRegdate;        // 댓글 작성일자
    private String rownum;
    
    // Getter/Setter
    public Integer getReplyRno() {
        return replyRno;
    }
    public void setReplyRno(Integer replyRno) {
        this.replyRno = replyRno;
    }
    public Integer getReplyBno() {
        return replyBno;
    }
    public void setReplyBno(Integer replyBno) {
        this.replyBno = replyBno;
    }
    public String getReplyText() {
        return replyText;
    }
    public void setReplyText(String replyText) {
        this.replyText = replyText;
    }
    public String getReplyer() {
        return replyer;
    }
    public void setReplyer(String replyer) {
        this.replyer = replyer;
    }
    public String gerReplyName() {
        return replyName;
    }
    public void setReplyName(String replyName) {
        this.replyName = replyName;
    }
    public String getReplyRegdate() {
        return replyRegdate;
    }
    public void setReplyRegdate(String replyRegdate) {
        this.replyRegdate = replyRegdate;
    }
    public String getRownum() {
		return rownum;
	}
    public void setRownum(String rownum) {
		this.rownum = rownum;
	}
    
    // toString()
    @Override
    public String toString() {
        return "ReplyVO [replyRno=" + replyRno + ", replyBno=" + replyBno + ", replyText=" + replyText + ", replyer=" + replyer
                + ", replyName=" + replyName + ", replyRegdate=" + replyRegdate +  "]";
    }
    
    
}