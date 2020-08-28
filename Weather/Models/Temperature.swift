//
//  Temperature.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation

struct Temperature: Decodable {
  let temp: Double
  let temp_min: Double;
  let temp_max: Double;
}
