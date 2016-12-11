package com.cinema.dao.movie;

import java.util.*;
import org.mybatis.spring.support.*;

public class MovieDAO extends SqlSessionDaoSupport{
	
	//영화 리스트 불러오기
	public List<MovieVO> getmovieList(int type2){
		List<MovieVO> list = getSqlSession().selectList("Mlist",type2);
		return list;
	}
	
	//영화 상세 내용 불러오기
	public MovieVO getmoviedetail(int mNo){
		MovieVO vo = getSqlSession().selectOne("Mdetail",mNo);
		return vo;
	}
	
	//영화 출연 배우 불러오기
	public List<MovieVO> getmoviecharacter(int mNo){
		List<MovieVO> list = getSqlSession().selectList("Mcharacter",mNo);
		return list;
	}
	
	//댓글 출력
	public List<MovieVO> getReplyData(Map map){
		List<MovieVO> replyList=getSqlSession().selectList("MReplyData",map);
		return replyList;
	}
	
	//댓글 삽입
	public void replyInsert(MovieVO vo){
		getSqlSession().insert("replyInsert",vo);
	}
	
	//댓글 총 페이지
	public int replyTotalPage(int mNo){
		int totalpage=getSqlSession().selectOne("replyTotalPage",mNo);
		return totalpage;
	}
	
	//총 댓글 카운트
	public int replyCount(int mNo){
		int count=getSqlSession().selectOne("replyCount",mNo);
		return count;
	}
	
	//댓글 삭제
	public void replyDelete(int reNo){
		getSqlSession().delete("replyDelete",reNo);
	}
	
	//댓글 총평점
	public int replyTotalScore(int mNo){
		int totalScore=getSqlSession().selectOne("replyTotalScore", mNo);
		return totalScore;
	}
	
	//댓글 평점 업데이트
	public void movieLikeUpdate(Map map){
		getSqlSession().update("movieLikeUpdate", map);
	}
	
	//댓글 기록 여부 확인
	public int replyRecordCheck(Map map){
		//해당 영화에 댓글 작성한적 있으면
		int count=getSqlSession().selectOne("replyRecordCheck",map);
		return count;
	}
}
