import SwiftUI

struct ProfileView: View {
    @State private var profileImage: UIImage? = nil
    @State private var isShowingImagePicker = false

    @AppStorage("ProfileName") var profileName: String = ""
    @AppStorage("ProfileDOB") var profileDOB: String = ""
    @AppStorage("ProfileBio") var profileBio: String = ""
    
    @State var xpLevel = 0.5
    @State var ExploreXP = 0.8
    @State var CombatXP = 0.7
    @State var StealthXP = 0.3

    @State var editProfileInfo: Bool = false
    @State var viewXPBreakdown: Bool = false

    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack {
                        HStack {
                            ZStack {
                                if let profileImage = profileImage {
                                    Image(uiImage: profileImage)
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 75, height: 75)
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                } else {
                                    Circle()
                                        .frame(width: 75, height: 75)
                                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.blue, .mint]), startPoint: .leading, endPoint: .trailing))
                                    Image(systemName: "person.circle")
                                        .foregroundStyle(.white)
                                        .font(.largeTitle)
                                        .scaleEffect(1.7, anchor: .center)
                                }

                                if editProfileInfo {
                                    Button {
                                        isShowingImagePicker = true
                                    } label: {
                                        ZStack {
                                            Circle()
                                                .frame(width: 30)
                                                .foregroundColor(.white)
                                                .shadow(color: .black, radius: 6)
                                                .offset(x: 20, y: 20)
                                            Image(systemName: "pencil")
                                                .offset(x: 20, y: 20)
                                                .foregroundStyle(.blue)
                                                .font(.title2)
                                        }
                                    }
                                    .transition(.scale)
                                }
                            }
                            VStack(alignment: .leading) {
                                if profileName == "" {
                                    Text("Please Enter Name")
                                        .italic()
                                } else {
                                    Text(profileName)
                                }
                                
                                if profileBio == "" {
                                    Text("Please Enter Bio")
                                        .foregroundStyle(.secondary)
                                        .italic()
                                        .font(.caption)
                                }
                                Text(profileBio)
                                    .foregroundStyle(.secondary)
                                    .italic()
                                    .font(.caption)
                            }
                            .padding(.leading, 10)
                            Spacer()
                            Button {
                                withAnimation {
                                    editProfileInfo.toggle()
                                }
                                if editProfileInfo == true {
                                    
                                }
                            } label: {
                                Label(
                                    title: { Text(editProfileInfo ? "Save" : "Edit") },
                                    icon: { Image(systemName: editProfileInfo ? "checkmark" : "pencil") }
                                )
                                .foregroundStyle(editProfileInfo ? .green : .secondary)
                            }
                            .buttonBorderShape(.capsule)
                            .buttonStyle(.bordered)
                            .tint(editProfileInfo ? .green : .secondary)
                        }
                        HStack {
                            ProgressView("XP: ", value: xpLevel)
                            Image(systemName: "12.circle")
                                .font(.title)
                                .foregroundStyle(.blue)
                        }
                    }

                    if editProfileInfo {
                        HStack {
                            Text("Name: ")
                            TextField("Name", text: $profileName, prompt: Text("Enter your name here"))
                        }
                        .transition(.slide)
                        HStack {
                            Text("Date of Birth: ")
                            TextField("Date of Birth", text: $profileDOB, prompt: Text("Enter your Date of Birth here"))
                        }
                        .transition(.slide)
                        VStack {
                            HStack {
                                Text("Bio:")
                                Spacer()
                            }
                            TextField("Bio", text: $profileBio, prompt: Text("Enter bio Here: "))
                                .lineLimit(4)
                        }
                    }

                    Button {
                        withAnimation {
                            viewXPBreakdown.toggle()
                        }
                    } label: {
                        Text("View XP Level")
                    }
                    .buttonBorderShape(.automatic)
                } header: {
                } footer: {
                    Text("Your experience level is calculated by aggregating multiple statistics from across your profile.")
                }

                if viewXPBreakdown {
                    Section {
                        ProgressView("Total XP: \(xpLevel * 100, specifier: "%.2f")", value: xpLevel)
                            .padding(.vertical, 5)
                        ProgressView("Exploration XP: \(ExploreXP * 100, specifier: "%.2f")", value: ExploreXP)
                            .foregroundStyle(.green)
                            .tint(.green)
                            .padding(.vertical, 5)
                        ProgressView("Combat XP: \(CombatXP * 100, specifier: "%.2f")", value: CombatXP)
                            .foregroundStyle(.red)
                            .tint(.red)
                            .padding(.vertical, 5)
                        ProgressView("Stealth XP: \(StealthXP * 100, specifier: "%.2f")", value: StealthXP)
                            .foregroundStyle(.purple)
                            .tint(.purple)
                            .padding(.vertical, 5)
                    }
                    .transition(.slide) // Add transition
                }

                Section {
                    Button { } label: {
                        Label(
                            title: { Text("Achievements") },
                            icon: { Image(systemName: "trophy") }
                        )
                    }

                    Button { } label: {
                        Label(
                            title: { Text("Statistics") },
                            icon: { Image(systemName: "chart.xyaxis.line") }
                        )
                    }

                    Button { } label: {
                        Label(
                            title: { Text("Highlights") },
                            icon: { Image(systemName: "film.stack") }
                        )
                    }
                }

                Section {
                    HStack {
                        Button(role: .destructive) {
                            // reset profile logic here
                        } label: {
                            Spacer()
                            Label(
                                title: { Text("Reset Profile") },
                                icon: { Image(systemName: "trash").foregroundColor(.red) }
                            )
                            Spacer()
                        }
                        .tint(.red)
                        .buttonStyle(.bordered)
                    }
                } header: {
                    Text("")
                } footer: {
                    Text("WARNING: Resetting your profile cannot be undone.")
                }
            }
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(image: $profileImage)
            }
            .navigationTitle("User Profile")
            .onAppear(perform: loadProfileImage)
        }
    }

    func saveProfileImage(_ image: UIImage?) {
        guard let image = image else {
            UserDefaults.standard.removeObject(forKey: "ProfileImage")
            return
        }
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            UserDefaults.standard.set(imageData, forKey: "ProfileImage")
        }
    }

    func loadProfileImage() {
        if let imageData = UserDefaults.standard.data(forKey: "ProfileImage"),
           let image = UIImage(data: imageData) {
            self.profileImage = image
        }
    }
}

// Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
