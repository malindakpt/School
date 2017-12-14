package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


//School Management Starts
@Controller
@RequestMapping("/")
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
@RequestMapping("/PageListSubjects")
class ListSubjectsController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/listSubjects";
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
		return "widgets/addMarks";
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
@RequestMapping("/PageAddClassStudents")
class PageAddClassStudentsController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/addClassStudents";
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

@Controller
@RequestMapping("/PageListStudentsMarks22")
class LoadItemController {
	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	ModelAndView printWelcome(@RequestParam("classRoomId") String classRoomId, ModelMap  model) {
		{
			ModelAndView modelAndview = null;

			model.addAttribute("asd","asd");
			try {
				modelAndview = new ModelAndView("widgets/listStudentsMarks");
				model.addAttribute("job",classRoomId);
			} catch (IndexOutOfBoundsException e) {
			}
			return modelAndview;
		}
	}


}