//
//  JSONReader.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation

final class JSONReader {
    static func readJSON(fileName: String) -> [String:Any]? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                  if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                           return jsonResult
                  }
              } catch {
                   // handle error
              }
        }
        return nil
    }
}
