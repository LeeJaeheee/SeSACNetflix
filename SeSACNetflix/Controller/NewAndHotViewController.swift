//
//  New&HotViewController.swift
//  SeSACNetflix
//
//  Created by 이재희 on 1/26/24.
//

import UIKit

enum Tag: CaseIterable {
    case upcoming
    case popular
    case top10Series
    case top10Movie
    
    var title: String {
        switch self {
        case .upcoming:
            return "🍿 공개 예정"
        case .popular:
            return "🔥 모두의 인기 콘텐츠"
        case .top10Series:
            return "📺 Top 10 시리즈"
        case .top10Movie:
            return "🎬 Top 10 영화"
        }
    }
}

class NewAndHotViewController: UIViewController {
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem()
        configureHierarchy()
        configureView()
        setupConstraints()
    }
    
    @objc func searchButtonTapped() {
        
    }
}

extension NewAndHotViewController: VCProtocol {
    
    func configureNavigationItem() {
        navigationItem.title = "NEW & HOT"
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonTapped))
        navigationItem.rightBarButtonItem = searchButton
    }
    
    func configureHierarchy() {
        view.addSubview(collectionView)
    }
    
    func configureView() {
        configureCollectionView()
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
        }
    }
    
}

extension NewAndHotViewController: CollectionViewProtocol {
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func configureCollectionViewLayout() -> UICollectionViewFlowLayout {
        let spacing: CGFloat = 16
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        layout.minimumInteritemSpacing = spacing
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }
    
}

extension NewAndHotViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Tag.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as! TagCollectionViewCell
        
        cell.label.text = Tag.allCases[indexPath.item].title
        
        return cell
    }
    
}

#Preview {
    NewAndHotViewController()
}
