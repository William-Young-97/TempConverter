//
//  ContentView.swift
//  TempConverter
//
//  Created by EngineerBetter on 20/09/2022.
//

import SwiftUI

var dollarFormatter : FloatingPointFormatStyle<Double>.Currency {
    let currencyCode = Locale.current.currencyCode ?? "USD"
    return FloatingPointFormatStyle<Double>.Currency(code: currencyCode)
}

struct ContentView: View {
    @State private var temperature = 0.0
    @State private var people = 2
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Fahrenheit"
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    let units2 = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedTemp: Double {
        // Use a case statment for the combos of input and output
        switch (inputUnit, outputUnit) {
        case ("Celsius", "Fahrenheit"):
            return Double((temperature * 9/5) + 32)
        case ("Celsius", "Kelvin"):
            return Double(temperature + 273.15)
        case ("Fahrenheit", "Celsius"):
            return Double((temperature - 32) * 5/9)
        case ("Fahrenheit", "Kelvin"):
            return Double((temperature - 32) * 5/9 + 273.15)
        case ("Kelvin", "Celsius"):
            return Double(temperature - 273.15)
        case ("Kelvin", "Fahrenheit"):
            return Double((temperature - 273.15) * 9/5 + 32)
        default:
            return temperature
        }
    }
    
    @FocusState private var amountIsFocused: Bool
    
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Temperature input", value: $temperature, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Please input your temperature.")
                }
                
                Section{
                    Picker("Input unit", selection: $inputUnit){
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Select input unit.")
                }
                
                Section {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(units2, id: \.self) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Select output unit.")
                }
                
                Section {
                    Text("\(convertedTemp)")
                } header: {
                    Text("Select output unit.")
                }
                
         
            }
            .navigationTitle("TemperatureConverter")
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
