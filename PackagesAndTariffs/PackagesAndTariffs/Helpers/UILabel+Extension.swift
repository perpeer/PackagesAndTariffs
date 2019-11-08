//
//  UILabel+Extension.swift
//  WeatherPlus
//
//  Created by Ekrem TAŞKIRAN on 12.09.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

extension UILabel {
  convenience init(text: String, font: UIFont, numberOfLines: Int = 1) {
    self.init(frame: .zero)
    self.text = text
    self.font = font
    self.numberOfLines = numberOfLines
  }
}
