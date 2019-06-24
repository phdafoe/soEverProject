// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let genericModel = try? newJSONDecoder().decode(GenericModel.self, from: jsonData)

import Foundation

// MARK: - GenericModel
struct GenericModel: Codable {
    let feed: Feed
    
    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

// MARK: - Feed
struct Feed: Codable {
    let author: Author
    let entry: [Entry]
    let updated: Rights
    let rights: Rights
    let title: Rights
    let icon: Icon
    let link: [LinkElement]
    let id: FeedID
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case entry = "entry"
        case updated = "updated"
        case rights = "rights"
        case title = "title"
        case icon = "icon"
        case link = "link"
        case id = "id"
    }
}

// MARK: - Author
struct Author: Codable {
    let name: Rights
    let uri: URI
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case uri = "uri"
    }
}

// MARK: - Rights
struct Rights: Codable {
    let label: String
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
    }
}

// MARK: - URI
struct URI: Codable {
    let label: String
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
    }
}

// MARK: - Entry
struct Entry: Codable {
    let imName: IMName
    let imImage: [IMImage]
    let summary: Rights
    //let imVendorName: Rights
    let imPrice: IMPrice
    let imContentType: IMContentType
    let title: IMName
    //let imPublisher: Rights
    //let link: EntryLink
    let id: EntryID
    //let imArtist: IMArtist
    let category: Category
    let imReleaseDate: IMReleaseDate
    let subtitle: Rights?
    
    enum CodingKeys: String, CodingKey {
        case imName = "im:name"
        case imImage = "im:image"
        case summary = "summary"
        //case imVendorName = "im:vendorName"
        case imPrice = "im:price"
        case imContentType = "im:contentType"
        case title = "title"
        //case imPublisher = "im:publisher"
        //case link = "link"
        case id = "id"
        //case imArtist = "im:artist"
        case category = "category"
        case imReleaseDate = "im:releaseDate"
        case subtitle = "subtitle"
    }
}

// MARK: - Category
struct Category: Codable {
    let attributes: CategoryAttributes
    
    enum CodingKeys: String, CodingKey {
        case attributes = "attributes"
    }
}

// MARK: - CategoryAttributes
struct CategoryAttributes: Codable {
    let imID: String
    let term: String
    let scheme: String
    let label: String
    
    enum CodingKeys: String, CodingKey {
        case imID = "im:id"
        case term = "term"
        case scheme = "scheme"
        case label = "label"
    }
}

// MARK: - EntryID
struct EntryID: Codable {
    let label: String
    let attributes: IDAttributes
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
        case attributes = "attributes"
    }
}

// MARK: - IDAttributes
struct IDAttributes: Codable {
    let imID: String
    
    enum CodingKeys: String, CodingKey {
        case imID = "im:id"
    }
}

// MARK: - IMArtist
struct IMArtist: Codable {
    let label: String
    let attributes: IMArtistAttributes
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
        case attributes = "attributes"
    }
}

// MARK: - IMArtistAttributes
struct IMArtistAttributes: Codable {
    let href: String
    
    enum CodingKeys: String, CodingKey {
        case href = "href"
    }
}

// MARK: - IMContentType
struct IMContentType: Codable {
    let attributes: IMContentTypeAttributes
    
    enum CodingKeys: String, CodingKey {
        case attributes = "attributes"
    }
}

// MARK: - IMContentTypeAttributes
struct IMContentTypeAttributes: Codable {
    let term: String
    let label: String
    
    enum CodingKeys: String, CodingKey {
        case term = "term"
        case label = "label"
    }
}

// MARK: - IMImage
struct IMImage: Codable {
    let label: String
    let attributes: IMImageAttributes
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
        case attributes = "attributes"
    }
}

// MARK: - IMImageAttributes
struct IMImageAttributes: Codable {
    let height: String
    
    enum CodingKeys: String, CodingKey {
        case height = "height"
    }
}

// MARK: - IMName
struct IMName: Codable {
    let label: String
    let attributes: IMNameAttributes?
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
        case attributes = "attributes"
    }
}

// MARK: - IMNameAttributes
struct IMNameAttributes: Codable {
    let imCensoredLabel: String
    
    enum CodingKeys: String, CodingKey {
        case imCensoredLabel = "im:censoredLabel"
    }
}

// MARK: - IMPrice
struct IMPrice: Codable {
    let label: String
    let attributes: IMPriceAttributes
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
        case attributes = "attributes"
    }
}

// MARK: - IMPriceAttributes
struct IMPriceAttributes: Codable {
    let amount: String
    let currency: String
    
    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case currency = "currency"
    }
}

// MARK: - IMReleaseDate
struct IMReleaseDate: Codable {
    let label: String
    let attributes: Rights
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
        case attributes = "attributes"
    }
}

// MARK: - EntryLink
struct EntryLink: Codable {
    let attributes: PurpleAttributes
    
    enum CodingKeys: String, CodingKey {
        case attributes = "attributes"
    }
}

// MARK: - PurpleAttributes
struct PurpleAttributes: Codable {
    let rel: String
    let type: String
    let href: String
    
    enum CodingKeys: String, CodingKey {
        case rel = "rel"
        case type = "type"
        case href = "href"
    }
}

// MARK: - Icon
struct Icon: Codable {
    let label: String
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
    }
}

// MARK: - FeedID
struct FeedID: Codable {
    let label: String
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
    }
}

// MARK: - LinkElement
struct LinkElement: Codable {
    let attributes: FluffyAttributes
    
    enum CodingKeys: String, CodingKey {
        case attributes = "attributes"
    }
}

// MARK: - FluffyAttributes
struct FluffyAttributes: Codable {
    let rel: String
    let type: String?
    let href: String
    
    enum CodingKeys: String, CodingKey {
        case rel = "rel"
        case type = "type"
        case href = "href"
    }
}
