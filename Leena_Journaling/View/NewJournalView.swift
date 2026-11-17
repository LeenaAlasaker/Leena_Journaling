//
//  NewJournalView.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 15/11/2026.
//

import SwiftUI

struct NewJournalView: View {

    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) var dismiss

    @State private var journal = Journal(title: "", content: "")

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
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        viewModel.addJournal(journal)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.black)
                    }
                    .buttonStyle(.glassProminent)
                    .tint(Color("PrimaryAccent"))
                }
            }
        }
        .presentationBackground(Color(.secondarySystemBackground))
    }
}

#Preview {
    NewJournalView(viewModel: JournalViewModel())
}
