package com.funsoft.hmm.web.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.funsoft.hmm.web.provider.CustomAccessDeniedHandler;
import com.funsoft.hmm.web.provider.SaveIdLoginSuccessHandler;
import com.funsoft.hmm.web.provider.UserAuthenticationProvider;

/**
 * Spring Security 설정
 * 
 * @author hgko
 *
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserAuthenticationProvider authenticationProvider;

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.csrf().disable();
		
		// 사용자 정의 accessDecisionManager 접근 제어 장치 및 오픈 식 언어
		http.authorizeRequests() // 요청을 어떻게 보안을 할 것인지 설정
//			.antMatchers("/", "/login").permitAll()
//			.anyRequest().authenticated();
			.antMatchers("/monitoring/**").access("hasRole('ROLE_USER')")
			.antMatchers("/user/**").access("hasRole('ROLE_USER')")
			.antMatchers("/alarm/**").access("hasRole('ROLE_USER')")
			.antMatchers("/facility/**").access("hasRole('ROLE_USER')")
			.antMatchers("/flux/**").access("hasRole('ROLE_USER')")
			.antMatchers("/leakage/**").access("hasRole('ROLE_USER')")
			.antMatchers("/measurement/**").access("hasRole('ROLE_USER')")
			.antMatchers("/summary/**").access("hasRole('ROLE_USER')")
			.antMatchers("/assessment/**").access("hasRole('ROLE_USER')")
			.antMatchers("/pressure/**").access("hasRole('ROLE_USER')");
		
		// 사용자 로그인 페이지
		http.formLogin()
			.loginPage("/login")
			.usernameParameter("userId")
			.passwordParameter("password")
			.failureUrl("/login?error")
			.successHandler(saveIdLoginSuccessHandler());
		
		// 사용자 정의 로그아웃
		http.logout()
			.logoutSuccessUrl("/login")
			.invalidateHttpSession(true);
		
		http.httpBasic();
		
		// session 관리
		http.sessionManagement().sessionFixation().changeSessionId()
			.maximumSessions(5).expiredUrl("/monitoring/dashboard");
		
		http.authenticationProvider(authenticationProvider);
		http.exceptionHandling().accessDeniedHandler(customAccessDeniedHandler());
	}
	
	@Bean
	public CustomAccessDeniedHandler customAccessDeniedHandler() {
		return new CustomAccessDeniedHandler();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) {
		// 로그인 프로세스가 진행될 provider
		auth.authenticationProvider(authenticationProvider);
	}

	@Bean
	public SaveIdLoginSuccessHandler saveIdLoginSuccessHandler() {

		SaveIdLoginSuccessHandler handler = new SaveIdLoginSuccessHandler();
		handler.setDefaultTargetUrl("/monitoring/dashboard");
		handler.setAlwaysUseDefaultTargetUrl(true);

		return handler;
	}
}
