package com.company.service;

import java.util.List;

import com.company.domain.Criteria;
import com.company.domain.ProductFileAttach;
import com.company.domain.ProductVO;

public interface ProductService {
	
	public boolean insertProduct(ProductVO product);
	public boolean updateProduct(ProductVO product);
	public boolean removeProduct(int pcode);
	
	public ProductVO getProduct(int pcode);
	public List<ProductVO> getProductList(Criteria cri);
	
	public int getProductCnt(Criteria cri);
	
	public List<ProductFileAttach> AttachList(int pcode);

}
