//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Mehmet Alp Sönmez on 20/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var lengthInput: Double = 0
    @State private var selectedLengthInput = "meters"
    @State private var selectedLengthOutput = "meters"
    
    @State private var temperatureInput: Double  = 0
    @State private var selectedTemperatureInput = "Celcius"
    @State private var selectedTemperatureOutput = "Celcius"
    
    @State private var timeInput: Double  = 0
    @State private var selectedTimeInput = "minutes"
    @State private var selectedTimeOutput = "minutes"
    
    @State private var volumeInput: Double  = 0
    @State private var selectedVolumeInput = "liters"
    @State private var selectedVolumeOutput = "liters"
    
    @FocusState private var amountIsFocused: Bool
    
    var lengthUnits = ["meters", "km", "feet", "yards", "miles"]
    var temperatureUnits = ["Celcius", "Fahrenheit", "Kelvin"]
    var timeUnits = ["seconds", "minutes", "hours", "days"]
    var volumeUnits = ["liters", "milliliters", "cups", "pints", "galons"]
    
    var convertLengthInput: Double {
        let enteredUnit = selectedLengthInput
        let output = lengthInput
        
        switch enteredUnit {
        case "meters":
            return output
        case "km":
            return output * 1000
        case "feet":
            return output * 0.3048
        case "yards":
            return output * 0.9144
        case "miles":
            return output * 1609.344
        default:
            return output
        }
    }
    
    var lengthOutput: Double {
        let conversionOutput = convertLengthInput
        
        switch selectedLengthOutput {
        case "meters":
            return conversionOutput
        case "km":
            return conversionOutput / 1000
        case "feet":
            return conversionOutput / 0.3048
        case "yards":
            return conversionOutput / 0.9144
        case "miles":
            return conversionOutput / 1609.344
        default:
            return conversionOutput
        }
    }
    
    var convertTemperatureInput: Double {
        let output = temperatureInput
        
        switch selectedTemperatureInput {
        case "Celcius":
            return output
        case "Fahrenheit":
            return (output - 32) / (1.8)
        case "Kelvin":
            return (output - 273.15)
        default:
            return output
        }
    }
    
    var temperatureOutput: Double{
        let conversionOutput = convertTemperatureInput
        switch selectedTemperatureOutput {
        case "Celcius":
            return conversionOutput
        case "Fahrenheit":
            return (conversionOutput * 1.8) + 32
        case "Kelvin":
            return (conversionOutput + 273.15)
        default:
            return conversionOutput
        }
    }
    
    var convertTimeInput: Double {
        let output = timeInput
        
        switch selectedTimeInput {
        case "seconds":
            return output / 60
        case "minutes":
            return output
        case "hours":
            return output * 60
        case "days":
            return output * 24 * 60
        default:
            return output
        }
    }
        
    var timeOutput: Double {
        let output = convertTimeInput
            
        switch selectedTimeOutput {
        case "seconds":
            return output * 60
        case "minutes":
            return output
        case "hours":
            return output / 60
        case "days":
            return output / (24*60)
        default:
            return output
        }
    }
    
    var volumeConversion: Double {
        let output = volumeInput
        switch selectedVolumeInput {
        case "liters":
            return output
        case "milliliters":
            return output / 1000
        case "cups":
            return output * 0.2365882365
        case "pints":
            return output * 0.473176473
        case "galons":
            return output * 3.785411784
        default:
            return output
        }
    }
    
    var volumeOutput: Double {
        let output = volumeConversion
        switch selectedVolumeOutput {
        case "liters":
            return output
        case "milliliters":
            return output * 1000
        case "cups":
            return output / 0.2365882365
        case "pints":
            return output / 0.473176473
        case "galons":
            return output * 3.785411784
        default:
            return output
        }
    }
    

    var body: some View {
        NavigationStack {
            Form {
                Section  {
                    TextField("Enter the Length Value", value: $lengthInput, format: .number ) .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Choose length Unit", selection: $selectedLengthInput) {
                        ForEach(lengthUnits, id: \.self) {
                            unit in Text(unit)
                        }
                    }
                    
                    Picker("Choose the conversion unit", selection: $selectedLengthOutput){
                        ForEach(lengthUnits, id: \.self) {
                            unit in Text(unit)
                        }
                    }
                    Text("Conversion result")
                    Text("\(lengthOutput, specifier: "%.6f") \(selectedLengthOutput)")
                } header: {
                    Text("Length")
                }
//                Temperature Section Starts
                Section {
                    TextField("Enter the Temperature Value", value: $temperatureInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Choose Temperature Unit", selection: $selectedTemperatureInput) {
                        ForEach(temperatureUnits, id: \.self) {
                            unit in Text(unit)
                        }
                    }
                    Picker("Choose the conversion Unit", selection: $selectedTemperatureOutput) {
                        ForEach(temperatureUnits, id: \.self) {
                            unit in Text(unit)
                        }
                    }
                    Text("Conversion Result")
                    Text("\(temperatureOutput, specifier: "%.6f") \(selectedTemperatureOutput)")
                } header: {
                    Text("Temperature")
                }
//                Time Section Starts
                Section {
                    TextField("Enter the Time Value", value: $timeInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Choose the Entered Time Unit", selection: $selectedTimeInput) {
                        ForEach(timeUnits, id: \.self) {
                            unit in Text(unit)
                        }
                    }.pickerStyle(.segmented)
                    
                    Picker("Choose the conversion Unit", selection: $selectedTimeOutput){
                        ForEach(timeUnits, id: \.self) {
                            unit in Text(unit)
                        }
                    }
                    Text("Conversion Result")
                    Text("\(timeOutput, specifier: "%.2f") \(selectedTimeOutput)")
                } header: {
                    Text("Time")
                }
                
//                Volume Section Starts
                Section("Volume") {
                    TextField("Enter the Volume Value", value: $volumeInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Choose the Entered Volume Unit", selection: $selectedVolumeInput) {
                        ForEach(volumeUnits, id: \.self) {
                            unit in Text(unit)
                        }
                    }
                    Picker("Choose the conversion Unit", selection:  $selectedVolumeOutput) {
                        ForEach(volumeUnits, id: \.self) {
                            unit in Text(unit)
                        }
                    }
                    Text("Conversion Result")
                    Text("\(volumeOutput, specifier: "%.3f") \(selectedVolumeOutput)")
                }
            }
            .navigationTitle("Unit Conversion")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                if amountIsFocused {
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
