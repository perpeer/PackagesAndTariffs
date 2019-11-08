//
//  BaseListController.swift
//  WeatherPlus
//
//  Created by Ekrem TAŞKIRAN on 11.09.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController {
  
  init() {
    let layout = UICollectionViewFlowLayout()
    super.init(collectionViewLayout: layout)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
