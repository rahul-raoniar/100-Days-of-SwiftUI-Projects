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
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(missions) {mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                    .accessibilityHidden(true)
                                
                                VStack {
                                    Text(mission.diaplayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedlaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(Color.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .accessibilityLabel("\(mission.diaplayName), launch date: \(mission.formattedlaunchDate)")
                            .accessibilityHint("View mission details")
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.lightBackground)
                                )
                            
                            
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(Color.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
