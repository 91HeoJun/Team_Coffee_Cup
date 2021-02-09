package com.company.mapper;

import java.util.List;

import com.company.domain.FileAttach;

public interface StoreAttachMapper {
	public int insert(FileAttach attach); 
	public List<FileAttach> getList(int code);
	public int deleteList(int code);
	public List<FileAttach> getOldFiles();
}
