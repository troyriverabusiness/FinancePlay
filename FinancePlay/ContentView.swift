//
//  ContentView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab {
                Text("hello")
            } label: {
                Label("Markets", systemImage: "chart.line.uptrend.xyaxis")
            }
            Tab {
                Text("world")
            } label: {
                Label("Portfolio", systemImage: "chart.pie")
            }
            Tab {
                Text("Hello")
            } label: {
                Label("Education", systemImage: "books.vertical")
            }
        }
    }
}

#Preview {
    ContentView()
}
