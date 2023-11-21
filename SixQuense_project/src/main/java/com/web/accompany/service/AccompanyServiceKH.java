package com.web.accompany.service;

import static com.web.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.web.accompany.model.dao.AccompanyDAOKH;
import com.web.accompany.model.dto.AccompanyComment;
import com.web.accompany.model.dto.AccompanyDTO;
import com.web.common.JDBCTemplate;

public class AccompanyServiceKH {
		private AccompanyDAOKH dao=new AccompanyDAOKH();
		
		public List<AccompanyDTO> selectAccompanyAll(){
			Connection conn=getConnection();
			List<AccompanyDTO> a=dao.selectBoardAll(conn);
			if(a!=null) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return	a;
		}
		
		public int insertAccompany(AccompanyDTO a, String nation, String userId) {
			Connection conn=getConnection();
			int result=dao.insertAccompany(conn, a, nation, userId);
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
			
		}
		
		
		public List<AccompanyDTO> selectAccompanyByPopularity(){
			Connection conn=getConnection();
			List<AccompanyDTO> a=dao.selectAccompanyByPopularity(conn);
			if(a!=null) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return	a;
		}
		
		public List<AccompanyDTO>  selectAccompanyByCoordinate(String coordinate){
			Connection conn=getConnection();
			List<AccompanyDTO> a=dao.selectAccompanyByCoordinate(conn, coordinate);
			if(a!=null) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return	a;
		}
		
		public List<AccompanyDTO> selectAccompanyByCoordinatePopularity(String coordinate){
			Connection conn=getConnection();
			List<AccompanyDTO> a=dao.selectAccompanyByCoordinatePopularity(conn, coordinate);
			if(a!=null) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return	a;
		}
		
		public List<AccompanyDTO> ModifyAccompany(int memberNo, int accompanyNo) {
			Connection conn=getConnection();
			List<AccompanyDTO> a=dao.ModifyAccompany(conn, memberNo, accompanyNo);
			if(a!=null) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return	a;
		}
		
		public int ModifyAccompanyUpdate(AccompanyDTO a, String nation, int memberNo) {
			Connection conn=getConnection();
			int result=dao.ModifyAccompanyUpdate(conn, a, nation, memberNo);
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
			
		}
		
		public int DeleteAccompany(int AccompanyNo, int memberNo) {
			Connection conn=getConnection();
			int result=dao.DeleteAccompany(conn, AccompanyNo, memberNo);
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		}
		
		public List<AccompanyDTO> selectAccompanyByMemberNo(int memberNo){
			Connection conn=getConnection();
			List<AccompanyDTO> a=dao.selectAccompanyByMemberNo(conn, memberNo);
			if(a!=null) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return	a;
		}
		}