package net.e4net.s1.board.vo;

public class MemberVO {
	private String memberId;
    private String memberPw;
    private String memberName; 
    private String memberEmail; 
    private String memberRegdate; // java.sql.Date
    
    public String getMemberId() {
        return memberId;
    }
    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }
    public String getMemberPw() {
        return memberPw;
    }
    public void setMemberPw(String memberPw) {
        this.memberPw = memberPw;
    }
    public String getMemberName() {
        return memberName;
    }
    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }
    public String getMemberEmail() {
        return memberEmail;
    }
    public void setMemberEmail(String memberEmail) {
        this.memberEmail = memberEmail;
    }
    public String getMemberRegdate() {
        return memberRegdate;
    }
    public void setMemberRegdate(String memberRegdate) {
        this.memberRegdate = memberRegdate;
    }
    @Override
    public String toString() {
        return "MemberVO [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName + ", memberEmail="
                + memberEmail + ", memberRegdate=" + memberRegdate  + "]";
    }
}