package com.oracle.choongangGroup.hs.lecManagement;

import java.util.List;

public interface LecManagementDao {

	List<LectureVO> listLec(LectureVO lectureVO);

	int lecTot();

	LectureVO lecDetail(Long lec_id);

}
