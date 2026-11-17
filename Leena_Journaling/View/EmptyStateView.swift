//
//  L1.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 10/11/2026.
//
import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 16) {

            Image("EmptyStateImage")
                .resizable()
                .scaledToFit()
                .frame(width: 151, height: 97)

            Text("Begin Your Journal")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(Color("TextAccent"))

            Text("Craft your personal diary, tap the plus icon to begin")
                .font(.system(size: 18, weight: .light))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    EmptyStateView()
}
