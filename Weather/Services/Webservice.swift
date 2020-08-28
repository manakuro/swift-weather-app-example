//
//  Webservice.swift
//  Weather
//
//  Copyright © 2020 manato. All rights reserved.
//

import Foundation

struct Resource<T> {
  let url: URL
  let parse: (Data) -> T?
}


final class Webservice {
  func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
    URLSession.shared.dataTask(with: resource.url) { data, response, error in
      guard let data = data, error == nil else {
        print("NO DATA")
        completion(nil)
        return
      }
      
      DispatchQueue.main.async {
        completion(resource.parse(data))
      }
      
    }.resume()
  }
}
