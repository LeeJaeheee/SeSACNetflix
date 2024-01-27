//
//  HomeHeaderView.swift
//  SeSACNetflix
//
//  Created by 이재희 on 1/27/24.
//

import UIKit
import SnapKit

class HomeHeaderView: UIView {
    
    let imageView = UIImageView()
    let playButton = UIButton()
    let likeButton = UIButton()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        addSubview(imageView)
        addSubview(playButton)
        addSubview(likeButton)
        addSubview(label)
    }
    
    func configureView() {
        imageView.backgroundColor = .systemYellow
        
        playButton.configureButton(title: "재생", image: "play.fill", backgroundColor: .white, foregroundColor: .black)
        
        likeButton.configureButton(title: "내가 찜한 리스트", image: "plus", backgroundColor: .darkGray, foregroundColor: .white)
        
        label.text = "장르나 분위기 / 장르나 분위기 / 장르나 분위기 / 장르나 분위기 / 장르나 분위기"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .semibold)
    }
    
    func setupConstraints() {
        let inset: CGFloat = 16
        let buttonHeight: CGFloat = 40
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        playButton.snp.makeConstraints { make in
            make.leading.bottom.equalTo(imageView).inset(inset)
            make.height.equalTo(buttonHeight)
        }
        
        likeButton.snp.makeConstraints { make in
            make.leading.equalTo(playButton.snp.trailing).offset(inset)
            make.trailing.bottom.equalTo(imageView).inset(inset)
            make.height.equalTo(buttonHeight)
            make.width.equalTo(playButton)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(playButton.snp.top).offset(-inset)
            make.horizontalEdges.greaterThanOrEqualToSuperview().inset(inset)
            make.height.equalTo(12)
        }
    }
    
}

#Preview {
    HomeHeaderView()
}
