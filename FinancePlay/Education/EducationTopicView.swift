//
//  EducationTopicView.swift
//  FinancePlay
//
//  Created by troy on 23.10.25.
//

import SwiftUI

struct EducationTopicView: View {
    let topic: EducationTopic
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                /// Short Description
                Text(topic.description)
                    .font(.headline)
                
                /// Infographics
                
                
                /// Detailed Explanation with intermediate cutout
                ParagraphsView(paragraphs: topic.explanation)
                
                /// Quiz Button
                QuizButton()

            }
            .padding()
        }
        .navigationTitle(topic.name)
    }
}

private struct QuizButton: View {
    var body: some View {
        NavigationLink {
            /// TODO: adapt for quiz
            QuizOverView(quiz: Quiz.example)
        } label: {
            Label("Test your Knowledge", systemImage: "graduationcap")
        }
    }
}

#Preview {
    EducationTopicView(topic: EducationTopic.topics.first!)
}
