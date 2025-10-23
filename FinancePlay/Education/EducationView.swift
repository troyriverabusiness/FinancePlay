//
//  EducationView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

struct EducationView: View {
    let topics: [EducationTopic] = EducationTopic.topics
    
    var body: some View {
        NavigationStack {
            ScrollView {
                /// Learning Progress Section
                EducationProgressView(topics: topics)
                
                /// Topic Section
                EducationTopicsListView(topics: topics)
            }
            .navigationTitle("Education")
        }
    }
}

#Preview {
    EducationView()
}
