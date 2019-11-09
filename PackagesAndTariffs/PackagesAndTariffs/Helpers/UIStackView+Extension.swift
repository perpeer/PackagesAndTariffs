//
//  UIStackView+Extension.swift
//  PackagesAndTariffs
//
//  Created by Ekrem TAŞKIRAN on 9.11.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

extension UIStackView {
  func removeAllArrangedSubviews() {
    let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
      self.removeArrangedSubview(subview)
      return allSubviews + [subview]
    }
    
    // Deactivate all constraints
    NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
    
    // Remove the views from self
    removedSubviews.forEach({ $0.removeFromSuperview() })
  }
}
