//
//  BaseModel.swift
//  nobullshit
//
//  Created by Breno R R on 30/06/2024.
//
import Foundation

protocol BaseModel: Codable, Identifiable {
    var id: String? {get set}
    var dictionary: [String: Any] {get}
}

extension BaseModel {
    var dictionary: [String: Any] {
        let data = (try? JSONEncoder().encode(self)) ?? Data()
        return (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) ?? [:]
    }
}
