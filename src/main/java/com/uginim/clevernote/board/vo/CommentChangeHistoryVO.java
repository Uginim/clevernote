package com.uginim.clevernote.board.vo;

import java.sql.Timestamp;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
@Data
public class CommentChangeHistoryVO {
		private static final Logger logger = LoggerFactory.getLogger(CommentChangeHistoryVO.class);
		long postNum; // post별로 조회하기 쉽도록 
		long historyNum; // 변경이력 번호
		long commentNum; // 댓글 번호
		long userNum; // 사용자 번호
		 @Getter @Setter Date createdAt;	// 생성일시		
		String type; // 유형
		
		// 밀리초 받기 위함
		public void setCreatedAt(Timestamp t) {
			long time = t.getTime();
			logger.info("history: "+t.toString() + "\n long:"+time);
			this.createdAt = new Date(time);
		}
}