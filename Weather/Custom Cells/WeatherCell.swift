//
//  WeatherCell.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
  @IBOutlet weak var cityNameLable: UILabel!
  @IBOutlet weak var temperatureLable: UILabel!
  
  func configure(_ vm: WeatherViewModel) {
    self.cityNameLable?.text = vm.name
    self.temperatureLable?.text = vm.temperature.formatAsDegree
  }
}
