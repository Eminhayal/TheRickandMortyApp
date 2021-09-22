//
//  Location.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 18.09.2021.
//

import Foundation

// MARK: - Location
struct Locations : Codable {
    let info: LocationInfo
    let results: [LocationResult]
}

// MARK: - Info
struct LocationInfo: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Result
struct LocationResult: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
