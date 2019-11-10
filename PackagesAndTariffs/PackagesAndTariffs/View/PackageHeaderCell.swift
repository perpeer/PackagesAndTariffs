//
//  PackageHeaderCell.swift
//  PackagesAndTariffs
//
//  Created by Ekrem TAŞKIRAN on 10.11.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

class PackageHeaderCell: UICollectionViewCell {
  
  let items = ["Data", "Talk", "SMS"]
  var homeController: HomeController?
  
  let title = UILabel(text: "Filter: ", font: .boldSystemFont(ofSize: 13))
  
  lazy var filterControler: UISegmentedControl = {
    let fc = UISegmentedControl(items: items)
    fc.selectedSegmentIndex = 0
    fc.addTarget(self, action: #selector(handleFilterController), for: .valueChanged)
    return fc
  }()
  
  @objc func handleFilterController(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0: homeController?.filterWithTariff(type: .data)
    case 1: homeController?.filterWithTariff(type: .talk)
    case 2: homeController?.filterWithTariff(type: .sms)
    default: break
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(title)
    title.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 8, left: 64, bottom: 8, right: 8), size: .init(width: 40, height: 0))
    
    addSubview(filterControler)
    filterControler.anchor(top: topAnchor, leading: title.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 8, right: 64))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
