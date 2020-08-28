//
//  SettingsViewModel.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
  case celsius = "metric"
  case fahrenheit = "imerial"
}

extension Unit {
  var displayName: String {
    get {
      switch(self) {
      case .celsius:
        return "Celsisus"
      case .fahrenheit:
        return "Fahrenheit"
      }
    }
  }
}

struct SettingsViewModel {
  let units = Unit.allCases
  
  private var _selectedUnit: Unit = Unit.fahrenheit
  
  var selectedUnit: Unit {
    get {
      let userDefaults = UserDefaults.standard
      if let value = userDefaults.value(forKey: "unit") as? String {
        return Unit(rawValue: value)!
      }
      
      return _selectedUnit
    }
    
    set {
      let userDefaults = UserDefaults.standard
      
      userDefaults.set(newValue.rawValue, forKey: "unit")
    }
  }
}
