//
//  BaseCell.swift
//  PackagesAndTariffs
//
//  Created by Ekrem TAŞKIRAN on 9.11.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundView = UIView()
    addSubview(self.backgroundView!)
    self.backgroundView?.fillSuperview()
    self.backgroundView?.backgroundColor = .white
    self.backgroundView?.layer.cornerRadius = 16
    
    self.backgroundView?.layer.shadowOpacity = 0.3
    self.backgroundView?.layer.shadowRadius = 10
    self.backgroundView?.layer.shadowOffset = .init(width: 0, height: 10)
    self.backgroundView?.layer.shouldRasterize = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
}
