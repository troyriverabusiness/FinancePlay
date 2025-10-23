//
//  EducationTopicsListView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

/// List holder
struct EducationProgressView: View {
    let topics: [EducationTopic]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(topics) { topic in
                    EducationTopicCompletionView(topic: topic)
                }
            }
            .padding()
//            .background(
//                Rectangle()
//                    .foregroundStyle(.gray)
//                    .opacity(0.3)
//            )
//            .clipShape(RoundedRectangle(cornerRadius: 40))
        }
    }
}

/// Individual profficiency component
private struct EducationTopicCompletionView: View {
    let topic: EducationTopic
    
    var body: some View {
        VStack {
            AccomplishmentRing(progress: 25)
            Text(topic.name)
                .font(.headline)
        }
        .padding()
        .background(
            Rectangle()
                .foregroundStyle(.gray)
                .opacity(0.1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

/// Ring based off Fitness App
private struct AccomplishmentRing: View {
    var progress: Double
    var color: Color = .green
    var lineWidth: CGFloat = 10
    
    private var normalized: CGFloat {
        CGFloat(progress / 100)
    }
    
    var body: some View {
        ZStack {
            // Background ring
            Circle()
                .stroke(color.opacity(0.2),
                        style: StrokeStyle(lineWidth: lineWidth))
            
            // Progress ring
            Circle()
                .trim(from: 0, to: normalized)
                .stroke(color,
                        style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-180))

            
            // Text inside
            Text("\(Int(progress))%")
                .font(.title3)
                .bold()
        }
        .frame(width: 80)
        .padding()
    }
}

#Preview {
    EducationProgressView(topics: EducationTopic.topics)
}
