//
//  ContentView.swift
//  Day 20 to 22 - Project 2
//
//  Created by Mete Turan on 7.03.2024.
//

import SwiftUI


struct CapsuleText: View {
    var body: some View {
        
        var message : String
        
        Text(message)
            .font()
    }
}


struct ContentView: View {
    

    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria","Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(colors: [.purple,.black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 30){
                VStack(){
                    Text("Tap the flag of")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.background)
                    Text(countries[correctAnswer])
                        .font(.title.bold())
                        .foregroundStyle(.white)

                }
                
                ForEach(0..<3) { number in
                    Button{
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                    }
                    .clipShape(.capsule)
                    .shadow(radius: 20)
                    
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
        
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
        
    
}

#Preview {
    ContentView()
}
