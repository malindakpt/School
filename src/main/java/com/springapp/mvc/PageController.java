package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

//School Management End

@Controller
 @RequestMapping("/CreateAdView")
 class CreateAdViewController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("message", "Hello world!");
		return "CreateAd";
	}
}

@Controller
@RequestMapping("/CreateUserView")
class CreateUserController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("message", "Hello world!");
		return "CreateUser";
	}
}
@Controller
@RequestMapping("/Notification")
class NotificationController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("message", "Hello world!");
		return "Notification";
	}
}

@Controller
@RequestMapping("/loadItem")
class LoadItemController {
	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	ModelAndView printWelcomebyParameter(@RequestParam("vID") String id) {
		{

			ModelAndView modelAndview = null;
			try {
				modelAndview = new ModelAndView("ViewVehicle");
			} catch (IndexOutOfBoundsException e) {
			}
			return modelAndview;
		}
	}
}