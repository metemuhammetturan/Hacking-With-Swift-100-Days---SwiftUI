//
//  ContentView.swift
//  Day 17 We Split 2
//
//  Created by Mete Turan on 27.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercantages = [0,5,10,15,20,25]
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        
    }
    
    var totalAmount: Double {
        let totalAmount = (checkAmount + checkAmount/100*Double(tipPercentage))
        
        return totalAmount
    }

    var body: some View {
        
        NavigationStack{
            Form{
                Section("Total Amount & People") {
                    TextField("Amount",value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) People")
                        }
                    }
                }
                
                Section("How much do you want to tip?"){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(tipPercantages, id: \.self){
                            Text($0,format: .percent)
                        }
                    }
                    
                    .pickerStyle(.segmented)
                }
                
                Section("Total Amount"){
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                
                Section("Total Amount Per Person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
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
