//
//  SettingsView.swift
//  TestAppIdea
//
//  Created by Jake Gibbons on 19/06/2024.
//
import SwiftUI

struct SettingsView: View {
    
    @AppStorage ("IsDebugEnabled") var isDebugEnabled: Bool = false
    
    var body: some View {
        
        NavigationStack{
            List{
                
                NavigationLink{
                    ProfileView()
                } label: {
                    ListItem(iconColor: .mint, iconSymbol: "person.circle", itemLabel: "View Profile")
                }
                
                NavigationLink{
                    MainView()
                } label: {
                    ListItem(iconColor: .blue, iconSymbol: "globe", itemLabel: "Nav to Main View")
                    
//                    Label(
//                        title: { Text("View Main View") },
//                        icon: { Image(systemName: "globe").font(.title3) }
//                    )
                }
                
                Section{
                    
                    NavigationLink{
                        AccentColorView()
                    } label: {
                        HStack{
                            ListItem(iconColor: .green, iconSymbol:"paintbrush", itemLabel: "Change Accent Color")
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
                    Toggle(isOn: $isDebugEnabled, label: {
                        ListItem(iconColor: isDebugEnabled ? .green : .black, iconSymbol: "ant", itemLabel: "Debug Enabled")
                    })
                } header: {
                    Label(
                        title: { Text("Debug Settings") },
                        icon: { Image(systemName: "ant") }
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


struct ListItem: View {
    var iconColor: Color = Color.blue
    var iconSymbol: String = "globe"
    var itemLabel: String = "Enter title"
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 7)
                    .frame(width: 35, height: 35)
                    .foregroundStyle(iconColor)
                Image(systemName: iconSymbol)
                    .foregroundStyle(Color.white)
                    .font(.title2)
            }
            Text(itemLabel)
                .padding(.leading, 10)
                .font(.body)
        }
    }
}

#Preview {
    SettingsView()
}
