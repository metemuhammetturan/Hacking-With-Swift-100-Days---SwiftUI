//
//  ContentView.swift
//  Day 19 - Conversation App
//
//  Created by Mete Turan on 28.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue: Double = 0.0
    @State private var inputUnit: String = "Celsius"
    @State private var outputUnit: String = "Fahrenheit"
    
    var convertedValue: Double
    {
        
        var result: Double = 0.0
        
        switch(inputUnit,outputUnit)
        {
        case ("Celsius", "Fahrenheit"):
            result = (inputValue * 9 / 5) + 32
            
        case ("Fahrenheit", "Celsius"):
            result = (inputValue - 32) * 5 / 9
            
        case ("Celsius", "Kelvin"):
            result = inputValue + 273.15
            
        case ("Kelvin", "Celsius"):
            result = inputValue - 273.15
            
        default:
            break
        }
        
        return result
    }

    
    var body: some View {
        
        NavigationView
        {
            Form
            {
                Section(header: Text("Enter a Value"))
                {
                    TextField("Value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Select Units"))
                {
                    Picker("Input Unit", selection: $inputUnit)
                    {
                        Text("Celsius").tag("Celsius")
                        Text("Fahrenheit").tag("Fahrenheit")
                        Text("Kelvin").tag("Kelvin")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Picker("Output Unit", selection: $outputUnit)
                    {
                        Text("Celsius").tag("Celsius")
                        Text("Fahrenheit").tag("Fahrenheit")
                        Text("Kelvin").tag("Kelvin")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Conversion Result"))
                {
                    Text("\(convertedValue, specifier: "%.2f")")
                }
            }
            .navigationTitle("Unit Converter")
        }
        
        
    }
}

#Preview {
    ContentView()
    }
