package kr.co.plantlibrary.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController {
    
    @GetMapping("/chat")
    public void chat(Model model, HttpServletRequest request) {
        
        log.info("======================Get Chat====================");
        HttpSession session = request.getSession(false);
        log.info(session);        
    }
}
