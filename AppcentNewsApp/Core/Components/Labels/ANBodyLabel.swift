//
//  ANBodyLabel.swift
//  AppcentNewsApp
//
//  Created by abdullah on 11.05.2024.
//

import UIKit

class ANBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAligment: NSTextAlignment) {
            super.init(frame: .zero)
            self.textAlignment = textAligment
            configure()

        }
        
        
      private  func configure() {
          textColor                 = .secondaryLabel
          font                      = UIFont.preferredFont(forTextStyle: .body)
          adjustsFontSizeToFitWidth = true
          minimumScaleFactor        = 0.75
          
          lineBreakMode             = .byTruncatingTail
          translatesAutoresizingMaskIntoConstraints = false
        }
}
