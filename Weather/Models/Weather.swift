//
//  Weather.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation

struct Weather: Decodable {
  var main: Temperature
  var name: String
}
