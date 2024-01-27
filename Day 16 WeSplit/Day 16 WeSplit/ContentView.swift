//
//  ContentView.swift
//  Day 16 WeSplit
//
//  Created by Mete Turan on 27.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    let student = ["Harry","Harmione","Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack{
            Form{
                Picker("Select a Student", selection: $selectedStudent){
                    ForEach(student, id:\.self){
                        Text($0)
                    }
                }
            }
        }
        .navigationTitle("Student Selecting")
        
    }
}

#Preview {
    ContentView()
}
