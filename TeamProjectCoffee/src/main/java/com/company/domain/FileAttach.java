package com.company.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileAttach {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private int code;
}
