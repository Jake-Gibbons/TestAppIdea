//
//  AccentColorView.swift
//  TestAppIdea
//
//  Created by Jake Gibbons on 30/06/2024.
//

import SwiftUI

let colorList = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.indigo, Color.purple, Color.mint, Color.gray]

struct AccentColorView: View {
    @State private var chosenAccentColor: Color = Color.blue

    var body: some View {
        NavigationStack {
            List {
                // Loop through the array of colors
                ForEach(colorList, id: \.self) { color in
                    // Create a view for each color
                    HStack {
                        Circle()
                            .fill(color)
                            .frame(width: 15, height: 15)
                        Text(color.description.capitalized)
                            .padding(.leading, 10)
                        Spacer()
                        // Checkmark for the chosen color
                        if color == chosenAccentColor {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(5)
                    .contentShape(Rectangle()) // Make the entire row tappable
                    .onTapGesture {
                        chosenAccentColor = color
                    }
                }
                
                Section {
                    HStack {
                        Circle()
                            .foregroundStyle(chosenAccentColor)
                            .frame(width: 15, height: 15)
                        Text(chosenAccentColor.description.capitalized)
                    }
                } header: {
                    Text("Chosen Accent Color")
                }
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            
                        } label: {
                            Label(
                                title: { Text("Reset Accent Color") },
                                icon: { Image(systemName: "arrow.triangle.2.circlepath") }
                            )
                            
                        }
                    }
                    
                }
                .navigationTitle(Text("Accent Color").foregroundStyle(.blue))
            }
        }
    }
}

#Preview {
    AccentColorView()
}
