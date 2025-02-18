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
            HStack {
                TextField("Search", text: $viewModel.searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button(action: {
                    viewModel.searchRepos()
                }) {
                    Text("Search")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
