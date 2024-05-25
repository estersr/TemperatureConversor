//
//  ContentView.swift
//  TemperatureConversor
//
//  Created by Esther Ramos on 25/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput = 0.0
    @FocusState private var temperatureIsFocused: Bool
    let temperatureOptions = ["Celsius", "Fahrenheit", "Kelvin"]
    @State var inputTemperature = "Celsius"
    @State var outputTemperature = "Fahrenheit"
    
    var finalResult: Double {
        switch inputTemperature {
        case "Fahrenheit":
            
            switch outputTemperature {
            case "Fahrenheit":
                return userInput
            case "Kelvin":
                return fahrenheitToKelvin
            default:
                return fahrenheitToCelsius
            }
            
        case "Kelvin":
            switch outputTemperature {
            case "Kelvin":
                return userInput
            case "Fahrenheit":
                return kelvinToFahrenheit
            default:
                return kelvinToCelsius
            }
            
        default:
            switch outputTemperature {
            case "Kelvin":
                return celsiusToKelvin
            case "Fahrenheit":
                return celsiusToFahrenheit
            default:
                return userInput
            }
        }
    }
    
    var celsiusToFahrenheit: Double {
        return userInput * 9/5 + 32
    }
    
    var fahrenheitToCelsius: Double {
        return (userInput - 32) * 5/9
    }
    
    var celsiusToKelvin: Double {
        return userInput + 273.15
    }
    
    var kelvinToCelsius: Double {
        return userInput - 273.15
    }
    
    var fahrenheitToKelvin: Double {
        return (userInput - 32) * 5/9 + 273.15
    }
    
    var  kelvinToFahrenheit: Double {
        return (userInput - 273.15) * 9/5 + 32
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Number to Convert") {
                    TextField("Insert the number", value: $userInput, format:.number)
                        .keyboardType(.decimalPad)
                        .focused($temperatureIsFocused)
                    
                    Picker("Select the initial unit", selection: $inputTemperature) {
                        ForEach(temperatureOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Converting into..", selection: $outputTemperature) {
                        ForEach(temperatureOptions, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section ("Conversion result") {
                    Text(finalResult, format: .number)
                }
            }
            .navigationTitle("TemperatureConversor")
            .toolbar {
                if temperatureIsFocused {
                    Button ("Done") {
                        temperatureIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
