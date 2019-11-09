//
//  VerticalStackView.swift
//  PackagesAndTariffs
//
//  Created by Ekrem TAŞKIRAN on 8.11.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {

  init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
    super.init(frame: .zero)
    arrangedSubviews.forEach({ addArrangedSubview($0) })
    self.axis = .vertical
    self.spacing = spacing
    self.distribution = .fillEqually
    self.alignment = .center
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
