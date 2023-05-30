package dao;

import java.sql.*;
import java.util.*;

import util.DBUtil;
import vo.Subject;

public class SubjectDao {
	//여러 패키지에서 공통으로 사용할 db코드는 다른 매소드로 - util
	//모델뷰 
	// 1) 과목 목록
	public ArrayList<Subject> selectSubjectListByPage(int startRow, int rowPerPage) throws Exception {
		//쿼리
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement listStmt = conn.prepareStatement(
				"SELECT subject_no subjectNo,subject_name subjectName, subject_time subjectTime, createdate, updatedate FROM subject LIMIT ?, ?"
		);
		listStmt.setInt(1, startRow);
		listStmt.setInt(2, rowPerPage);
		ResultSet listRs= listStmt.executeQuery();
		
		//ArrayList
		ArrayList<Subject> list = new ArrayList<>();
		while(listRs.next()) {
			Subject s = new Subject();
			s.setSubjectNo(listRs.getInt("subjectNo"));
			s.setSubdjectName(listRs.getString("subjectName"));
			s.setSubjectTime(listRs.getInt("subjectTime"));
			s.setCreatedate(listRs.getString("createdate"));
			s.setUpdatedate(listRs.getString("updatedate"));
			list.add(s);
		}
				
		return list;
	}
	// 2) 과목 추가
	public int insertSubject(Subject subject) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement insertStmt = conn.prepareStatement(
				"INSERT INTO subject(subject_name, subject_time, createdate, updatedate) VALUES(?, ?, now(), now())"
		);
		insertStmt.setString(1, subject.getSubdjectName());
		insertStmt.setInt(2, subject.getSubjectTime());
		
		row = insertStmt.executeUpdate();
		
		return row;
	}
	// 3) 과목 삭제 
	public int deleteSubejct(int subjectNo) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement deleteStmt = conn.prepareStatement(
				"DELETE FROM subject WHERE subject_no = ?"
		);
		deleteStmt.setInt(1, subjectNo);
		
		row = deleteStmt.executeUpdate();
		
		return row;
	}
	// 4) 과목 수정
	public int updateSubject(Subject subject) throws Exception {
		int row = 0;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement updateStmt = conn.prepareStatement(
				"UPDATE subject SET subject_name = ?, subject_time = ?, updatedate = now() WHERE subject_no = ?"
		);
		updateStmt.setString(1, subject.getSubdjectName());
		updateStmt.setInt(2, subject.getSubjectTime());
		updateStmt.setInt(3, subject.getSubjectNo());
				
		row = updateStmt.executeUpdate();
		
		return row;
	}
	// 5) 과목 상세
	public Subject selectSubjectOne(int subjectNo) throws Exception {
		Subject subject = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement selectStmt = conn.prepareStatement(
				"SELECT subject_no subjectNo, subject_name subjectName, subject_time subjectTime, createdate, updatedate FROM subject WHERE subject_no = ?"
		);
		selectStmt.setInt(1, subjectNo);
		
		ResultSet selectRs= selectStmt.executeQuery();
		
		//ArrayList
		if(selectRs.next()) {
			subject = new Subject();
			subject.setSubjectNo(selectRs.getInt("subjectNo"));
			subject.setSubdjectName(selectRs.getString("subjectName"));
			subject.setSubjectTime(selectRs.getInt("subjectTime"));
			subject.setCreatedate(selectRs.getString("createdate"));
			subject.setUpdatedate(selectRs.getString("updatedate"));
		}
						
		return subject;
	}
	// 6) 전체 과목 수(행)
	public int selcetSubjectCnt() throws Exception {
		int row  = 0; //반환타입
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement cntStmt = conn.prepareStatement(
				"SELECT COUNT(*) FROM subject"); // COUNT(*)라는 컬럼 생성
		ResultSet cntRs= cntStmt.executeQuery();
		if(cntRs.next()) {
			row = cntRs.getInt("COUNT(*)");
		}
		return row;
	}
}	
