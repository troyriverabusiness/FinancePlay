//
//  EducationItemsListView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

struct EducationTopicsListView: View {
    let topics: [String]
    
    var body: some View {
        ForEach(topics, id: \.count) { topic in
            NavigationLink {
                EducationTopicView(topic: topic)
            } label: {
                EducationListItem(title: topic, description: "Description for this topic", image: "chart.line.uptrend.xyaxis")
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal)
    }
}

private struct EducationListItem: View {
    let title: String
    let description: String
    let image: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: image)
                .resizable()
                .frame(width: 30, height: 30)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(description)
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
    EducationTopicsListView(topics: ["Markets", "Investing", "Saving"])
}
