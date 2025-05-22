package com.app.movierental.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

public class FileUploadUtil {

    public static String saveFile(Part filePart, HttpServletRequest request) throws IOException {
        // Get the real path to the deployed webapp root
        String appPath = request.getServletContext().getRealPath("");
        String uploadDir = appPath + File.separator + "uploads";

        // Create uploads directory if it doesn't exist
        File uploadFolder = new File(uploadDir);
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs();
        }

        // Generate unique filename with original extension
        String fileName = UUID.randomUUID() + getFileExtension(filePart.getSubmittedFileName());

        // Save the file to the uploads directory
        Path filePath = Paths.get(uploadDir, fileName);
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);
        }

        // Log actual path and web-accessible path
        System.out.println("File saved to: " + filePath.toAbsolutePath());
        System.out.println("Will be accessible at: /uploads/" + fileName);

        // Return the relative path for use in <img src="...">
        return "uploads/" + fileName;
    }

    private static String getFileExtension(String fileName) {
        int dotIndex = fileName.lastIndexOf(".");
        return (dotIndex == -1) ? "" : fileName.substring(dotIndex);
    }
}
