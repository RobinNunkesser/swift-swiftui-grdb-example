//
//  ContentView.swift
//  GRDBExample
//
//  Created by Prof. Dr. Nunkesser, Robin on 03.07.23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.appDatabase) private var appDatabase
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }.onAppear(perform: {
            try! appDatabase.savePlayer(Player(id: "1", name: "Arthur", score: 100))
            let players = try! appDatabase.fetchAllPlayers()
            print(players)
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
