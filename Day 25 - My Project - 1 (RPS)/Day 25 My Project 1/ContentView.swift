//
//  ContentView.swift
//  Day 25 My Project 1
//
//  Created by Mete Turan on 8.03.2024.
//

import SwiftUI



struct ContentView: View {
    

    @State private var usersScore = 0
    
    let movements = ["Rock", "Paper", "Scissors"]
    @State private var appSelectedMovementIndex = Int.random(in: 0..<3)
    @State private var userSelectedMovementIndex = 0
    
    let winLose = ["Win","Lose"]
    @State private var appRequestedWinLoseIndex = Int.random(in: 0..<2)

    
    // İstenen özellik şu: app win lose ve movement belirlesin kullanıcı win lose'a göre hareket yapsın
    

        
    
    
    var body: some View {
        VStack {
            
            Text("Your score is \(usersScore)")
            
            Text("App's movement selection: \(movements[appSelectedMovementIndex])")
            
            Text("App's wanted win & lose selection: \(winLose[appRequestedWinLoseIndex])")
            
            Section("Your Choice of Movement"){
                
                Picker("What will you select?", selection: $userSelectedMovementIndex){
                    ForEach(0..<movements.count){ i in
                        Text(movements[i]).tag(i)
                    }
                }.pickerStyle(.menu)
            }
            
        }
        .onChange(of: userSelectedMovementIndex) { newValue in
            updateScore()
        }
    }
    
    
    func updateScore() {
            let userMovement = movements[userSelectedMovementIndex]
            let appMovement = movements[appSelectedMovementIndex]
            
            let userWins = (userMovement == "Rock" && appMovement == "Scissors") ||
                           (userMovement == "Scissors" && appMovement == "Paper") ||
                           (userMovement == "Paper" && appMovement == "Rock")
            
            let userLoses = (appMovement == "Rock" && userMovement == "Scissors") ||
                            (appMovement == "Scissors" && userMovement == "Paper") ||
                            (appMovement == "Paper" && userMovement == "Rock")
            
            if appRequestedWinLoseIndex == 0 {
                if userWins {
                    usersScore += 1
                }
            } else {
                if userLoses {
                    usersScore -= 1
                }
            }
            
            // Yeni rastgele hareket ve kazanma/kaçırma seçimleri oluştur
            appSelectedMovementIndex = Int.random(in: 0..<3)
            appRequestedWinLoseIndex = Int.random(in: 0..<2)
        }
    
}

















/*
 AÇILIR EKRANLI VERSION
 
 struct ContentView: View {
     
     @State private var userScore = 0
     
     let movements = ["Rock", "Paper", "Scissors"]
     @State private var appSelectedMovementIndex = Int.random(in: 0..<3)
     @State private var userSelectedMovements = [Int]()
     
     let winLose = ["Win", "Lose"]
     @State private var appRequestedWinLoseIndex = Int.random(in: 0..<2)
     
     @State private var isSelectionScreenPresented = false
     
     var body: some View {
         VStack {
             Form {
                 Text("Your score is: \(userScore)")
                 
                 Text("App's movement selection: \(movements[appSelectedMovementIndex])")
                 
                 Text("App's wanted win & lose selection: \(winLose[appRequestedWinLoseIndex])")
                 
                 Section("Your Choice of Movement") {
                     Button("Make Your Selection") {
                         isSelectionScreenPresented.toggle()
                     }
                 }
             }
         }
         .sheet(isPresented: $isSelectionScreenPresented, content: {
             MovementSelectionView(movements: movements, didSelectMovement: { movementIndex in
                 userSelectedMovements.append(movementIndex)
                 isSelectionScreenPresented.toggle()
                 updateScore()
             })
         })
     }
     
     func updateScore() {
         guard let userLastMovementIndex = userSelectedMovements.last else {
             return
         }
         
         let userMovement = movements[userLastMovementIndex]
         let appMovement = movements[appSelectedMovementIndex]
         
         let userWins = (userMovement == "Rock" && appMovement == "Scissors") ||
                        (userMovement == "Scissors" && appMovement == "Paper") ||
                        (userMovement == "Paper" && appMovement == "Rock")
         
         let userLoses = (appMovement == "Rock" && userMovement == "Scissors") ||
                         (appMovement == "Scissors" && userMovement == "Paper") ||
                         (appMovement == "Paper" && userMovement == "Rock")
         
         if appRequestedWinLoseIndex == 0 {
             if userWins {
                 userScore += 1
             }
         } else {
             if userLoses {
                 userScore += 1
             }
         }
         
         // Yeni rastgele hareket ve kazanma/kaçırma seçimleri oluştur
         appSelectedMovementIndex = Int.random(in: 0..<3)
         appRequestedWinLoseIndex = Int.random(in: 0..<2)
     }
 }

 struct MovementSelectionView: View {
     let movements: [String]
     let didSelectMovement: (Int) -> Void
     
     var body: some View {
         VStack {
             Text("Select Your Movement")
                 .font(.title)
                 .padding()
             
             ForEach(0..<movements.count) { index in
                 Button(action: {
                     didSelectMovement(index)
                 }) {
                     Text(movements[index])
                         .padding()
                 }
             }
         }
     }
 }

 
 
 
 */


#Preview {
    ContentView()
}

