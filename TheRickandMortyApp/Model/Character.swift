//
//  Character.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 24.07.2021.
//

import Foundation
// MARK: - Character
struct  Character : Codable{
    var info: Info?
    var results: [Result]
}

// MARK: - Info
struct Info : Codable{
    let count, pages: Int
    var next: String
    let prev: String?
}

// MARK: - Result
struct Result : Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]?
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}
