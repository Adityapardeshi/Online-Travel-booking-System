package com.example.demo;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer{
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		exposeDirectory("thumbnail", registry);
	}

	private void exposeDirectory(String dirname, ResourceHandlerRegistry registry) {
		Path uploadDir = Paths.get(dirname);
		String uploadPath = uploadDir.toFile().getAbsolutePath();
		registry.addResourceHandler("/" + dirname + "/*").addResourceLocations("file:/"+uploadPath+"/");
		
	}
}
