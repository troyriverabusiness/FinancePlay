//
//  InfoSheetView.swift
//  FinancePlay
//
//  Created by troy on 23.10.25.
//

import SwiftUI

/// View within the sheet that appears when pressing the info toolbar button
struct InfoSheetView: View {
    let topic: EducationTopic
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                InfoHeader(title: topic.name, description: topic.description)
                ParagraphsView(paragraphs: topic.explanation)
            }
            .padding()
        }
    }
}

/// Title & Description View
struct InfoHeader: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.largeTitle)
            Text(description)
                .font(.headline)
        }
    }
}

/// ParagraphsView
struct ParagraphsView: View {
    var paragraphs: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            ForEach(paragraphs, id: \.self) { paragraph in
                Text(paragraph)
            }
        }
    }
}

#Preview {
    InfoSheetView(topic: EducationTopic.topics.first!)
}
