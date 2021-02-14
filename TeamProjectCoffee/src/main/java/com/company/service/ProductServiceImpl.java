package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.Criteria;
import com.company.domain.FileAttach;
import com.company.domain.ProductVO;
import com.company.mapper.BoardAttachMapper;
import com.company.mapper.ProductAttachMapper;
import com.company.mapper.ProductMapper;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productmapper;
	

	@Autowired
	private ProductAttachMapper attachMapper;

	
	@Override
	public boolean insertProduct(ProductVO product) {
			
		boolean result = productmapper.insertProduct(product)>0?true:false;
		
		// 첨부파일 없을 시 
		if (product.getAttachList() == null || product.getAttachList().size() <= 0) {
			return result;
		}
				
		// 첨부파일 있을 시 
		product.getAttachList().forEach(attach -> {
			attach.setPcode(product.getPcode());
			attachMapper.insert(attach);
		});
				
				
		return result;
	}

	@Override
	public boolean updateProduct(ProductVO product) {
		
		// 첨부파일 우선 전체삭제 후 재삽입
		attachMapper.delete(product.getPcode());
		
		boolean result = productmapper.updateProduct(product)>0?true:false;
		
		// 첨부파일 없을 시
		if (product.getAttachList() == null || product.getAttachList().size() <= 0) {
			return result;
		}
		
		// 첨부파일 있을 시
		product.getAttachList().forEach(attach -> {
			attach.setPcode(product.getPcode());
			attachMapper.insert(attach);
		});

		return result;
	}

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
	public List<FileAttach> AttachList(int pcode) {
		return productmapper.attachList(pcode);
	}


}
