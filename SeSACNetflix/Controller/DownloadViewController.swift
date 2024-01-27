//
//  DownloadViewController.swift
//  SeSACNetflix
//
//  Created by 이재희 on 1/26/24.
//

import UIKit

class DownloadViewController: UIViewController {
    
    let mainLabel = UILabel()
    let subLabel = UILabel()
    let imageView = UIImageView()
    let settingButton = UIButton()
    let browseButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem()
        configureHierarchy()
        configureView()
        setupConstraints()
    }
    

}

extension DownloadViewController: VCProtocol {
    
    func configureNavigationItem() {
        navigationItem.title = "저장한 콘텐츠 목록"
    }
    
    func configureHierarchy() {
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(imageView)
        view.addSubview(settingButton)
        view.addSubview(browseButton)
    }
    
    func configureView() {
        mainLabel.text = "'나만의 자동 저장' 기능"
        mainLabel.font = .boldSystemFont(ofSize: 17)
        
        subLabel.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요."
        subLabel.textColor = .lightGray
        subLabel.textAlignment = .center
        subLabel.font = .systemFont(ofSize: 13)
        subLabel.numberOfLines = 3
        
        imageView.image = .dummy
        imageView.contentMode = .scaleAspectFit
        
        designButton(settingButton, title: "설정하기", titleColor: .white, backgroundColor: .systemIndigo)
        designButton(browseButton, title: "저장 가능한 콘텐츠 살펴보기", titleColor: .black, backgroundColor: .white)
    }
    
    func designButton(_ btn: UIButton, title: String, titleColor: UIColor, backgroundColor: UIColor) {
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 15)
        btn.backgroundColor = backgroundColor
        btn.layer.cornerRadius = 5
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        subLabel.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.top).offset(-20)
            make.horizontalEdges.equalToSuperview().inset(42)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.bottom.equalTo(subLabel.snp.top).offset(-12)
            make.centerX.equalToSuperview()
        }
        
        settingButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(32)
            make.horizontalEdges.equalToSuperview().inset(42)
            make.height.equalTo(36)
        }
        
        browseButton.snp.makeConstraints { make in
            make.top.equalTo(settingButton.snp.bottom).offset(16)
            make.size.equalTo(CGSize(width: 200, height: 36))
            make.centerX.equalToSuperview()
        }
    }
}

#Preview {
    MainTabBarController()
}
