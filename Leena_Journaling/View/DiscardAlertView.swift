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
                        .background(Color(.tertiarySystemFill))
                        .clipShape(Capsule())
                }

                Button {
                    isPresented = false
                } label: {
                    Text("Keep Editing")
                        .foregroundStyle(Color("TextPrimary"))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.tertiarySystemFill))
                        .clipShape(Capsule())
                }
            }
            .padding(20)
            .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 30))
            .frame(maxWidth: 320)
            .padding()
        }
    }
}
