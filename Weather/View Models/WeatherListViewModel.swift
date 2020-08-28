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
  
}

struct WeatherViewModel {
  let model: Weather?
  
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
