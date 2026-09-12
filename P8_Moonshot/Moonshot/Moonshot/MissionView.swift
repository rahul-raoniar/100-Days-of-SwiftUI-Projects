//
//  MissionView.swift
//  Moonshot
//
//  Created by Rahul Raoniar on 12/09/2026.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.60
                    }
                
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(crew, id: \.role) { crewmember in
                            NavigationLink {
                                AstronautView(astronaut: crewmember.astronaut)
                            } label: {
                                HStack {
                                    Image(crewmember.astronaut.id)
                                        .resizable()
                                        .frame(width: 120, height: 70)
                                        .clipShape(.capsule)
                                        .overlay(
                                            Capsule()
                                                .strokeBorder(.white, lineWidth: 1)
                                            )
                                    VStack(alignment: .leading) {
                                        Text(crewmember.astronaut.name)
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                        
                                        Text(crewmember.role)
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                    
                                }
                                .padding(.horizontal)
                            }
                            
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            
            
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing astronaut data: \(member.name)")
            }
                
        }
    }
    
}


#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
