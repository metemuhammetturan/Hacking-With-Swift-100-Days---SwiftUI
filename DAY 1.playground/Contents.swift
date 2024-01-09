import SwiftUI


// — CODING SPECIES —

// Creating Variables

/*

    var name = "Mete"                    // Changeable variable.
    
    let name = "Mete"                     // Unchangeable variable.

 */

// Creating String

    let fileName = "paris.jpg"                // Emoji
    let message = ("She said\"Hello!\". ")         // If u want to put new double quotes in to double quotes you should put backslash before from other double quotes.
    


    let movie = """
    A day in
    the life of an
    should use triple double quotes.
    Apple engineer
    """  //if you want to make line breaks you


// Calculating Name Length

    let actor = "mete"

    print(actor.count)            // Printing to the screen

    let nameLength = actor.count
    print(nameLength)

    print(actor.uppercased())

// Checking

    print(movie.hasPrefix("A day"))             // hasPrefix lets us know whether a string starts with some letters of our choosing.

    print(actor.hasSuffix(".jpg"))            // hasSuffix() checks whether a string ends with some text
    
    print(120.isMultiple(of: 3))                // isMultiple(of: ) checks is the 120 multiple of 3.
