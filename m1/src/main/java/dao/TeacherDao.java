package dao;

import java.util.*;

public class TeacherDao {
/*
select t.teacher_no, t.teacher_id, t.teacher_name, 
		ts.subject_no, group_concat(s.subject_name)
from teacher t inner join teacher_subject ts
				on t.teacher_no = ts.teacher_no
						inner join subject s
							on ts.subject_no = s.subject_no
group by t.teacher_no, t.teacher_id, t.teacher_name
limit 0,10;
 */
	public ArrayList<HashMap<String, Object>> selectTeacherListByPage(int beginRow, int rowPerPage) {
		return null;
	}
}
