//
//  ViewModel.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 12/11/2026.
//

import Foundation
import Combine

class JournalViewModel: ObservableObject {
    @Published var journals: [Journal] = []

    func addJournal(_ journal: Journal) {
        journals.append(journal)
    }

    func toggleBookmark(_ journal: Journal) {
        if let index = journals.firstIndex(where: { $0.id == journal.id }) {
            journals[index].isBookmarked.toggle()
        }
    }

    func deleteJournal(_ journal: Journal) {
        journals.removeAll { $0.id == journal.id }
    }

    func updateJournal(_ journal: Journal) {
        if let index = journals.firstIndex(where: { $0.id == journal.id }) {
            journals[index] = journal
        }
    }
}
