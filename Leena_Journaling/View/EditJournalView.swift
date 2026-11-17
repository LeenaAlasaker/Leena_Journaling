//
//  EditJournalView.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 15/11/2026.
//

import SwiftUI

struct EditJournalView: View {

    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) var dismiss

    @State var journal: Journal
    @State private var hasChanges = false
    @State private var showDiscardAlert = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {

                    TextField("Title", text: $journal.title)
                        .font(.system(size: 34, weight: .bold))

                    Text(journal.formattedDate)
                        .foregroundStyle(.gray)

                    TextEditor(text: $journal.content)
                        .scrollContentBackground(.hidden)
                        .frame(minHeight: 300)
                        .overlay(alignment: .topLeading) {
                            if journal.content.isEmpty {
                                Text("Type your Journal...")
                                    .foregroundStyle(.gray)
                                    .padding(.top, 8)
                                    .padding(.leading, 5)
                                    .allowsHitTesting(false)
                            }
                        }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .scrollDismissesKeyboard(.interactively)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close", systemImage: "xmark") {
                        if hasChanges {
                            showDiscardAlert = true
                        } else {
                            dismiss()
                        }
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        viewModel.updateJournal(journal)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.black)
                    }
                    .buttonStyle(.glassProminent)
                    .tint(Color("PrimaryAccent"))
                }
            }
            .onChange(of: journal.title) {
                hasChanges = true
            }
            .onChange(of: journal.content) {
                hasChanges = true
            }
        }
        .overlay {
            if showDiscardAlert {
                DiscardAlertView(isPresented: $showDiscardAlert)
            }
        }
        .interactiveDismissDisabled(hasChanges)
        .presentationBackground(Color(.secondarySystemBackground))
    }
}
