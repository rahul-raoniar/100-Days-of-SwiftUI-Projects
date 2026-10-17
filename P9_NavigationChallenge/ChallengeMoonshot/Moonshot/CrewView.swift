//
//  CrewView.swift
//  Moonshot
//
//  Created by Rahul Raoniar on 14/09/2026.
//

import SwiftUI

struct CrewView: View {
    
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { CrewMember in
                    NavigationLink(value: CrewMember.astronaut) {
                        HStack {
                            Image(CrewMember.astronaut.id)
                                .resizable()
                                .frame(width:100, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1))
                            VStack(alignment: .leading) {
                                Text(CrewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(CrewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}


