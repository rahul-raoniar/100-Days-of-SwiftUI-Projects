//
//  ListView.swift
//  Moonshot
//
//  Created by Rahul Raoniar on 14/09/2026.
//

import SwiftUI

struct ListLayout: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack(spacing: 20) {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        
                        VStack(alignment: .leading) {
                            Text(mission.diaplayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text(mission.formattedlaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                    }
                }
                .listRowBackground(Color.darkBackground)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return NavigationStack {
        ListLayout(astronauts: astronauts, missions: missions)
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
    }
    .preferredColorScheme(.dark)
}
