//
//  SettingsView.swift
//  EdutainmentV2
//
//  Created by Hossein Sharifi on 23/05/2023.
//

import SwiftUI

import SwiftUI

import SwiftUI

struct SettingsView: View {
    @Binding var gameIsActive: Bool
    @Binding var tableSelection: Int
    @Binding var questionCount: Int

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select table")) {
                    Stepper(value: $tableSelection, in: 1...12) {
                        Text("Up to \(tableSelection) times table")
                    }
                }
                Section(header: Text("Select number of questions")) {
                    Picker("Number of questions", selection: $questionCount) {
                        Text("5").tag(5)
                        Text("10").tag(10)
                        Text("20").tag(20)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Button(action: {
                        self.gameIsActive = true
                    }) {
                        Text("Start Game")
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    @State static var gameIsActive = false
    @State static var tableSelection = 1
    @State static var questionCount = 5

    static var previews: some View {
        SettingsView(gameIsActive: $gameIsActive, tableSelection: $tableSelection, questionCount: $questionCount)
    }
}
