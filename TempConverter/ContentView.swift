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
