//
//  Match.swift
//  CSTV
//
//  Created by Willian Junior Peres de Pinho on 25/02/23.
//

import Foundation

struct Match: Codable, Identifiable {
    let id: Int?
    let match_type: String?
    let number_of_games: Int?
    let original_scheduled_at: String?
    let tournament_id: Int?
    let tournament: Tournament?
    let serie: Serie?
    let forfeit: Bool?
    let rescheduled: Bool?
    let official_stream_url: String?
    let modified_at: String?
    let begin_at: String?
    let end_at: String?
    let status: Status?
    let scheduled_at: String?
    let league: League?
    let draw: Bool?
    let opponents: [OpponentItem]?
    let slug: String?
    let winner_id: Int?
    let league_id: Int
    let name: String?
    let serie_id: Int?
}

enum Status: String, Codable {
    case Finished = "finished", NotPlayed = "not_played", NotStarted = "not_started", Running = "running", Canceled = "canceled"
    static let allValues = [Finished, NotPlayed, NotStarted, Running, Canceled]
}
