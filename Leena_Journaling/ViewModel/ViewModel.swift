//
//  ViewModel.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 12/11/2026.
//

import Foundation
import Combine

class JournalViewModel: ObservableObject {

    @Published var journals: [Journal] = [] {
        didSet {
            save()
        }
    }

    @Published var showBookmarkedOnly = false
    @Published var searchText = ""

    // أول ما يشتغل التطبيق، نقرا المذكرات المحفوظة
    init() {
        load()
    }

    // الحفظ في الجوال
    func save() {
        if let data = try? JSONEncoder().encode(journals) {
            UserDefaults.standard.set(data, forKey: "journals")
        }
    }

    // القراءة من الجوال
    func load() {
        if let data = UserDefaults.standard.data(forKey: "journals"),
           let saved = try? JSONDecoder().decode([Journal].self, from: data) {
            journals = saved
        }
    }

    var filteredJournals: [Journal] {
        var result = journals

        if showBookmarkedOnly {
            result = result.filter { $0.isBookmarked }
        }

        if !searchText.isEmpty {
            result = result.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.content.localizedCaseInsensitiveContains(searchText)
            }
        }

        return result
    }

    func toggleBookmarkFilter() {
        showBookmarkedOnly.toggle()
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
