//
//  NewAndHotButtonView.swift
//  SeSACNetflix
//
//  Created by 이재희 on 1/28/24.
//

import UIKit

class NewAndHotButtonView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
//    convenience init(tagType: Tag) {
//        self.init(frame: .zero)
//        switch tagType {
//        case .upcoming:
//            
//        default:
//            
//        }
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

#Preview {
    NewAndHotButtonView()
}
