//
//  GridLayout.swift
//  Moonshot
//
//  Created by Rahul Raoniar on 14/09/2026.
//

import SwiftUI

struct GridLayout: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
 
    
    var body: some View {
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
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.lightBackground)
                            )
                        
                        
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
        
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return NavigationStack {
        GridLayout(astronauts: astronauts, missions: missions)
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
    }
    .preferredColorScheme(.dark)
}
