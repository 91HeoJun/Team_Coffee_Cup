package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.company.domain.Criteria;
import com.company.domain.ProductVO;
import com.company.mapper.ProductMapper;

public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productmapper;
	
	@Override
	public boolean insertProduct(ProductVO vo) {
		return productmapper.insertProduct(vo)>0?true:false;
	}

	@Override
	public boolean updateProduct(ProductVO vo) {
		return productmapper.updateProduct(vo)>0?true:false;
	}

	@Override
	public boolean removeProduct(int code) {
		return productmapper.deleteProduct(code)>0?true:false;
	}

	@Override
	public ProductVO getProduct(int code) {
		return productmapper.selectProduct(code);
	}

	@Override
	public List<ProductVO> getProductList(Criteria cri) {
		return productmapper.listProduct();
	}

	@Override
	public int getProductCnt(Criteria cri) {
		return productmapper.productCnt(cri);
	}

}
