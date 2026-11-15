//
//  DiscardAlertView.swift
//  Leena_Journaling
//
//  Created by Leena Alasaker on 15/11/2026.
//
import SwiftUI

struct DiscardAlertView: View {

    @Binding var isPresented: Bool
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack(alignment: .topLeading) {

            Color.black.opacity(0.4)
                .ignoresSafeArea()

            VStack(spacing: 12) {
                Text("Are you sure you want to discard changes on this journal?")
                    .foregroundStyle(.gray)

                Button {
                    dismiss()
                } label: {
                    Text("Discard Changes")
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(white: 0.25))
                        .clipShape(Capsule())
                }

                Button {
                    isPresented = false
                } label: {
                    Text("Keep Editing")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(white: 0.25))
                        .clipShape(Capsule())
                }
            }
            .padding(20)
            .background(Color(white: 0.12))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .frame(maxWidth: 320)
            .padding()
        }
    }
}
