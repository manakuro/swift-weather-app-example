//
//  Environment.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation

public enum Environment {
  static let API_URL: String = {
    ProcessInfo.processInfo.environment["API_URL"]!
  }()
}
