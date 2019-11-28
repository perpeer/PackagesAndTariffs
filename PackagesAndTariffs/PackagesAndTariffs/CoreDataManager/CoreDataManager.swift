//
//  CoreDataManager.swift
//  PackagesAndTariffs
//
//  Created by Ekrem TAŞKIRAN on 27.11.2019.
//  Copyright © 2019 Ekrem TAŞKIRAN. All rights reserved.
//

import CoreData

class CoreDataManager {
  static let shared = CoreDataManager()
  
  let persistentContainer: NSPersistentContainer = {
    let persistentContainer = NSPersistentContainer(name: "PackagesAndTariffsDataModel")
    persistentContainer.loadPersistentStores { (storeDescription, error) in
      if let err = error {
        fatalError("Loading of store failed: \(err)")
      }
    }
    return persistentContainer
  }()
  
  func readFavorites() -> [String]? {
    return fetchFavorites()
  }
  
  func addFavorite(value: String) {
    print("Add - ", value)
    create(value: value)
  }
  
  func removeFavorite(value: String) {
    print("Remove - ", fetchFavorites() ?? "")
    remove(value: value)
  }
  
  func isFavorite(value: String) -> Bool {
    return isExist(value: value)
  }
  
  fileprivate func fetchFavorites() -> [String]? {
    let context = persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<Favorite>(entityName: "Favorite")
    do {
      let favorites = try context.fetch(fetchRequest)
      var packages = [String]()
      favorites.forEach { (favorite) in
        if let name = favorite.name {
          packages.append(name)
        }
      }
      return !packages.isEmpty ? packages : nil
    } catch let fetchErr {
      print("Failed to fetch favorite:", fetchErr)
      return nil
    }
  }
  
  fileprivate func create(value: String) {
    if !isExist(value: value) {
      let context = persistentContainer.viewContext
      let favorite = NSEntityDescription.insertNewObject(forEntityName: "Favorite", into: context)
      
      favorite.setValue(value, forKey: "name")
      
      do {
        try context.save()
      } catch let saveErr {
        print("Failed to save favorite:", saveErr)
      }
    }
  }
  
  fileprivate func remove(value: String) {
    let context = persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<Favorite>(entityName: "Favorite")
    do {
      let favorites = try context.fetch(fetchRequest)
      for favorite in favorites {
        if let name = favorite.name, name.lowercased().replacingOccurrences(of: " ", with: "") == value.lowercased().replacingOccurrences(of: " ", with: "") {
          context.delete(favorite)
          try context.save()
        }
      }
    } catch let fetchErr {
      print("Failed to fetch favorite:", fetchErr)
    }
  }
  
  fileprivate func isExist(value: String) -> Bool {
    let context = persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<Favorite>(entityName: "Favorite")
    
    do {
      let favorites = try context.fetch(fetchRequest)
      for favorite in favorites {
        if let name = favorite.name, name.lowercased().replacingOccurrences(of: " ", with: "") == value.lowercased().replacingOccurrences(of: " ", with: "") {
          return true
        }
      }
    } catch let fetchErr {
      print("Failed to fetch favorite:", fetchErr)
    }
    return false
  }
}
