//
//  WeatherListViewModel.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation


struct WeatherListViewModel {
  private var weatherViewModels = [WeatherViewModel]()
  
  func numberOfRows(_ section: Int) -> Int {
    self.weatherViewModels.count
  }
  
  func modelAt(_ index: Int) -> WeatherViewModel {
    self.weatherViewModels[index]
  }

  mutating func set(_ vm: WeatherViewModel) {
    self.weatherViewModels.append(vm)
  }
  
  mutating func updateUnit(to unit: Unit) {
    switch unit {
    case .celsius:
      toCelsius()
    case .fahrenheit:
      toFahrenheit()
    }
  }
    
  mutating func toCelsius() {
    weatherViewModels = weatherViewModels.map { w in
      var vm = w
      vm.model?.main.temp = (w.temperature - 32) * 5/9
      return vm
    }
  }
  mutating func toFahrenheit() {
    weatherViewModels = weatherViewModels.map { w in
      var vm = w
      vm.model?.main.temp = (w.temperature * 9/5) + 32
      return vm
    }
  }
}

struct WeatherViewModel {
  var model: Weather?
  
  var name: String {
    self.model?.name ?? ""
  }
  var temperature: Double {
    self.model?.main.temp ?? 0
  }
  var temperatureMin: Double {
    self.model?.main.temp_min ?? 0
  }
  var temperatureMax: Double {
    self.model?.main.temp_max ?? 0
  }
}
