//
//  KeyedDecodingContainer.swift
//  nobullshit
//
//  Created by Breno R R on 16/06/2024.
//

import Foundation

extension KeyedDecodingContainer {
    func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
        let intValue = try decode(Int.self, forKey: key)
        return intValue == 1
    }
}
