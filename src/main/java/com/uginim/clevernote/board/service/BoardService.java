package com.uginim.clevernote.board.service;

import java.util.List;
import java.util.Map;

import com.uginim.clevernote.board.util.PageManager;
import com.uginim.clevernote.board.vo.AttachmentFileVO;
import com.uginim.clevernote.board.vo.BoardTypeVO;
import com.uginim.clevernote.board.vo.BoardPostVO;

public interface BoardService {
	
	// 게시판 분류 읽어오기
	List<BoardTypeVO>  getAllBoardTypes();
	
	// 게시글 작성
	int write(BoardPostVO board);
	
	// 게시글 수정
	int modify(BoardPostVO board);

	// 게시글 삭제
	int delete(long postNum);
	
	// 첨부파일 1개 삭제
	int deleteAttachment(long attachmentNum);
	
	// 첨부파일 1개 수정
	int modifyAttachment(AttachmentFileVO attachment);
	
	// 게시글 읽기
	Map<String,Object> view(long postNum);
	
	// 게시글 목록
	List<BoardPostVO> list(int curPage, String searchType, String keyword);
	
	// 페이지 관리자 만들기
	PageManager buildPageCriteria(int curPage, String searchType, String keyword);
	
	// 게시글 답글 작성
	int reply(BoardPostVO replyBoard);
	// 첨부파일 가져오기
	AttachmentFileVO viewFile(long attachmentNum);
}
