package com.company.mapper;

import java.util.List;

import com.company.domain.ProductVO;

public interface ProductMapper {
	
	public int insertProduct(ProductVO vo);
	public int updateProduct(ProductVO vo);
	public int deleteProduct(int pCode);
	
	public ProductVO selectProduct(int pCode);
	public List<ProductVO> listProduct();
//	public int productCnt(Criteria cri);	
}
