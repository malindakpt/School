package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
class HomeController {
	@RequestMapping(method = RequestMethod.POST)
	public String printWelcome(ModelMap model) {
		return "widgets/ListStudents";
	}
}

@Controller
@RequestMapping("/PageAddStudent")
class AddVehicleController {
    @RequestMapping(method = RequestMethod.POST)
    public String printWelcome(ModelMap model) {
        return "widgets/addMember";
    }
//	@RequestMapping(method = RequestMethod.POST)
//	public String printWelcome(ModelMap model) {
//		model.addAttribute("message", "Hello world!");
//		return "AddVehicle";
//	}
}

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