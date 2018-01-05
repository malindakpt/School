package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


//School Management Starts
@Controller
@RequestMapping("/Home")
public class PageController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
        return "Home";
	}
}

@Controller
@RequestMapping("/PageListStudents")
class ListStudentsController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/listStudents";
	}
}


@Controller
@RequestMapping("/")
class PageLoginController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		return "widgets/loginWindow";
	}
}


@Controller
@RequestMapping("/PageListSubjects")
class ListSubjectsController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/listSubjects";
	}
}
@Controller
@RequestMapping("/listStudentsWithClassFilter")
class CompListStudentsWithClassFilterController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "components/listStudentsWithClassFilter";
	}
}
@Controller
@RequestMapping("/PageListTeachers")
class ListTeachersController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/listTeachers";
	}
}
@Controller
@RequestMapping("/PageAddStudent")
class PageAddStudentController {
    @RequestMapping(method = RequestMethod.POST)
    public String printWelcome(ModelMap model) {
        return "widgets/addStudent";
    }
}

@Controller
@RequestMapping("/PageEditStudent")
class PageEditStudentController {
    @RequestMapping(method = RequestMethod.POST)
    public String printWelcome(ModelMap model) {
        return "widgets/editStudent";
    }
}

@Controller
@RequestMapping("/PageEditTeacher")
class PageEditTeacherController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/editTeacher";
	}
}
@Controller
@RequestMapping("/PageAddTeacher")
class PageAddTeacherController {
    @RequestMapping(method = RequestMethod.POST)
    public String printWelcome(ModelMap model) {
        return "widgets/addTeacher";
    }
}

@Controller
@RequestMapping("/PageEditCourse")
class PageEditCourseController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/editCourse";
	}
}

@Controller
@RequestMapping("/PageAddSubject")
class PageAddSubjectController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/addSubject";
	}
}

@Controller
@RequestMapping("/PageEditSubject")
class PageEditSubjectController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/editSubject";
	}
}

@Controller
@RequestMapping("/PageSubjectTeacher")
class PageSubjectTeacherController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/subjectTeacher";
	}
}



@Controller
@RequestMapping("/PageAddMarks")
class PageAddMarksController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/ZZaddMarks";
	}
}

@Controller
@RequestMapping("/PageAnalize")
class PageAnalizeController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/analize";
	}
}

@Controller
@RequestMapping("/PageRateStudent")
class PageRateStudentController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/rateStudent";
	}
}


@Controller
@RequestMapping("/PageReportCard")
class PageReportCaardController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/reportCard";
	}
}

@Controller
@RequestMapping("/PageReportCardSelector")
class PageReportCaardSelectorController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/reportCardSelector";
	}
}


@Controller
@RequestMapping("/PageAddClassRoom")
class PageAddClassRoomController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/addClassRoom";
	}
}

@Controller
@RequestMapping("/PageListStudents4Teacher")
class PageListStudents4TeacherController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/listStudents4Teacher";
	}
}


@Controller
@RequestMapping("/PageAddCourse")
class PageAddCourseController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/addCourse";
	}
}

@Controller
@RequestMapping("/PageAddExam")
class PageAddExam {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/addExam";
	}
}

@Controller
@RequestMapping("/PageStudentDashBoard")
class PageDashBoardController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/dashBoad";
	}
}

@Controller
@RequestMapping("/PageMarkAttendance")
class PageMarkAttendanceController {
    @RequestMapping(method = RequestMethod.POST)
    public String printWelcome(ModelMap model) {
        return "widgets/markAttendance";
    }
}


@Controller
@RequestMapping("/PageTeacherDashBoard")
class PageTeacherDashBoardController {
    @RequestMapping(method = RequestMethod.POST)
    public String printWelcome(ModelMap model) {
        return "widgets/dashBoardTeacher";
    }
}

@Controller
@RequestMapping("/PageTimeTable")
class PageTimeTableController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/timeTable";
	}
}

@Controller
@RequestMapping("/PageLibraryManagement")
class PageLibraryManagementController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/libraryManagement";
	}
}


@Controller
@RequestMapping("/PageAddClassStudents")
class PageAddClassStudentsController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/addClassStudents";
	}
}

@Controller
@RequestMapping("/PageAddExamMarks")
class PageAddExamMarksController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/addExamMarks";
	}
}

@Controller
@RequestMapping("/CompSubjectList")
class CompSubjectListController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "components/subjectList";
	}
}

@Controller
@RequestMapping("/Profile")
class ProfileController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/profile";
	}
}

@Controller
@RequestMapping("/PageCoursesList")
class PageCoursesListController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/listCourses";
	}
}



@Controller
@RequestMapping("/CompSubjectSelector4Course")
class CompSubjectSelector4CourseController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "components/subjectSelector4Course";
	}
}


@Controller
@RequestMapping("/CompStudentsInClass")
class CompStudentsInClassController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "components/studentsInClass";
	}
}

@Controller
@RequestMapping("/CompStudentsInClass2")
class CompStudentsInClass2Controller {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "components/studentsInClass2";
	}
}

@Controller
@RequestMapping("/CompClassRoomSelectorForCourse")
class CompClassRoomSelectorForCourseController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "components/classRoomSelectorForCourse";
	}
}

@Controller
@RequestMapping("/CompStudentsInClassWithInput")
class CompStudentsInClassWithInputController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "components/studentsInClassWithInput";
	}
}

@Controller
@RequestMapping("/CompCourseList")
class CompCourseListController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "components/courseList";
	}
}


@Controller
@RequestMapping("/PageEditClassRoom")
class PageEditClassRoomController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/editClassRoom";
	}
}


@Controller
@RequestMapping("/CompSubjectCheckList")
class SubjectCheckListController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "components/subjectCheckList";
	}
}
//School Management End


@Controller
@RequestMapping("/PageListStudentsMarks")
class PageListStudentsMarksController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/listStudentsMarks";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome2(ModelMap model) {
		return "widgets/listStudentsMarks";
	}
}

@Controller
@RequestMapping("/PageStudentView")
class StudentViewController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/studentView";
	}
}
