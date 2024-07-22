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
            
            List{
                    Text("You are currently level {{xp_level}}")
                        .font(.headline)
                        .offset(x: -20, y: -10)
                .listRowBackground(Color.clear)
                
                Section{
                    
                    NavigationLink(destination: ProfileView()) {
                        HStack{
                            Spacer()
                            Image(systemName: "person.crop.circle")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .padding(.vertical, 5)
                            Text("View Profile")
                                .font(.title3)
                                .foregroundStyle(.white)
                            Spacer()
                        }
                    }
                    
                       
                } header: {
                    
                } footer: {
                    
                }
                .listRowBackground(Color.blue)
                
                Section{
                    NavigationLink(destination: AchievementsView()) {
                        HStack{
                            Spacer()
                            Image(systemName: "trophy.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.black)
                                .padding(.vertical, 5)
                            Text("Achievements")
                                .font(.title3)
                                .foregroundStyle(.black)
                            Spacer()
                        }
                    }
                    .listRowBackground(Color.yellow)
                    
                    NavigationLink(destination: StatisticsView()) {
                        HStack{
                            Spacer()
                            Image(systemName: "chart.xyaxis.line")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .padding(.vertical, 5)
                            Text("Statistics")
                                .font(.title3)
                                .foregroundStyle(.white)
                            Spacer()
                        }
                    }
                    .listRowBackground(Color.green)
                    
                    NavigationLink(destination: HighlightsView()) {
                        HStack{
                            Spacer()
                            Image(systemName: "film.stack")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .padding(.vertical, 5)
                            Text("Highlights")
                                .font(.title3)
                                .foregroundStyle(.white)
                            Spacer()
                        }
                    }
                    .listRowBackground(Color.purple)

                    
                }
                .listRowBackground(Color.clear)
                
                Section{
                    NavigationLink(destination: SettingsView()) {
                        HStack{
                            Spacer()
                            Image(systemName: "gear")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .padding(.vertical, 5)
                            Text("Settings")
                                .font(.title3)
                                .foregroundStyle(.white)
                            Spacer()
                        }
                    }
                    .listRowBackground(Color.mint)
                }
                
                
                
            }
            .navigationTitle(Text("Hi, {{user_name}}"))
            .toolbar {
                NavigationLink(destination: SettingsView()) {
                    Label(
                        title: { Text("Settings") },
                        icon: { Image(systemName: "gear") }
                    )
                }
            }
        }
    }
}


#Preview {
    MainView()
}
