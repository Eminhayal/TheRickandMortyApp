//
//  Epidose.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 12.09.2021.
//

import Foundation

// MARK: - Episode
struct Episode: Codable {
    var info: InfoPage
    var results: [ResultEpisode]
}

// MARK: - Info
struct InfoPage: Codable {
    let count, pages: Int
    var next: String
}

// MARK: - Result
struct ResultEpisode : Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
