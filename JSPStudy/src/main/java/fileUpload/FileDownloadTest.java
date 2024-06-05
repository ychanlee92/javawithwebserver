package fileUpload;

import java.io.FileInputStream;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FileDownloadTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fileName = request.getParameter("fileName");

		String downloadPath = ("D:\\temp\\");

		String encodingFileName = new String(fileName.getBytes("UTF-8"));
		String filePath = downloadPath + encodingFileName;

		FileInputStream fileInputStream = null;
		ServletOutputStream stream = null;

		byte[] buffer = new byte[1024];
		try {
			fileInputStream = new FileInputStream(filePath);

			String sMimeType = getServletContext().getMimeType(filePath);
			if (sMimeType == null) {
				sMimeType = "application/actet-stream";
			}
			response.setContentType(sMimeType);
			response.setHeader("Context-Diposition", "attachment; fileName=" + encodingFileName);
			stream = response.getOutputStream();
			int read;
			while ((read = fileInputStream.read(buffer, 0, buffer.length)) != -1) {
				stream.write(buffer, 0, read);
			}
		} catch (Exception e) {

		} finally {
			stream.flush();
			if (fileInputStream != null) {
				fileInputStream.close();
			}
			if (stream != null) {
				stream.close();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
