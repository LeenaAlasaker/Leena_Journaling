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

    // مذكرة جديدة فاضية، تاخذ تاريخ اليوم لحالها
    @State private var journal = Journal(title: "", content: "")

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
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", systemImage: "checkmark") {
                        viewModel.addJournal(journal)
                        dismiss()
                    }
                    .buttonStyle(.glassProminent)
                    .tint(Color("PrimaryAccent"))
                }
            }
        }
        .presentationBackground(Color("CardColor"))
    }
}

#Preview {
    NewJournalView(viewModel: JournalViewModel())
        .preferredColorScheme(.dark)
}
