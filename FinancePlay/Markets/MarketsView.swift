//
//  MarketsView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

struct MarketsView: View {
    @State private var searchText: String = ""
    @State private var showMarketsInfo: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Markets")
            }
            .toolbar {
                ToolbarItem {
                    Button("Hello", systemImage: "info") {
                        showMarketsInfo.toggle()
                    }
                }
            }
            .navigationTitle("Markets")
            .searchable(text: .constant(""))
            .sheet(isPresented: $showMarketsInfo) {
                Text("hello")
            }
        }
    }
}

#Preview {
    MarketsView()
}
