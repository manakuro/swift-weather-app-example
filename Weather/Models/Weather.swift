//
//  Weather.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation

struct Weather: Decodable {
  let main: Temperature
  let name: String
}
