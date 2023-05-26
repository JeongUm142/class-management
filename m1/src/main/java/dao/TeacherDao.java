package dao;

import java.sql.*;
import java.util.*;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import util.DBUtil;
import vo.*;
public class TeacherDao {
/*
 issue : 교과목 연결되지 않은 강사는 출력되지 않으니 outer로 변경. inner join > outer join 변경
select t.teacher_no, t.teacher_id, t.teacher_name, 
		ts.subject_no, group_concat(s.subject_name)
from teacher t left outer join teacher_subject ts
				on t.teacher_no = ts.teacher_no
						left outer join subject s
							on ts.subject_no = s.subject_no
group by t.teacher_no, t.teacher_id, t.teacher_name
limit 0,10;
 */
	public ArrayList<HashMap<String, Object>> selectTeacherListByPage(int beginRow, int rowPerPage) throws Exception {
	//쿼리
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement selectstmt = conn.prepareStatement(
				"SELECT t.teacher_no 강사번호, t.teacher_id 강사아이디, t.teacher_name 이름, ts.subject_no ts과목번호, IFNULL(GROUP_CONCAT(s.subject_name), \"담당과목 없음\") 과목명 FROM teacher t LEFT OUTER JOIN teacher_subject ts ON t.teacher_no = ts.teacher_no LEFT OUTER JOIN subject s ON ts.subject_no = s.subject_no GROUP BY t.teacher_no, t.teacher_id, t.teacher_name LIMIT ?, ?;"
		);
		selectstmt.setInt(1, beginRow);
		selectstmt.setInt(2, rowPerPage);
		ResultSet selectRs = selectstmt.executeQuery();
		
		ArrayList<HashMap<String, Object>> selectlist = new ArrayList<HashMap<String, Object>>();
		while(selectRs.next()){
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("강사번호", selectRs.getInt("강사번호"));
			map.put("강사아이디", selectRs.getString("강사아이디"));
			map.put("이름", selectRs.getString("이름"));
			map.put("과목명", selectRs.getString("과목명"));
			
			selectlist.add(map);
		}
		
		return selectlist;
	}
	public int totalCnt() throws Exception {
		int row = 0;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		PreparedStatement totalStmt = conn.prepareStatement(
				"SELECT COUNT(*) FROM teacher"
		);
		ResultSet totalRs = totalStmt.executeQuery();
		if(totalRs.next()) {
			row = totalRs.getInt("COUNT(*)");
		}
		return row;
	}
	
	//강사 1명 상세보기
	public Teacher selectTeacherOne(int teacherNo) {
		return null;
	}
	
	//수정 
	public int updateTeacher(Teacher teacher) {
		return 0;
	}
	
	//삭제
	public int delecteTeacher(int teacherNo) {
		return 0;
	}
	
}
