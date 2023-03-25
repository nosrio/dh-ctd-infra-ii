package com.example.myproject;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.web.bind.annotation.*;

@RestController
@EnableAutoConfiguration
public class HelloWorld {

	@RequestMapping("/")
	String home() {
		return "<html>"
				+ "<title>"
				+ 	"App Hello World"
				+ "</title>"
				+ "<body bgcolor='#e67e22'>"
					+ "<center>"
						   
						+ "<br><br><br>"
						+ "<b>"
							+ "<font color='white'>"
							+ 	"Esta es una aplicación de prueba para Digital House"
							+ "</font>"
						+ "</b>"
					+ "</center>"
				+ "</body>"
				+ "</html>";
	}
	
	@RequestMapping("/version")
	String version() {
		return "v1.3";
	}

	public static void main(String[] args) throws Exception {
		SpringApplication.run(HelloWorld.class, args);
	}
}
