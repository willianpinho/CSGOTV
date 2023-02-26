//
//  FormatDate.swift
//  CSGOTV
//
//  Created by Willian Junior Peres de Pinho on 26/02/23.
//

import Foundation

extension Date {
    static func formatDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let dateFromStr: Date = dateFormatter.date(from: date) ?? Date()

        return dateFormatter.string(from: dateFromStr)
    }
}
