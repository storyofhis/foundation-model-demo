//
//  ContentView.swift
//  fm
//
//  Created by Maula Izza Azizi on 05/09/26.
//

import SwiftUI

struct ContentView: View {

    @State private var activity = "olahraga"
    @State private var reminder = ""

    var body: some View {
        VStack(spacing: 24) {

            TextField("Aktivitas", text: $activity)
                .textFieldStyle(.roundedBorder)

            Text(reminder.isEmpty ? "Tulis aktivitas, lalu tekan tombol." : reminder)
                .font(.title3)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, minHeight: 120)

            Button("Ingetin") {
                generate()
            }
            .buttonStyle(.borderedProminent)
            .disabled(activity.trimmingCharacters(in: .whitespaces).isEmpty)
        }
        .padding()
        .animation(.default, value: reminder)
    }

    private func generate() {
        reminder = ReminderData.getData().randomElement()?.message ?? ""
    }
}

#Preview {
    ContentView()
}
