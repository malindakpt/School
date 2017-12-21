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
        return "widgets/addMember";
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

//@Controller
//@RequestMapping("/PageReportCard")
//class PageReporController {
//	@RequestMapping(method = RequestMethod.POST)
//	public String printWelcome(ModelMap model) {
//		return "widgets/reportCard";
//	}
//}

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
@RequestMapping("/PageCoursesList")
class PageCoursesListController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/listCourses";
	}
}

@Controller
@RequestMapping("/CompSubjectListInRegistration")
class CompSubjectListInRegistrationController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "components/subjectListInRegistration";
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
@RequestMapping("/PageRegisterStudent")
class RegisterStudentController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/registerStudent";
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

//@Controller
//@RequestMapping("/PageListStudentsMarks22")
//class LoadItemController {
//	@RequestMapping(method = RequestMethod.GET)
//	@ResponseBody
//	ModelAndView printWelcome(@RequestParam("classRoomId") String classRoomId, ModelMap  model) {
//		{
//			ModelAndView modelAndview = null;
//
//			model.addAttribute("asd","asd");
//			try {
//				modelAndview = new ModelAndView("widgets/listStudentsMarks");
//				model.addAttribute("job",classRoomId);
//			} catch (IndexOutOfBoundsException e) {
//			}
//			return modelAndview;
//		}
//	}
//
//
//}