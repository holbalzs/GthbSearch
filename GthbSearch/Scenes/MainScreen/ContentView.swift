//
//  ContentView.swift
//  GthbSearch
//
//  Created by Holló Balázs on 2025. 02. 18..
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel = ViewModel()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
