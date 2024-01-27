//
//  Protocol.swift
//  SeSACNetflix
//
//  Created by 이재희 on 1/26/24.
//

import UIKit

@objc protocol ConfigureProtocol {
    func configureHierarchy()
    func configureView()
    func setupConstraints()
}

@objc protocol VCProtocol: ConfigureProtocol {
    @objc optional func configureNavigationItem()
}

protocol CollectionViewProtocol: VCProtocol {
    func configureCollectionView()
    func configureCollectionViewLayout() -> UICollectionViewFlowLayout
}

protocol ReusableViewProtocol {
    static var identifier: String { get }
}

extension UITableViewCell: ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

