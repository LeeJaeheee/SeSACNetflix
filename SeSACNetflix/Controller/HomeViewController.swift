//
//  HomeViewController.swift
//  SeSACNetflix
//
//  Created by 이재희 on 1/26/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    enum Sections: String, CaseIterable {
        case Popular
        case Top10Series
        case Top10Movie
        case OnlyNetflix
        case KoreanSeries
        
        var title: String {
            switch self {
            case .Popular:
                return "넷플릭스 인기 콘텐츠"
            case .Top10Series:
                return "오늘 대한민국의 TOP 10 시리즈"
            case .Top10Movie:
                return "오늘 대한민국의 TOP 10 영화"
            case .OnlyNetflix:
                return "오직 넷플릭스에서"
            case .KoreanSeries:
                return "한국 드라마"
            }
        }
    }
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    let headerView = HomeHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem()
        configureHierarchy()
        configureView()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        headerView.layoutIfNeeded()
    }

}

extension HomeViewController: VCProtocol {
    
    func configureNavigationItem() {
        navigationItem.title = "닉네임님"
    }
    
    func configureHierarchy() {
        view.addSubview(tableView)
        view.addSubview(headerView)
    }
    
    func configureView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.tableHeaderView = headerView
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        headerView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(headerView.snp.width).multipliedBy(4.0/3.0)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Sections.allCases[section].title
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 40 : 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as! HomeTableViewCell

        return cell
    }
    
}

#Preview {
    HomeViewController()
}
