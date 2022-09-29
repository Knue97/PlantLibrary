package kr.co.plantlibrary.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class CommomExceptionAdvice {

	@ExceptionHandler(Exception.class)
	public String common(Exception e,Model model) {
		log.info("=============Exception page============");
		log.info("Exception 발생: " + e.getMessage());		
		model.addAttribute("error", e);
		
		return "error_common";
	}
}
