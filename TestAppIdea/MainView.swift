//
//  MainView.swift
//  TestAppIdea
//
//  Created by Jake Gibbons on 19/06/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        NavigationStack{
            Text("This is the main view")
                .font(.title3)
            Image(systemName: "globe")
                .foregroundStyle(.blue)
                .font(.largeTitle)
                .scaleEffect(1.5, anchor: .center)
                .offset(y: 30)
                .navigationTitle("Main View")
            .toolbar{
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Label(
                            title: { Text("Settings") },
                            icon: { Image(systemName: "gear") }
                        )
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    MainView()
}
