//
//  DeleteAlertView.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 15/11/2026.
//
import SwiftUI

struct DeleteAlertView: View {

    @Binding var isPresented: Bool
    @ObservedObject var viewModel: JournalViewModel
    let journal: Journal?

    var body: some View {
        ZStack {

            Color.black.opacity(0.6)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 8) {
                Text("Delete Journal?")
                    .font(.headline)

                Text("Are you sure you want to delete this journal?")
                    .foregroundStyle(.gray)

                HStack(spacing: 12) {

                    Button {
                        isPresented = false
                    } label: {
                        Text("Cancel")
                            .fontWeight(.semibold)
                            .foregroundStyle(Color("TextPrimary"))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.tertiarySystemFill))
                            .clipShape(Capsule())
                    }

                    Button {
                        if let journal = journal {
                            viewModel.deleteJournal(journal)
                        }
                        isPresented = false
                    } label: {
                        Text("Delete")
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.red)
                            .clipShape(Capsule())
                    }
                }
                .padding(.top, 12)
            }
            .padding(20)
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(.horizontal, 30)
        }
    }
}
