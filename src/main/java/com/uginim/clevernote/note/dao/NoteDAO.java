package com.uginim.clevernote.note.dao;

import java.util.List;

import com.uginim.clevernote.note.vo.CategoryVO;
import com.uginim.clevernote.note.vo.NoteVO;
/**
 * 
 * @author Hyeonuk
 *
 */
public interface NoteDAO {

	
	/* Create */
	/**
	 * 새 노트 추가
	 * @param noteVO 
	 * 			categorynum: not null
	 * 		 	title: (default "No title")
	 * 			content: (default "" blank) 			  
	 * @return 성공시 1
	 */
	int insert(NoteVO noteVO);
	
	/* Read */
	/**
	 * 노트를 검색한다.
	 * @param keyword 검색할 키워드
	 * @return 검색결과 노트 리스트
	 */
	List<NoteVO> searchNotes(String keyword,long userNum);
	
	/**
	 * 노트를 검색한다.
	 * @param keyword 검색할 키워드
	 * @param categoryNum 검색할 카데고리
	 * @return 검색결과 노트 리스트
	 */
	List<NoteVO> searchNotes(String keyword,long userNum,long categoryNum);
	
	/**
	 * 노트를 검색한다.
	 * @param keyword 검색할 키워드
	 * @param categoryNum 검색할 카데고리
	 * @param hasContent 컨텐츠 포함 여부
	 * @return 검색결과 노트 리스트
	 */
	List<NoteVO> searchNotes(String keyword,long userNum,long categoryNum, boolean hasContent);
	
	/** 
	 * 특정 카데고리의 노트를 리스트로 가져온다
	 * @param categorynum 노트가 속한 카데고리
	 * @return 노트 리스트
	 */
	List<NoteVO> getAllNoteFromCategory(long categoryNum);

	/**
	 * 특정 카데고리의 노트를 리스트로 가져온다
	 * @param categorynum 노트가 속한 카데고리
	 * @param hasContent 콘텐츠 포함 여부
	 * @return 노트 리스트
	 */
	List<NoteVO> getAllNoteFromCategory(long categoryNum, boolean hasContent);
	
	/**
	 * 특정 노트를 가져온다.
	 * @param notenum 가져올 노트의 노트번호
	 * @return 노트객체
	 */
	NoteVO getNote(long notenum);

	/**
	 * 특정 태그로 노트 가져오기 
	 * @param tagNum 태그 번호
	 * @return 해당 태그를 사용하는 노트 리스트
	 */
	List<NoteVO> selectNotesByTag(long tagNum);
	
	/**
	 * 특정 태그로 사용자의 노트 가져오기
	 * @param tagNum 태그 번호
	 * @param userNum 유저 번호
	 * @return 해당 태그를 사용하는 유저의 노트 리스트 
	 */
	List<NoteVO> selectNotesByTag(long tagNum, long userNum);
	
	
	/* Update */
	/**
	 * 노트 수정 
	 * @param noteVO notenum이 가르키는 record의 데이터를 대체함
	 * @return 성공시 1
	 */
	int modify(NoteVO noteVO);
	
	
	
	/* Delete */
	/**
	 * 노트 삭제
	 * @param notenum 삭제할 노트의 노트번호
	 * @return 성공시 1
	 */
	int delete(long notenum);
	
	
}
