package com.company.mapper;

import java.util.List;

import com.company.domain.ProductVO;

public interface ProductMapper {
	
	public int insert(ProductVO vo);
	public int update(ProductVO vo);
	public int delete(int code);
	public ProductVO select(int code);
	public List<ProductVO> selectAll();	
}
