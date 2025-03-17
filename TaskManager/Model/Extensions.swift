//
//  Extensions.swift
//  TaskManager
//
//  Created by Remberto Nunez on 3/14/25.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        
        return (try? JSONSerialization.jsonObject(with: data) as? [String: Any]) ?? [:]
    }
}
