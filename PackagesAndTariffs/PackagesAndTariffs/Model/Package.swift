//
//  Package.swift
//  PackagesAndTariffs
//
//  Created by Ekrem TAŞKIRAN on 8.11.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import Foundation

struct Packages: Decodable {
  let packages: [Package]
}

struct Package: Decodable {
  let name: String
  let desc: String
  let subscriptionType: String
  let didUseBefore: Bool
  let benefits: [String]?
  let price: Double
  let tariff: Tariff
  let availableUntil: String
}

struct Tariff: Decodable {
  let data: String
  let talk: String
  let sms: String
}
