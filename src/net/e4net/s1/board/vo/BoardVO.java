package net.e4net.s1.board.vo;


import lombok.Data;

@Data
public class BoardVO {
	private int boardBno;            // 게시글 번호
    private String boardTitle;       // 게시글 제목
    private String boardContent;     // 게시글 내용
    private String boardWriter;      // 게시글 작성자
    private String boardRegdate;     // 게시글 작성일자 util.Date
    private int boardViewcnt;        // 게시글 조회수
    private int boardReplyCnt;
    private String boardFileName;
    private long boardFileSize;
    
    public void setBoardFileName(String boardFileName) {
		this.boardFileName = boardFileName;
	}
    public String getBoardFileName() {
		return boardFileName;
	}
    
    public void setBoardFileSize(long boardFileSize) {
		this.boardFileSize = boardFileSize;
	}
    public long getBoardFileSize() {
		return boardFileSize;
	}
    
    public int getBoardReplyCnt() {
		return boardReplyCnt;
	}
    public void setBoardReplyCnt(int boardReplyCnt) {
		this.boardReplyCnt = boardReplyCnt;
	}
    // Getter/Setter
    public int getBoardBno() {
        return boardBno;
    }
    public void setBoardBno(int boardBno) {
        this.boardBno = boardBno;
    }
    public String getBoardTitle() {
        return boardTitle;
    }
    public void setBoardTitle(String boardTitle) {
        this.boardTitle = boardTitle;
    }
    public String getBoardContent() {
        return boardContent;
    }
    public void setBoardContent(String boardContent) {
        this.boardContent = boardContent;
    }
    public String getBoardWriter() {
        return boardWriter;
    }
    public void setBoardWriter(String boardWriter) {
        this.boardWriter = boardWriter;
    }
    public String getBoardRegdate() {
        return boardRegdate;
    }
    public void setBoardRegdate(String boardRegdate) {
        this.boardRegdate = boardRegdate;
    }
    public int getBoardViewcnt() {
        return boardViewcnt;
    }
    public void setViewcnt(int boardViewcnt) {
        this.boardViewcnt = boardViewcnt;
    }
    // toString()
    @Override
    public String toString() {
        return "BoardVO [boardBno=" + boardBno + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardWriter=" + boardWriter + ", boardRegdate="
                + boardRegdate + ", boardViewcnt=" + boardViewcnt + ", =" +  "]";
    }
}