//
//  ContentView.swift
//  WeCompare
//
//  Created by Eastwood on 25.05.2023.
//

import SwiftUI

struct ContentView: View {

    @State private var firstMeasure = "meters"
    @State private var secontMeasure = "meters"
    @State private var count = 1.0

    @FocusState private var countIsFocused: Bool

    let measuresOfLength = ["meters", "kilometers", "feet", "yards", "miles"]
    var metersCount: Double {
        switch firstMeasure {
        case "kilometers": return count*1000
        case "feet": return count*0.3
        case "yards": return count*0.91
        case "miles": return count*1609.34
        default: return count
        }
    }

    var result: Double {
        switch secontMeasure {
        case "kilometers": return metersCount/1000
        case "feet": return count/0.3
        case "yards": return count/0.91
        case "miles": return count/1609.34
        default: return metersCount
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker ("Measure of length", selection: $firstMeasure) {
                        ForEach(measuresOfLength, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    TextField("Count", value: $count, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($countIsFocused)
                } header: {
                    Text("Выберите меру длины и введите значение")
                }
                Section {
                    Picker ("Measure of length", selection: $secontMeasure) {
                        ForEach(measuresOfLength, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    Text(result, format: .number)
                } header: {
                    Text("Выберите во что хотите преобразовать")
                }
            }

            .navigationTitle("WeCompare")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        countIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
