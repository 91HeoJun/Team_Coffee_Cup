package com.company.mapper;

import java.util.List;

import com.company.domain.ProductFileAttach;
import com.company.domain.Criteria;
import com.company.domain.ProductVO;

public interface ProductMapper {
	
	public int insertProduct(ProductVO vo);
	public int updateProduct(ProductVO vo);
	public int deleteProduct(int pcode);
	
	public ProductVO selectProduct(int pcode);
	public List<ProductVO> listProduct(Criteria cri);
	
	public int productCnt(Criteria cri);	
	
	public ProductFileAttach attach(int pcode);
}