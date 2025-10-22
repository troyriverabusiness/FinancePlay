//
//  EducationView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

struct EducationView: View {
    /// TODO: Change to actual learning topics
    let topics: [String] = ["Markets", "Portfolio", "Taxes", "Stocks"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                /// Learning Progress Section
                EducationProgressView(topics: topics)
                
                /// Topic Section
                EducationItemsListView(topics: topics)
            }
            .navigationTitle("Education")
        }
    }
}

#Preview {
    EducationView()
}
