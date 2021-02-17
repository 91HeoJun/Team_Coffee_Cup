package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.Criteria;
import com.company.domain.FileAttach;
import com.company.domain.ProductFileAttach;
import com.company.domain.ProductVO;
import com.company.mapper.ProductAttachMapper;
import com.company.mapper.ProductMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productmapper;
	

	@Autowired
	private ProductAttachMapper attachMapper;

	@Transactional
	@Override
	public boolean insertProduct(ProductVO product) {
		log.info("첨부파일 "+product.getAttach());
			
		boolean result = productmapper.insertProduct(product)>0?true:false;
		
		// 첨부파일 없을 시 
		if (product.getAttach() == null) {
			return result;
		}
				
		// 첨부파일 있을 시 
		ProductFileAttach attach=product.getAttach();		
		attach.setPcode(product.getPcode());
		attachMapper.insert(attach);
		
				
		return result;
	}

	@Override
	public boolean updateProduct(ProductVO product) {
		
		
		boolean result = productmapper.updateProduct(product)>0?true:false;
		
		// 첨부파일 없을 시
		if (product.getAttach() == null) {
			return result;
		}else {
		
		// 첨부파일 우선 전체삭제 후 재삽입
		attachMapper.delete(product.getPcode());
		// 첨부파일 있을 시
		ProductFileAttach attach=product.getAttach();	
		attach.setPcode(product.getPcode());
		attachMapper.insert(attach);
		}
		return result;
	}
	
	@Transactional
	@Override
	public boolean removeProduct(int pcode) {
		
		attachMapper.delete(pcode);
		return productmapper.deleteProduct(pcode)>0?true:false;
	}

	@Override
	public ProductVO getProduct(int pcode) {
		return productmapper.selectProduct(pcode);
	}

	@Override
	public List<ProductVO> getProductList(Criteria cri) {
		return productmapper.listProduct(cri);
	}

	
	  @Override 
	  public int getProductCnt(Criteria cri) { 
		  return productmapper.productCnt(cri); 
	}
	 

	@Override
	public ProductFileAttach getAttach(int pcode) {
		
		return attachMapper.attach(pcode);
	}

	@Override
	public int deleteFile(int pcode) {		
		return attachMapper.delete(pcode);
	}


}
