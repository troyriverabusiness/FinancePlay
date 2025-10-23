//
//  EducationTopicView.swift
//  FinancePlay
//
//  Created by troy on 23.10.25.
//

import SwiftUI

struct EducationTopicView: View {
    let topic: String
    
    var body: some View {
        ScrollView {
            /// Short Description
            Text("\(topic)")
            
            /// Infographics
            
            
            /// Detailed Explanation with intermediate cutout
            
            /// Quiz Button
            NavigationLink("Hello") {
                Text("quiz here")
            }
        }
        .navigationTitle(topic)
    }
}

#Preview {
    EducationTopicView(topic: "Markets")
}
