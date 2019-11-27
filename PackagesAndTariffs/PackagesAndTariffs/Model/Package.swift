//
//  Package.swift
//  PackagesAndTariffs
//
//  Created by Ekrem TAŞKIRAN on 8.11.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import UIKit

struct Packages: Decodable {
  let packages: [Package]
  
  func sortAndSplitOfSectionWithTariff(type: TariffType = .data) -> [[Package]] {
    var favorites = [Package]()
    var yearly = [Package]()
    var monthly = [Package]()
    var weekly = [Package]()
    
    packages.forEach { (package) in
      if package.isFavorite {
        favorites.append(package)
      } else {
        switch package.subscriptionType {
        case .Yearly: yearly.append(package)
        case .Monthly: monthly.append(package)
        case .Weekly: weekly.append(package)
        case .Other: break
        }
      }
    }

    return [sortTariff(type: type, packages: favorites),
            sortTariff(type: type, packages: yearly),
            sortTariff(type: type, packages: monthly),
            sortTariff(type: type, packages: weekly)]
      .filter {(p) -> Bool in !p.isEmpty }
  }
  
  fileprivate func sortTariff(type: TariffType, packages: [Package]) -> [Package] {
    switch type {
    case .data: return packages.sorted(by: { $0.tariff.dataDouble > $1.tariff.dataDouble })
    case .talk: return packages.sorted(by: { $0.tariff.talkDouble > $1.tariff.talkDouble })
    case .sms: return packages.sorted(by: { $0.tariff.smsDouble > $1.tariff.smsDouble })
    }
  }
}

class Package: Decodable {
  let name: String
  let desc: String
  let subscriptionType: SubscriptionType
  let didUseBefore: Bool
  let benefits: [Benefit]?
  let price: Double
  let tariff: Tariff
  let availableUntil: String
  var isFavorite: Bool = false
  
  enum CodingKeys: CodingKey {
    case name, desc, subscriptionType, didUseBefore
    case benefits, price, tariff, availableUntil
  }
}

enum TariffType {
  case data, talk, sms
}

enum SubscriptionType: String, Decodable {
  case Yearly = "yearly"
  case Monthly = "monthly"
  case Weekly = "weekly"
  case Other = "other"
    
  init(from decoder: Decoder) throws {
    let label = try decoder.singleValueContainer().decode(String.self)
    switch label {
      case "yearly": self = .Yearly
      case "monthly": self = .Monthly
      case "weekly": self = .Weekly
      default: self = .Other
    }
  }
  
  func trTypeName() -> String {
    var name = ""
    switch self {
    case .Yearly: name = "Yıllık"
    case .Monthly: name = "Aylık"
    case .Weekly: name = "Haftalık"
    case .Other: break
    }
    return name
  }
}

enum Benefit: String, Decodable {
  case Fizy = "fizy"
  case TV = "tv+"
  case Bip = "bip"
  case Lifebox = "lifebox"
  case Platinum = "platinum"
  case Dergilik = "dergilik"
  case Other = "other"
    
  init(from decoder: Decoder) throws {
    let label = try decoder.singleValueContainer().decode(String.self)
    switch label {
      case "TV+": self = .TV
      case "Fizy": self = .Fizy
      case "BiP": self = .Bip
      case "Bip":self = .Bip
      case "lifebox": self = .Lifebox
      case "Platinum": self = .Platinum
      case "Dergilik": self = .Dergilik
      default: self = .Other
    }
  }
  
  func imageViewOfBenefit() -> UIImageView {
    let imageView = UIImageView(image: UIImage(named: self.rawValue))
    imageView.contentMode = .scaleAspectFit
    return imageView
  }
}

struct Tariff: Decodable {
  let data: String
  let talk: String
  let sms: String
  
  var dataDouble: Double {
    if let d = Double(data) {
      return d
    }
    return 0
  }
  
  var talkDouble: Double {
    if let t = Double(talk) {
      return t
    }
    return 0
  }
  
  var smsDouble: Double {
    if let s = Double(sms) {
      return s
    }
    return 0
  }
  
  func dataToGigabyte() -> String {
    if let dataDouble = Double(data) {
      return String(format: "%.0f", dataDouble / 1024)
    }
    return ""
  }
}
