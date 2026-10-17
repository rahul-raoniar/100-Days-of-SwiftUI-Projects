//
//  ContentView.swift
//  Moonshot
//
//  Created by Rahul Raoniar on 09/09/2026.

//** As now the decode function (from Bundle-Decodable.swift) can decode any type of data so, we need to define while decoding "astronaut.json in what format we want it
//** Here the format is [String: Astronaut] dictionary or [Mission]

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = false
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
            .navigationDestination(for: Astronaut.self) { astronaut in
                AstronautView(astronaut: astronaut)
            }
            .navigationTitle("Moonshot")
            .background(Color.darkBackground)
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    Image(
                        systemName: showingGrid ? "list.bullet" : "square.grid.2x2"
                    )
                }
            }
        }
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    ContentView()
}
