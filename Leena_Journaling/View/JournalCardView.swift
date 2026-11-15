//
//  JournalCardView.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 15/11/2026.
//

import SwiftUI

struct JournalCardView: View {

    let journal: Journal
    @ObservedObject var viewModel: JournalViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            // العنوان + البوكمارك
            HStack {
                Text(journal.title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color("TextAccent"))

                Spacer()

                Button {
                    viewModel.toggleBookmark(journal)
                } label: {
                    Image(systemName: journal.isBookmarked ? "bookmark.fill" : "bookmark")
                        .font(.title2)
                        .foregroundStyle(Color("TextAccent"))
                }
                .buttonStyle(.plain)
            }

            // التاريخ
            Text(journal.formattedDate)
                .foregroundStyle(.gray)

            // الكلام
            Text(journal.content)
                .padding(.top, 8)
                .lineLimit(5)
        }
        .padding(24)
        //.frame(maxWidth: .infinity, alignment: .leading)
        .frame(maxWidth: .infinity, minHeight: 227, alignment: .topLeading)
        .background(Color("SurfaceCard"))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    JournalCardView(
        journal: Journal(title: "My Birthday", content: "Hello"),
        viewModel: JournalViewModel()
    )
    .preferredColorScheme(.dark)
}
