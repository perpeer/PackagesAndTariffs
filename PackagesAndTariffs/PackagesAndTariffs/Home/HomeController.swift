//
//  HomeController.swift
//  PackagesAndTariffs
//
//  Created by Ekrem TAŞKIRAN on 8.11.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

class HomeController: BaseListController {
  
  private let cellId = "cellId"
  private var packages: Packages?
  
  private var packagesArr: [[Package]]? {
    didSet {
      self.collectionView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .white
    collectionView.register(PackageCell.self, forCellWithReuseIdentifier: cellId)
    
    Service.shared.fetchDataFromLocalPath { (packages, err) in
      if let err = err {
        print(err.localizedDescription)
        return
      }
      self.packages = packages
      self.packagesArr = packages?.sortAndSplitOfSectionWithTariff()
    }
  }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return packagesArr?.count ?? 0
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return packagesArr?[section].count ?? 0
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PackageCell
    cell.package = packagesArr?[indexPath.section][indexPath.item]
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let packagesArr = packagesArr else { return }
    if packagesArr[indexPath.section][indexPath.item].isFavorite {
      packagesArr[indexPath.section][indexPath.item].isFavorite = false
    } else {
      packagesArr[indexPath.section][indexPath.item].isFavorite = true
    }
    if let packages = packages {
      self.packagesArr = packages.sortAndSplitOfSectionWithTariff()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 32
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return .init(top: 32, left: 0, bottom: 32, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width - 64, height: 350)
  }
}
