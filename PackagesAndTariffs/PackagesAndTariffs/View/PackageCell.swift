//
//  PackageCell.swift
//  PackagesAndTariffs
//
//  Created by Ekrem TAŞKIRAN on 8.11.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

class PackageCell: BaseCell {
   
  var package: Package? {
    didSet {
      if let package = package {
        name.text = package.name
        desc.text = package.desc
        
        price.text = "\(package.price) ₺ / \(package.subscriptionType.trTypeName())"
        dataCap.text = "\(package.tariff.dataToGigabyte())"
        talkCap.text = package.tariff.talk
        smsCap.text = package.tariff.sms
        benefitsStack.removeAllArrangedSubviews()
        if let benefits = package.benefits {
          for benefit in benefits {
            benefitsStack.addArrangedSubview(benefit.imageViewOfBenefit())
          }
        }
        favorite.image = package.isFavorite ? UIImage(named: "star_filled"): UIImage(named: "star_unfilled")
        useBefore.image = package.didUseBefore ? UIImage(named: "didUseBefore"): UIImage()
      }
    }
  }
  
  // top
  let name = UILabel(text: "name", font: UIFont(name: Fonts.HelveticaNeue_Bold, size: 20)!)
  let desc = UILabel(text: "desc", font: .systemFont(ofSize: 13), numberOfLines: 0)
  
  // middle
  let dataIcon = UIImageView(image: UIImage(named: "data"), contentMode: .scaleAspectFit)
  let dataCap = UILabel(text: "100", textColor: Colors.NumberInfo, font: UIFont(name: Fonts.HelveticaNeue_Bold, size: 32)!)
  let dataDesc = UILabel(text: "INTERNET/GB", textColor: Colors.Subtitle, font: UIFont(name: Fonts.HelveticaNeue_Medium, size: 12)!)
  let talkIcon = UIImageView(image: UIImage(named: "talk"), contentMode: .scaleAspectFit)
  let talkCap = UILabel(text: "100", textColor: Colors.NumberInfo, font: UIFont(name: Fonts.HelveticaNeue_Bold, size: 32)!)
  let talkDesc = UILabel(text: "HER YÖNE/dakika", textColor: Colors.Subtitle, font: UIFont(name: Fonts.HelveticaNeue_Medium, size: 12)!)
  let smsIcon = UIImageView(image: UIImage(named: "sms"), contentMode: .scaleAspectFit)
  let smsCap = UILabel(text: "100", textColor: Colors.NumberInfo, font: UIFont(name: Fonts.HelveticaNeue_Bold, size: 32)!)
  let smsDesc = UILabel(text: "SMS/adet", textColor: Colors.Subtitle, font: UIFont(name: Fonts.HelveticaNeue_Medium, size: 12)!)
  let benefitsStack = UIStackView()
  
  // bottom
  let separator = UIView()
  let price = UILabel(text: "price", font: UIFont(name: Fonts.HelveticaNeue_Bold, size: 24)!)
  let favorite = UIImageView(image: UIImage(named: "star_unfilled"))
  let useBefore = UIImageView(image: UIImage(named: "didUseBefore"))
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupTopLayout()
    setupMiddleLayout()
    setupBottomLayout()
  }
  
  fileprivate func setupTopLayout() {
    addSubview(name)
    name.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, size: .init(width: 0, height: 40))

    addSubview(desc)
    desc.anchor(top: name.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 8), size: .init(width: 0, height: 60))

  }
  
  fileprivate func setupMiddleLayout() {
    addSubview(benefitsStack)
    benefitsStack.distribution = .fillEqually
    benefitsStack.anchor(top: desc.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8), size: .init(width: 0, height: 50))
    
    let middleStackView = UIStackView(arrangedSubviews: [
      VerticalStackView(arrangedSubviews: [dataIcon, dataCap, dataDesc], spacing: 8),
      VerticalStackView(arrangedSubviews: [talkIcon, talkCap, talkDesc], spacing: 8),
      VerticalStackView(arrangedSubviews: [smsIcon, smsCap, smsDesc], spacing: 8)
    ])
    
    addSubview(middleStackView)
    middleStackView.anchor(top: benefitsStack.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 32, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 100))
    middleStackView.distribution = .fillEqually
  }
  
  fileprivate func setupBottomLayout() {
    addSubview(price)
    price.textColor = UIColor.rgb(red: 109, green: 119, blue: 129)
    price.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 8, bottom: 8, right: 8))
    
    separator.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
    addSubview(separator)
    separator.anchor(top: nil, leading: leadingAnchor, bottom: price.topAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 8, bottom: 8, right: 8), size: .init(width: 0, height: 1))
    
    favorite.contentMode = .scaleAspectFit
    addSubview(favorite)
    favorite.anchor(top: nil, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 8, right: 8), size: .init(width: 30, height: 30))
    
    useBefore.contentMode = .scaleAspectFit
    addSubview(useBefore)
    useBefore.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 8, bottom: 8, right: 0), size: .init(width: 30, height: 30))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
