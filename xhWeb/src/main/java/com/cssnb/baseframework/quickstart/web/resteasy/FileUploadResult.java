package com.cssnb.baseframework.quickstart.web.resteasy;

import java.util.List;

public class FileUploadResult {

	private List<FileInfo> files;
	
	private List<String> errors;

	public List<FileInfo> getFiles() {
		return files;
	}

	public void setFiles(List<FileInfo> files) {
		this.files = files;
	}

	public List<String> getErrors() {
		return errors;
	}

	public void setErrors(List<String> errors) {
		this.errors = errors;
	}

	

	
	
}
