// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let empty = try? newJSONDecoder().decode(Empty.self, from: jsonData)

import Foundation

// MARK: - Empty
struct AppsModels: Codable {
    let feed: FeedApps
    
    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

// MARK: - Feed
struct FeedApps: Codable {
    let title: String
    let id: String
    let author: AuthorApps
    let links: [Link]
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case id = "id"
        case author = "author"
        case links = "links"
        case copyright = "copyright"
        case country = "country"
        case icon = "icon"
        case updated = "updated"
        case results = "results"
    }
}

// MARK: - Author
struct AuthorApps: Codable {
    let name: String
    let uri: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case uri = "uri"
    }
}

// MARK: - Link
struct Link: Codable {
    let linkSelf: String?
    let alternate: String?
    
    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate = "alternate"
    }
}

// MARK: - Result
struct Result: Codable {
    let artistName: String
    let id: String
    let releaseDate: String
    let name: String
    let kind: String
    let copyright: String
    let artistID: String
    let artistURL: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    let contentAdvisoryRating: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case id = "id"
        case releaseDate = "releaseDate"
        case name = "name"
        case kind = "kind"
        case copyright = "copyright"
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100 = "artworkUrl100"
        case genres = "genres"
        case url = "url"
        case contentAdvisoryRating = "contentAdvisoryRating"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let genreID: String
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name = "name"
        case url = "url"
    }
}
