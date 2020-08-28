//
//  DoubleExtensions.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation

extension Double {
  var formatAsDegree: String {
    String(format: "%.0f°", self)
  }
}
