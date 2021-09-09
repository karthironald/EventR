//
//  EventModel.swift
//  EventR
//
//  Created by Karthick Selvaraj on 08/09/21.
//

import Foundation

// MARK: - EventResponse
struct EventResponse: Codable {
    let events: [Event]
    let meta: Meta
}

// MARK: - Event
struct Event: Codable, Identifiable {
    let type: String
    let id: Int
    let datetimeUTC: String
    let venue: Venue
    let datetimeTbd: Bool
    let performers: [Performer]
    let isOpen: Bool
    let datetimeLocal: String
    let timeTbd: Bool
    let shortTitle, visibleUntilUTC: String
    let url: String
    let score: Double
    let announceDate, createdAt: String
    let dateTbd: Bool
    let title: String
    let popularity: Double
    let eventDescription: String
    let status: Status
    let conditional: Bool
    let enddatetimeUTC: String?

    enum CodingKeys: String, CodingKey {
        case type, id
        case datetimeUTC = "datetime_utc"
        case venue
        case datetimeTbd = "datetime_tbd"
        case performers
        case isOpen = "is_open"
        case datetimeLocal = "datetime_local"
        case timeTbd = "time_tbd"
        case shortTitle = "short_title"
        case visibleUntilUTC = "visible_until_utc"
        case url, score
        case announceDate = "announce_date"
        case createdAt = "created_at"
        case dateTbd = "date_tbd"
        case title, popularity
        case eventDescription = "description"
        case status
        case conditional
        case enddatetimeUTC = "enddatetime_utc"
    }
}

// MARK: - Performer
struct Performer: Codable {
    let type, name: String
    let image: String
    let id: Int
    let images: PerformerImages
    let hasUpcomingEvents: Bool
    let primary: Bool?
    let stats: PerformerStats
    let imageAttribution: String?
    let url: String
    let score: Double
    let slug: String
    let homeVenueID: Int?
    let shortName: String
    let numUpcomingEvents: Int
    let imageLicense: String?
    let popularity: Int
    let location: Location?
    let homeTeam, awayTeam: Bool?

    enum CodingKeys: String, CodingKey {
        case type, name, image, id, images
        case hasUpcomingEvents = "has_upcoming_events"
        case primary, stats
        case imageAttribution = "image_attribution"
        case url, score, slug
        case homeVenueID = "home_venue_id"
        case shortName = "short_name"
        case numUpcomingEvents = "num_upcoming_events"
        case imageLicense = "image_license"
        case popularity, location
        case homeTeam = "home_team"
        case awayTeam = "away_team"
    }
}

// MARK: - PerformerImages
struct PerformerImages: Codable {
    let huge: String
}

// MARK: - Location
struct Location: Codable {
    let lat, lon: Double
}

// MARK: - PerformerStats
struct PerformerStats: Codable {
    let eventCount: Int

    enum CodingKeys: String, CodingKey {
        case eventCount = "event_count"
    }
}

enum Status: String, Codable {
    case normal = "normal"
}

// MARK: - Venue
struct Venue: Codable {
    let displayLocation: String

    enum CodingKeys: String, CodingKey {
        case displayLocation = "display_location"
    }
}

// MARK: - Meta
struct Meta: Codable {
    let total, took, page, perPage: Int

    enum CodingKeys: String, CodingKey {
        case total, took, page
        case perPage = "per_page"
    }
}
