package com.vdp.web.controller;

import com.vdp.users.model.Category;
import com.vdp.users.model.Products;
import com.vdp.users.model.User;
import com.vdp.users.model.UserRole;
import com.vdp.users.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
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


	//admin part ----------------------------------------------------------
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminPage() {
		ModelAndView model = new ModelAndView();
		model.addObject("products", myService.displayProducts());
		model.setViewName("adminmy");
		return model;
	}

	@RequestMapping(value = "/pruductpp")
		public ModelAndView productPP(){
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("categories", myService.listGroups());
		modelAndView.setViewName("addproduct");
		return modelAndView;
	}


    @RequestMapping(value = "/addproduct", method = RequestMethod.POST)
	public ModelAndView addproduct(@RequestParam (value = "category") long categoryID,
							 		 @RequestParam String description,
								     @RequestParam String price,
									 @RequestParam(value="photo") MultipartFile photo,
							 ModelAndView model) throws IOException {
		Products product = new Products(description, price, photo.getBytes());
        myService.addProduct(product);
		model.addObject("products",myService.displayProducts());
		model.setViewName("adminmy");
		return model;
	}





	@RequestMapping(value = "/login", method = RequestMethod.GET)
	@ResponseStatus(value= HttpStatus.OK)
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


    //viewForDifferentUsers------------------------------------------------------------
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
     //----------------------------------------------------------------------------------

	// return user view --------------------------------------------------
	@RequestMapping("/user")
	public String user ( Model model) {
		return "userview";
	}
	//-------------------------------------------------------------------

	// customize the error message  ------------------------------------------------------
	private String getErrorMessage(HttpServletRequest request, String key) {
		Exception exception = (Exception) request.getSession().getAttribute(key);
		String error = "";
		if (exception instanceof BadCredentialsException) {
			error = "Incorrect username or password";
		} else if (exception instanceof LockedException) {
			error = exception.getMessage();
		} else {
			error = "Incorrect username or password";
		}
		return error;
	}
    //----------------------------------------------------------------------------------------

	// for 403 access denied page ---------------------------------------------------------
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
  // ----------------------------------------------------------------------------------------
}