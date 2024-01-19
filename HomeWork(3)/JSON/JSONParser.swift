//
//  JSONParser.swift
//  HomeWork(2)
//
//  Created by User on 17/1/24.
//

import Foundation

class JSONParser {
    static func parseStudents(data: Data) -> [Student]? {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Student].self, from: data)
        } catch {
            print("Ошибка JSON: \(error)")
            return nil
        }
    }
}
