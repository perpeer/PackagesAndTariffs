//
//  Service.swift
//  PackagesAndTariffs
//
//  Created by Ekrem TAŞKIRAN on 8.11.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import Foundation

class Service {
  static let shared = Service()
  
  func fetchDataFromLocalPath(completionHandler: @escaping (Packages?, Error?) -> Void) {
    guard let path = Bundle.main.path(forResource: "packageList", ofType: "json") else { return }
    let url = URL(fileURLWithPath: path)
    
    do {
      let data = try Data(contentsOf: url)
      let json = try JSONDecoder().decode(Packages.self, from: data)
      completionHandler(json, nil)
    } catch let err {
      completionHandler(nil, err)
    }
  }
}
