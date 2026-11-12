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

            // الصورة
            Image("EmptyStateImage")
                .resizable()
                .scaledToFit()
                .frame(width: 151, height: 97)

            // العنوان البنفسجي
            Text("Begin Your Journal")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(Color("TextAccent"))

            // النص الصغير
            Text("Craft your personal diary, tap the plus icon to begin")
                .font(.system(size: 18, weight: .light))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

#Preview {
    EmptyStateView()
}
