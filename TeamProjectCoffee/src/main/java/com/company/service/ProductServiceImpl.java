package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.Criteria;
import com.company.domain.ProductVO;
import com.company.mapper.ProductMapper;

@Service("productService")
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
	public boolean removeProduct(int pcode) {
		return productmapper.deleteProduct(pcode)>0?true:false;
	}

	@Override
	public ProductVO getProduct(int pcode) {
		return productmapper.selectProduct(pcode);
	}

	@Override
	public List<ProductVO> getProductList(Criteria cri) {
		return productmapper.listProduct();
	}


}
