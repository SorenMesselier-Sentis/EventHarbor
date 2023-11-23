//
//  LastFMAPIModel.swift
//  ProjectA4Swift
//
//  Created by Soren Messelier-Sentis on 23/11/2023.
//

import Foundation

struct LastFMArtistResponse: Codable {
    let artist: LastFMArtist
}

struct LastFMArtist: Codable {
    let name: String
    let bio: LastFMBio
}

struct LastFMBio: Codable {
    let summary: String
}
