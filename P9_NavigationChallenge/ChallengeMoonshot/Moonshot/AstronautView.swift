//
//  AstronautView.swift
//  Moonshot
//
//  Created by Rahul Raoniar on 10/09/2026.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
            
                Text(astronaut.description)
                    .padding()
            }
            
        }
        .background(Color.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
