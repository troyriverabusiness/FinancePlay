//
//  EducationItemsListView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

struct EducationTopicsListView: View {
    let topics: [EducationTopic]
    
    var body: some View {
        ForEach(topics) { topic in
            NavigationLink {
                EducationTopicView(topic: topic)
            } label: {
                EducationListItem(topic: topic)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal)
    }
}

private struct EducationListItem: View {
    let topic: EducationTopic
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "info.circle")
                .resizable()
                .frame(width: 30, height: 30)
            VStack(alignment: .leading) {
                Text(topic.name)
                    .font(.headline)
                Text(topic.description)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding()
        .background(
            Rectangle()
                .foregroundStyle(.gray)
                .opacity(0.1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    EducationTopicsListView(topics: EducationTopic.topics)
}
