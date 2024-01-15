package com.example.demo;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.Path;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	public static void saveFile(String uploadDir, String filename, MultipartFile multipartfile)throws IOException {
		Path uploadPath = Paths.get(uploadDir);
		
		if(!Files.exists(uploadPath)){
			Files.createDirectories(uploadPath);
		}
		
		try(InputStream inputstream = multipartfile.getInputStream()){
			Path filePath = uploadPath.resolve(filename);
			Files.copy(inputstream, filePath, StandardCopyOption.REPLACE_EXISTING);
		}catch(IOException ioe) {
			throw new IOException("could not Save image file" + filename, ioe);
		}
	}
}
