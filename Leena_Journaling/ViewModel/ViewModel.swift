//
//  ViewModel.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 12/11/2026.
//

import Foundation
import Combine

enum SortType {
    case none
    case bookmark
    case date
}

class JournalViewModel: ObservableObject {

    @Published var journals: [Journal] = [] {
        didSet {
            save()
        }
    }

    @Published var sortType: SortType = .none
    @Published var searchText = ""

    init() {
        load()
    }

    func save() {
        if let data = try? JSONEncoder().encode(journals) {
            UserDefaults.standard.set(data, forKey: "journals")
        }
    }

    func load() {
        if let data = UserDefaults.standard.data(forKey: "journals"),
           let saved = try? JSONDecoder().decode([Journal].self, from: data) {
            journals = saved
        }
    }

    var filteredJournals: [Journal] {
        var result = journals

        if !searchText.isEmpty {
            result = result.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.content.localizedCaseInsensitiveContains(searchText)
            }
        }

        if sortType == .bookmark {
            result = result.sorted { $0.isBookmarked && !$1.isBookmarked }
        } else if sortType == .date {
            result = result.sorted { $0.date < $1.date }
        }

        return result
    }

    // ضغطة: بوكمارك فوق — ضغطة ثانية: بدون ترتيب
    func sortByBookmark() {
        if sortType == .bookmark {
            sortType = .none
        } else {
            sortType = .bookmark
        }
    }

    // ضغطة: الأقدم أول — ضغطة ثانية: بدون ترتيب
    func sortByDate() {
        if sortType == .date {
            sortType = .none
        } else {
            sortType = .date
        }
    }

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
  
