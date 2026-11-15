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

            // الخلفية الغامقة
            Color.black.opacity(0.6)
                .ignoresSafeArea()

            // الكارد
            VStack(alignment: .leading, spacing: 8) {
                Text("Delete Journal?")
                    .font(.headline)

                Text("Are you sure you want to delete this journal?")
                    .foregroundStyle(.gray)

                HStack(spacing: 12) {

                    // زر Cancel
                    Button {
                        isPresented = false
                    } label: {
                        Text("Cancel")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(white: 0.2))
                            .clipShape(Capsule())
                    }

                    // زر Delete
                    Button {
                        if let journal = journal {
                            viewModel.deleteJournal(journal)
                        }
                        isPresented = false
                    } label: {
                        Text("Delete")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.red)
                            .clipShape(Capsule())
                    }
                }
                .foregroundStyle(.white)
                .padding(.top, 12)
            }
            .padding(20)
            .background(Color(white: 0.1))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(.horizontal, 30)
        }
    }
}
