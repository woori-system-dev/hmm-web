package com.funsoft.hmm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 사용자 관리 컨트롤 구현 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public void profile(Model model) {
		
	}
}
