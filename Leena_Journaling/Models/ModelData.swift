//
//  ModelData.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 11/11/2026.
//

import Foundation

struct Journal: Identifiable {
    let id = UUID()
    var title: String
    var content: String
    var date: Date = Date()
    var isBookmarked: Bool = false
}
