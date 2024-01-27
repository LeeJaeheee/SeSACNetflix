//
//  HomeCollectionViewCell.swift
//  SeSACNetflix
//
//  Created by 이재희 on 1/27/24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    let posterImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeCollectionViewCell: ConfigureProtocol {
    
    func configureHierarchy() {
        contentView.addSubview(posterImageView)
    }
    
    func configureView() {
        posterImageView.backgroundColor = .systemTeal
    }
    
    func setupConstraints() {
        posterImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
