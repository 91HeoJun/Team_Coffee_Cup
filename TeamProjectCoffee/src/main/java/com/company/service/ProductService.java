package com.company.service;

import java.util.List;

import com.company.domain.ProductVO;

public interface ProductService {
	public boolean insertProduct(ProductVO vo);
	public boolean updateProduct(ProductVO vo);
	public boolean deleteProduct(int code);
	public ProductVO getRow(int code);
	public List<ProductVO> getList();
}
