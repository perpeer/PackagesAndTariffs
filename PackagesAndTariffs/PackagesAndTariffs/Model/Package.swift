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
}

struct Package: Decodable {
  let name: String
  let desc: String
  let subscriptionType: String
  let didUseBefore: Bool
  let benefits: [Benefit]?
  let price: Double
  let tariff: Tariff
  let availableUntil: String
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
  
  func dataToGigabyte() -> String {
    if let dataDouble = Double(data) {
      return String(format: "%.0f", dataDouble / 1024)
    }
    return ""
  }
}
