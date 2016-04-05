package com.mkyong.web.controller;

import com.mkyong.users.model.Category;
import com.mkyong.users.model.User;
import com.mkyong.users.model.UserRole;
import com.mkyong.users.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Iterator;

@Controller
public class MainController   {

	@Autowired
	MyService myService;


	@RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		return model;
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminPage() {
		ModelAndView model = new ModelAndView();
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("adminmy");
		return model;

	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
		}
		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");
		return model;
	}


    //viewForDifferentUsers
	@RequestMapping("/top/{id}")
	public ModelAndView listCategory (@PathVariable(value = "id") long categoryId) {
		ModelAndView model = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			ArrayList<UserRole> roles = new ArrayList<UserRole>();
			 User user = myService.findUserByUsername(userDetail.getUsername());
			for (Iterator<UserRole> iterator = user.getUserRole().iterator(); iterator.hasNext();){
					roles.add(iterator.next());
				}
			if (roles.get(0).getRole().equals("ROLE_USER")) {
				model.setViewName("userview");
				//userDatabase
				Category category = myService.find(categoryId);
				model.addObject("cat",category);
				model.addObject("products", myService.listProducts(category));
				model.addObject("categories", myService.listGroups());

			} else if
					(roles.get(0).getRole().equals("ROLE_ADMIN")){
				           model.setViewName("adminmy");
				//admindatabase


			}
		} else

		{
			model.setViewName("anonview");
			Category category = myService.find(categoryId);
			model.addObject("cat",category);
			model.addObject("products", myService.listProducts(category));
			model.addObject("categories", myService.listGroups());

		}
		return model;
	}

	@RequestMapping("/user")
	public String user ( Model model) {
		return "userview";
	}

	// customize the error message
	private String getErrorMessage(HttpServletRequest request, String key) {

		Exception exception = (Exception) request.getSession().getAttribute(key);

		String error = "";
		if (exception instanceof BadCredentialsException) {
			error = "Invalid username and password!";
		} else if (exception instanceof LockedException) {
			error = exception.getMessage();
		} else {
			error = "Invalid username and password!";
		}

		return error;
	}

	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {
		ModelAndView model = new ModelAndView();
		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
			model.addObject("username", userDetail.getUsername());

		}
		model.setViewName("403");
		return model;

	}

}