package com.funsoft.hmm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 로그인 컨트롤 구현 클래스
 * 
 * @author hgko
 *
 */
@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "redirect:/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login(Model model, @CookieValue(value = "saved_username", defaultValue = "") String userId) {
		if (userId != null) {
			model.addAttribute("userId", userId);
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login() {
		return "redirect:/monitoring/dashboard";
	}
}
