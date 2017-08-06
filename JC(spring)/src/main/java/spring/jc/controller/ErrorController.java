package spring.jc.controller;


import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice("spring.jc.controller")
public class ErrorController {
	
	@ExceptionHandler(NullPointerException.class)
	private ModelAndView errorModelAndView1(NullPointerException ex1){
		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("/errorPage");
		modelandview.addObject("exception",ex1);
		
		return modelandview;
	}
	
		@ExceptionHandler(Exception.class)
	private ModelAndView errorModelAndView2(Exception ex2){
		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("/errorPage");
		modelandview.addObject("exception",ex2);
		
		return modelandview;
	}
		
		
		@ExceptionHandler(IllegalStateException.class)
		private ModelAndView errorModelAndView3(IllegalStateException ex3){
			ModelAndView modelandview = new ModelAndView();
			modelandview.setViewName("/errorPage");
			modelandview.addObject("exception",ex3);
			
			return modelandview;
		}
}
