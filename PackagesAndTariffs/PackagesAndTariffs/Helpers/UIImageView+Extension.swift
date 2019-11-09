//
//  UIImageView+Extension.swift
//  PackagesAndTariffs
//
//  Created by Ekrem TAŞKIRAN on 8.11.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

extension UIImageView {
  convenience init(image: UIImage?, contentMode: UIView.ContentMode = .scaleAspectFit) {
    self.init(image: image)
    self.contentMode = contentMode
  }
}
