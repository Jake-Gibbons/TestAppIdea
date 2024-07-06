//
//  SettingsView.swift
//  TestAppIdea
//
//  Created by Jake Gibbons on 19/06/2024.
//
import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        NavigationStack{
            List{
                
                NavigationLink{
                    ProfileView()
                } label: {
                    Label(
                        title: { Text("View Profile") },
                        icon: { Image(systemName: "person.circle").font(.title3) }
                    )
                }
                
                NavigationLink{
                    MainView()
                } label: {
                    Label(
                        title: { Text("View Main View") },
                        icon: { Image(systemName: "globe").font(.title3) }
                    )
                }
                
                Section{
                    
                    NavigationLink{
                        AccentColorView()
                    } label: {
                        HStack{
                            Label(
                                title: { Text("Change Accent Color") },
                                icon: { Image(systemName: "paintbrush").font(.title3) }
                            )
                            Spacer()
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color.accentColor)
                        }
                    }
                    
                    
                } header: {
                    Label(
                        title: { Text("Visual Settings") },
                        icon: { Image(systemName: "photo") }
                    )
                }
                
                Section{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 250, height: 250)
                            .foregroundStyle(Material.thin)
                            .overlay{
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(Color.secondary, lineWidth: 2)
                            }
                        HStack{
                            Spacer()
                            VStack{
                                Image(systemName: "bolt.horizontal")
                                    .font(.title)
                                    .scaleEffect(3, anchor: .center)
                                    .foregroundColor(Color.secondary)
                                Text("Test App")
                                    .foregroundStyle(.blue)
                                    .bold()
                                    .font(.title)
                                    .offset(y: 30)
                                Text("Made by Jake Gibbons")
                                    .offset(y: 30)
                                    .foregroundStyle(.blue)
                            }
                            Spacer()
                        }
                        .frame(height: 200)
                    }
                    .listRowBackground(Color.clear)
                    
                }
            }
            .navigationTitle("Settings")
        }
    }
}
                    


#Preview {
    SettingsView()
}
