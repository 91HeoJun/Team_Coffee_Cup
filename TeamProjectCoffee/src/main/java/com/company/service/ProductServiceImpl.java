package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.ProductVO;
import com.company.mapper.ProductMapper;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;
	
	@Override
	public boolean insertProduct(ProductVO vo) {
		return mapper.insert(vo)>0?true:false;
	}

	@Override
	public boolean updateProduct(ProductVO vo) {
		return mapper.update(vo)>0?true:false;
	}

	@Override
	public boolean deleteProduct(int code) {
		return mapper.delete(code)>0?true:false;
	}

	@Override
	public ProductVO getRow(int code) {
		return mapper.select(code);
	}

	@Override
	public List<ProductVO> getList() {
		return mapper.selectAll();
	}

}
