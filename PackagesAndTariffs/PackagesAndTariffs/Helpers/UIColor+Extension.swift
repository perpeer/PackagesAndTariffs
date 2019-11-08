//
//  UIColor+Extension.swift
//  WeatherPlus
//
//  Created by Ekrem TAŞKIRAN on 19.09.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

extension UIColor {
  static func rgb(red r: CGFloat, green g: CGFloat, blue b: CGFloat) -> UIColor {
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
  }
}
