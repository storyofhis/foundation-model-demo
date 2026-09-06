//
//  Data.swift
//  fm
//
//  Created by Maula Izza Azizi on 06/09/26.
//


import Foundation

struct ReminderData: Identifiable {
    var id = UUID()
    var activity: String
    var message: String

    static func getData() -> [ReminderData] {
        [
            ReminderData(activity: "olahraga",
                         message: "Yuk olahraga dulu ya, biar badan kamu makin sehat dan happy!"),
            ReminderData(activity: "minum air",
                         message: "Jangan lupa minum air ya, badan kamu lagi butuh itu."),
            ReminderData(activity: "baca buku",
                         message: "Baca buku sepuluh menit dulu yuk, pelan-pelan aja.")
        ]
    }
}
