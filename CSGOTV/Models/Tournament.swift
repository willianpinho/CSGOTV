//
//  Tournament.swift
//  CSTV
//
//  Created by Willian Junior Peres de Pinho on 25/02/23.
//

import Foundation

struct Tournament: Codable {
    let id: Int?
    let begin_at: String?
    let end_at: String?
    let league_id: Int?
    let modified_at: String?
    let name: String?
    let serie_id: Int?
    let slug: String?
    let tier: String?
    let winner_id: Int?
    let winner_type: String?
}
