package com.uginim.clevernote.board.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {
	private long boardNum;  // 게시글 번호
	private String title; // 게시글 제목
	private BoardTypeVO type;
	private long userNum; // 사용자 번호
	private String username; // 사용자 이름
	private String content; // 게시글 내용
	private Date createdAt; // 생성일자
	private Date updatedAt; // 수정일자
	private long hit; // 조회수
	private long boardGroup; // 게시글 그룹
	private int step; // 게시글 단계
	private int indent; // 게시글 깊이
	private boolean hasPicture;
	// 첨부파일
	private List<MultipartFile> files;
}