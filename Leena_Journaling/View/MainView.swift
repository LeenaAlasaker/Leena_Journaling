//
//  MainView.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 12/11/2026.
//
import SwiftUI

struct MainView: View {

    @StateObject private var viewModel = JournalViewModel()
    @State private var showNewJournal = false
    @State private var showDeleteAlert = false
    @State private var journalToDelete: Journal?
    @State private var journalToEdit: Journal?

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.journals.isEmpty {
                    EmptyStateView()
                } else {
                    List(viewModel.filteredJournals) { journal in
                        JournalCardView(journal: journal, viewModel: viewModel)
                            .onTapGesture {
                                journalToEdit = journal
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                            .swipeActions(allowsFullSwipe: false) {
                                Button {
                                    journalToDelete = journal
                                    showDeleteAlert = true
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .tint(.red)
                            }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Journal")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                Menu("Filter", systemImage: "line.3.horizontal.decrease") {
                    Button("Sort by Bookmark") {
                        viewModel.toggleBookmarkFilter()
                    }
                    Button("Sort by Entry Date") { }
                }
                Button("Add", systemImage: "plus") {
                    showNewJournal = true
                }
            }
            .searchable(text: $viewModel.searchText)
            .sheet(isPresented: $showNewJournal) {
                NewJournalView(viewModel: viewModel)
            }
            .sheet(item: $journalToEdit) { journal in
                EditJournalView(viewModel: viewModel, journal: journal)
            }
        }
        .preferredColorScheme(.dark)
        .overlay {
            if showDeleteAlert {
                DeleteAlertView(
                    isPresented: $showDeleteAlert,
                    viewModel: viewModel,
                    journal: journalToDelete
                )
            }
        }
    }
}

#Preview {
    MainView()
}
