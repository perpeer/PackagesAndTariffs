//
//  HomeController.swift
//  PackagesAndTariffs
//
//  Created by Ekrem TAŞKIRAN on 8.11.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit
import CoreData

class HomeController: BaseListController {
  
  private let cellId = "cellId"
  private let headerId = "headerId"
  private var packages: Packages?
  private var tariffType = TariffType.data
  
  private var packagesArr: [[Package]]? {
    didSet {
      self.collectionView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .white
    collectionView.register(PackageCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(PackageHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    
    Service.shared.fetchDataFromLocalPath { (packages, err) in
      if let err = err {
        print(err.localizedDescription)
        return
      }
      self.packages = packages
      self.packagesArr = packages?.sortAndSplitOfSectionWithTariff()
    }
    
  }
  
  func filterWithTariff(type: TariffType) {
    if let packages = packages {
      self.packagesArr = packages.sortAndSplitOfSectionWithTariff(type: type)
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
      let package = packagesArr[indexPath.section][indexPath.item]
      CoreDataManager.shared.removeFavorite(value: package.name)
    } else {
      let package = packagesArr[indexPath.section][indexPath.item]
      CoreDataManager.shared.addFavorite(value: package.name)
    }
    filterWithTariff(type: tariffType)
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
 
  // HeaderCell
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if indexPath.section == 0 {
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! PackageHeaderCell
      header.homeController = self
      return header
    }
    return UICollectionReusableView()
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    if section == 0 {
      return CGSize(width: view.frame.width, height: 40)
    }
    return .zero
  }
}
