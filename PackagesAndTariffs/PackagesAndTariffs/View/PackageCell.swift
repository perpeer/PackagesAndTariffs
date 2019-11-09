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
        price.text = "\(package.price) ₺"
        dataCap.text = "\(package.tariff.dataToGigabyte())"
        talkCap.text = package.tariff.talk
        smsCap.text = package.tariff.sms
        if let benefits = package.benefits {
          benefitsStack.removeAllArrangedSubviews()
          for benefit in benefits {
            benefitsStack.addArrangedSubview(benefit.imageViewOfBenefit())
          }
        }
      }
    }
  }
  
  // top
  let name = UILabel(text: "name", font: UIFont(name: Fonts.HelveticaNeue_Bold, size: 20)!)
  let desc = UILabel(text: "desc", font: .systemFont(ofSize: 14), numberOfLines: 0)
  let benefitsStack = UIStackView()
  
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
  
  // bottom
  let separator = UIView()
  let price = UILabel(text: "price", font: UIFont(name: Fonts.HelveticaNeue_Bold, size: 22)!)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(name)
    name.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, size: .init(width: 0, height: 40))

    addSubview(desc)
    desc.anchor(top: name.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 8), size: .init(width: 0, height: 60))
    
    addSubview(benefitsStack)
    benefitsStack.distribution = .fillEqually
    benefitsStack.anchor(top: desc.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8), size: .init(width: 0, height: 50))
    
    let middleStackView = UIStackView(arrangedSubviews: [
      VerticalStackView(arrangedSubviews: [dataIcon, dataCap, dataDesc]),
      VerticalStackView(arrangedSubviews: [talkIcon, talkCap, talkDesc]),
      VerticalStackView(arrangedSubviews: [smsIcon, smsCap, smsDesc])
    ])
    
    addSubview(middleStackView)
    middleStackView.anchor(top: benefitsStack.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 100))
    middleStackView.distribution = .fillEqually
    
    addSubview(price)
    price.textColor = UIColor.rgb(red: 109, green: 119, blue: 129)
    price.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 8, bottom: 8, right: 8))
    
    separator.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
    addSubview(separator)
    separator.anchor(top: nil, leading: leadingAnchor, bottom: price.topAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 8, bottom: 8, right: 8), size: .init(width: 0, height: 1))

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
