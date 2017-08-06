package spring.jc.service;

import java.util.List;

import spring.jc.dto.BoardDto;
import spring.jc.util.Criteria;

public interface BoardService {

	public List<BoardDto> boardAllList(Criteria cri) throws Exception;
	
	public BoardDto bbsContent(String num) throws Exception;
	
	public void bbsInsert(BoardDto dto) throws Exception;
	
	public int totalBBS() throws Exception;
	
	public void deleteBBS(int num)	throws Exception;
	
	public void updateBBS(BoardDto dto) throws Exception;
	
	public void readcnt(int num) throws Exception;
	
	public int nextNum() throws Exception;
	
	public void replyshare(int re_level, int re_renum) throws Exception;
	
	public List<BoardDto> searchBBS(String word) throws Exception;




}
