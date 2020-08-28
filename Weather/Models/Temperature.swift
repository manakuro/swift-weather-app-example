//
//  Temperature.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation

struct Temperature: Decodable {
  var temp: Double
  var temp_min: Double;
  var temp_max: Double;
}
