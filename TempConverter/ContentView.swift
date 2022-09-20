//
//  ContentView.swift
//  TempConverter
//
//  Created by William Young on 20/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var temperature = 0.0
    @State private var people = 2
    @State private var inputUnit = "Celsius °C"
    @State private var outputUnit = "Fahrenheit °F"
    
    let units = ["Celsius °C", "Fahrenheit °F", "Kelvin K"]
    let units2 = ["Celsius °C", "Fahrenheit °F", "Kelvin K"]
    
    var convertedTemp: Double {
        switch (inputUnit, outputUnit) {
        case ("Celsius °C", "Fahrenheit °F"):
            return Double((temperature * 9/5) + 32)
        case ("Celsius °C", "Kelvin K"):
            return Double(temperature + 273.15)
        case ("Fahrenheit °F", "Celsius °C"):
            return Double((temperature - 32) * 5/9)
        case ("Fahrenheit °F", "Kelvin K"):
            return Double((temperature - 32) * 5/9 + 273.15)
        case ("Kelvin K", "Celsius °C"):
            return Double(temperature - 273.15)
        case ("Kelvin K", "Fahrenheit °F"):
            return Double((temperature - 273.15) * 9/5 + 32)
        default:
            return temperature
        }
    }
    
    var tempSymbol: String {
        switch outputUnit {
        case "Celsius °C":
            return "°C"
        case "Kelvin K":
            return "K"
        case "Fahrenheit °F":
            return "°F"
        default:
            return "?"
        }
    }
    
    @FocusState private var amountIsFocused: Bool
    
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Temperature input...)", value: $temperature, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Please input your temperature.")
                }
                
                Section{
                    Picker("Input unit...", selection: $inputUnit){
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Select input unit.")
                }
                
                Section {
                    Picker("Output unit...", selection: $outputUnit) {
                        ForEach(units2, id: \.self) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Select output unit.")
                }
                
                Section {
                    Text("\(convertedTemp) \(tempSymbol)")
                } header: {
                    Text("Your converted temperature is:")
                }
                
         
            }
            .navigationTitle("TempConverter")
            .multilineTextAlignment(.leading)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
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
