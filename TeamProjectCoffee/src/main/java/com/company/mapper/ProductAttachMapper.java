package com.company.mapper;

import java.util.List;

import com.company.domain.ProductFileAttach;

public interface ProductAttachMapper {
	
	// 추후 FileAttach로 담을 수 있는지 테스트 예정
	public int insert(ProductFileAttach attach);
	public int delete(int pcode);
	public List<ProductFileAttach> oldFileList();
	public ProductFileAttach attach(int pcode);
}
