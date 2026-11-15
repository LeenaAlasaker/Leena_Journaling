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
            VStack(alignment: .leading) {

                TextField("Title", text: $journal.title)
                    .font(.system(size: 34, weight: .bold))

                Text(journal.formattedDate)
                    .foregroundStyle(.gray)

                TextField("Type your Journal...", text: $journal.content, axis: .vertical)

                Spacer()
            }
            .padding()
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
                    Button("Save", systemImage: "checkmark") {
                        viewModel.updateJournal(journal)
                        dismiss()
                    }
                    .buttonStyle(.glassProminent)
                    .tint(Color("TextAccent"))
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
        .presentationBackground(Color("CardColor"))
    }
}
