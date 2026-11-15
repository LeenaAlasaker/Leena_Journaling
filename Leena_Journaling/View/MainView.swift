//
//  MainView.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 12/11/2026.
//

import SwiftUI

struct MainView: View {

    @StateObject private var viewModel = JournalViewModel()
    @State private var searchText = ""
    @State private var showNewJournal = false

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.journals.isEmpty {
                    EmptyStateView()
                } else {
                    List(viewModel.journals) { journal in
                        JournalCardView(journal: journal, viewModel: viewModel)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Journal")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                Button("Filter", systemImage: "line.3.horizontal.decrease") { }
                Button("Add", systemImage: "plus") {
                    showNewJournal = true
                }
            }
            .searchable(text: $searchText)
            .sheet(isPresented: $showNewJournal) {
                NewJournalView(viewModel: viewModel)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainView()
}
