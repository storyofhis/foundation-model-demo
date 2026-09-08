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
    @State private var sedangJalan = false
    @State private var pakaiCadangan = false

    var body: some View {
        VStack(spacing: 24) {

            TextField("Aktivitas", text: $activity)
                .textFieldStyle(.roundedBorder)

            Text(reminder.isEmpty ? "Tulis aktivitas, lalu tekan tombol." : reminder)
                .font(.title3)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, minHeight: 120)
            
            if pakaiCadangan {
                Text("Model tidak menjawab — ini teks cadangan.")
                    .font(.caption)
                    .foregroundStyle(.orange)
            }

            Button(sedangJalan ? "Sebentar…" : "Ingetin") {
                Task { await generate() }
            }
            .buttonStyle(.borderedProminent)
            .disabled(activity.trimmingCharacters(in: .whitespaces).isEmpty)
        }
        .padding()
        .animation(.default, value: reminder)
    }

    private func generate() async {
        reminder = ReminderData.getData().randomElement()?.message ?? ""
    }
}

#Preview {
    ContentView()
}
