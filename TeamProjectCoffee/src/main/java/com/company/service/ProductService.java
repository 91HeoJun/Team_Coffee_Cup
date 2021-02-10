package com.company.service;

import java.util.List;

import com.company.domain.Criteria;
import com.company.domain.ProductVO;

public interface ProductService {
	public boolean insertProduct(ProductVO vo);
	public boolean updateProduct(ProductVO vo);
	public boolean removeProduct(int pCode);
	public ProductVO getProduct(int pCode);
	public List<ProductVO> getProductList(Criteria cri);
//	public int getProductCnt(Criteria cri);
}
