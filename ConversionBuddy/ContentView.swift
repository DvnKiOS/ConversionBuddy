//
//  ContentView.swift
//  ConversionBuddy
//
//  Created by Devin King on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnitNumber = ""
    @State private var outputUnitNumber = ""
    
    @State private var inputUnit = 1
    @State private var outputUnit = 1
    
    let measurementUnits = ["miles", "kilometers", "feet" , "yards", "meters"]
    
    var convertedValue: Double {
        let inputValue = Double(inputUnitNumber) ?? 0
        var footValue = inputValue
        
        // Conversion logic based on selected units
        var outputValue = Double(outputUnitNumber) ?? 0
        
        switch measurementUnits[inputUnit] {
        case "meters":
            footValue = inputValue * 3.28
        case "kilometers":
            footValue = inputValue * 3280.84
        case "feet":
            footValue = inputValue
        case "yards":
            footValue = inputValue * 3
        case "miles":
            footValue = inputValue * 5280
        default:
            footValue = inputValue * 3.28
        }
        
        switch measurementUnits[outputUnit] {
        case "meters":
            outputValue = footValue / 3.28
        case "kilometers":
            outputValue = footValue / 3280.84
        case "feet":
            outputValue = footValue / 1
        case "yards":
            outputValue = footValue / 3
        case "miles":
            outputValue = footValue / 5280
        default:
            outputValue = footValue / 3.28
        }
        
        return outputValue
    }
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("\(measurementUnits[inputUnit])")) {
                        TextField("Amount", text: $inputUnitNumber)
                            .keyboardType(.numberPad)
                        Picker("First unit of measurement", selection: $inputUnit) {
                            ForEach(0..<measurementUnits.count, id: \.self) { index in
                                Text(measurementUnits[index])
                            }
                        }.pickerStyle(.segmented)
                    }
                    
                    Section(header: Text("\(measurementUnits[outputUnit])")) {
                        Text("\(convertedValue, specifier: "%.5f")")
                            .keyboardType(.numberPad)
                        Picker("Second unit of measurement", selection: $outputUnit) {
                            ForEach(0..<measurementUnits.count, id: \.self) { index in
                                Text(measurementUnits[index])
                            }
                        }.pickerStyle(.segmented)
                    }
                }
                .navigationTitle("Conversion Buddy📏")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
