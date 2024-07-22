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
    @State private var customAccentColor =
    Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var isCustomColorOn: Bool = false
    @State private var isCustomColorChosen: Bool = false
    
    
    var body: some View {
        NavigationStack {
            List {
                
                Section(header: Text("Current Accent Color")) {
                    HStack {
                        if isCustomColorChosen == false {
                            Circle()
                                .foregroundStyle(chosenAccentColor)
                                .frame(width: 15, height: 15)
                            Text(chosenAccentColor.description.capitalized)
                        } else {
                            Circle()
                                .foregroundStyle(customAccentColor)
                                .frame(width: 15, height: 15)
                            Text("Custom Color")
                        }
                    }
                }
                
                Section(header: Text("Choose an Accent Color")){
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
                            isCustomColorChosen = false
                        }
                    }
                }
                
                Section(header: Text("Custom Color")) {
                    
                    Toggle(isOn: $isCustomColorOn, label: {
                        Text("Use Custom Accent Color")
                    })
                    VStack {
                        if isCustomColorOn {
                            ColorPicker("Custom Accent Color", selection: $customAccentColor, supportsOpacity: false)
                                .onTapGesture(perform: {
                                    isCustomColorChosen = true
                                })
                        } else {
                            ColorPicker("Custom Accent Color", selection: $customAccentColor, supportsOpacity: false)
                                .disabled(true)
                                .opacity(0.4)
                        }
                        
                    }
                }
                
                Section{
                    Button{
                        
                    } label: {
                        HStack{
                            Spacer()
                            Label(
                                title: { Text("Reset Accent Color") },
                                icon: { Image(systemName: "arrow.triangle.2.circlepath").foregroundStyle(.white) }
                            )
                            Spacer()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .listRowBackground(Color.clear)
                
                .navigationTitle(Text("Accent Color").foregroundStyle(.blue))
            }
        }
    }
}


#Preview {
    AccentColorView()
}
