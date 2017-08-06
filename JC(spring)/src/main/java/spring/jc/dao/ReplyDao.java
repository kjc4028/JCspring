package spring.jc.dao;


import java.util.List;

import spring.jc.dto.ReplyDto;
import spring.jc.util.Criteria;


public interface ReplyDao {

	public List<ReplyDto> replyList(int bno) throws Exception;
	
	public void replyInsert(ReplyDto dto) throws Exception;
	
	public List<ReplyDto> replyListPage(int bno,Criteria cri) throws Exception;
	
	public int totalCnt(int bno) throws Exception;
	
	public void replyDelete(int rno) throws Exception;
	
}
