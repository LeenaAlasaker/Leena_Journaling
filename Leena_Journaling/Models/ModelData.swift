//
//  ModelData.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 11/11/2026.
//

import Foundation

struct Journal: Identifiable, Codable {
    var id = UUID()
    var title: String
    var date = Date()
    var content: String
    var isBookmarked = false

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
}
