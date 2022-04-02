//
//  MockDataReader.swift
//  WRGDemo
//
//  Created by abdul salam on 02/04/22.
//

import Foundation

final class DataFetchService {
    static func fetchData <T: Decodable> (jsonFileName: String) -> T? {
        guard let dict = JSONReader.readJSON(fileName:jsonFileName) else { return nil }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: [])
            return try JSONDecoder().decode(T.self, from: jsonData)
        }
        catch {}
        return nil
    }
}
