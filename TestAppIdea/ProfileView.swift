import SwiftUI

struct ProfileView: View {
    
    @AppStorage ("IsDebugEnabled") var isDebugEnabled: Bool = false
    
    @State private var profileImage: UIImage? = nil
    @State private var isShowingImagePicker = false
    
    @AppStorage("ProfileName") var profileName: String = ""
    @AppStorage("ProfileDOB") var profileDOB: String = ""
    @AppStorage("ProfileBio") var profileBio: String = ""
    
    @State private var xpLevel = 0.5
    @State private var ExploreXP = 0.8
    @State private var CombatXP = 0.7
    @State private var StealthXP = 0.3
    
    @State private var editProfileInfo: Bool = false
    @State private var viewXPBreakdown: Bool = false
    
    @State var isResettingProfile: Bool = false
    @State var confirmedProfileReset: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                profileSection
                xpSection
                navigationLinksSection
                resetProfileSection
            }
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(image: $profileImage)
            }
            .confirmationDialog("Are you sure you want to reset your profile? This action cannot be undone", isPresented: $isResettingProfile, titleVisibility: .visible,  actions: {
                Button("Yes, I'm sure", role: .destructive){
                    confirmedProfileReset = true
                    resetProfile()
                }
                .tint(.red)
                Button("No, do not reset"){
                    isResettingProfile = false
                }
            })
            .navigationTitle("User Profile")
            .onAppear(perform: loadProfileImage)
        }
    }
    
    private var profileSection: some View {
        Section {
            VStack {
                HStack {
                    profileImageView
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
                    editButton
                }
                HStack {
                    ProgressView("XP: ", value: xpLevel)
                        .foregroundStyle(Color.blue)
                    Image(systemName: "\(Int(xpLevel * 100)).circle")
                        .font(.title)
                        .foregroundStyle(.blue)
                    
                }
                HStack{
                    VStack{
                        ProgressView("Combat", value: CombatXP)
                            .foregroundColor(.red)
                            .tint(.red)
                    }
                    VStack{
                        ProgressView("Stealth", value: StealthXP)
                            .foregroundColor(.purple)
                            .tint(.purple)
                    }
                    VStack{
                        ProgressView("Exploration", value: ExploreXP)
                            .foregroundStyle(.green)
                            .tint(.green)
                    }
                }
            }
            
            if editProfileInfo {
                editProfileFields
            }
            
            Button {
                withAnimation {
                    viewXPBreakdown.toggle()
                }
            } label: {
                Label(
                    title: { Text("View XP Level") },
                    icon: {
                        Image(systemName: "chevron.down")
                            .rotationEffect(.degrees(viewXPBreakdown ? 180 : 0))
                    }
                )
            }
            .buttonBorderShape(.capsule)
            .buttonStyle(.bordered)
        } header: {
            Text("")
        } footer: {
            Text("Your experience level is calculated by aggregating multiple statistics from across your profile.")
        }
    }
    
    private var profileImageView: some View {
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
    }
    
    private var editButton: some View {
        Button {
            withAnimation {
                editProfileInfo.toggle()
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
    
    private var editProfileFields: some View {
        Group {
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
    }
    
    private var xpSection: some View {
        Group {
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
                    
                    if isDebugEnabled == true {
                        debugLevelControl
                    }
                }
                .transition(.slide)
            }
        }
    }
    
    private var debugLevelControl: some View {
        VStack {
            Text("Debug Level Control:")
                .font(.caption)
                .foregroundColor(.secondary)
                .italic()
            HStack {
                Button {
                    adjustXPLevel(by: -0.01)
                } label: {
                    Spacer()
                    Label(
                        title: { Text("Down") },
                        icon: { Image(systemName: "arrow.down.circle") }
                    )
                    Spacer()
                }
                .buttonStyle(.bordered)
                
                Button {
                    adjustXPLevel(by: 0.01)
                } label: {
                    Spacer()
                    Label(
                        title: { Text("Up") },
                        icon: { Image(systemName: "arrow.up.circle") }
                    )
                    Spacer()
                }
                .buttonStyle(.bordered)
            }
        }
    }
    
    private var navigationLinksSection: some View {
        Section {
            NavigationLink {
                AchievementsView()
            } label: {
                ListItem(iconColor: .yellow, iconSymbol: "trophy.fill", itemLabel: "Achievements")
            }
            
            NavigationLink {
                StatisticsView()
            } label: {
                ListItem(iconColor: .green, iconSymbol: "chart.xyaxis.line", itemLabel: "Statistics")
            }
            
            NavigationLink {
                HighlightsView()
            } label: {
                ListItem(iconColor: .purple, iconSymbol: "film.stack", itemLabel: "Highlights")
            }
        }
    }
    
    private var resetProfileSection: some View {
        Section {
            
            HStack {
                Button(role: .destructive) {
                    isResettingProfile = true
                } label: {
                    Spacer()
                    Label(
                        title: { Text("Reset Profile") },
                        icon: { Image(systemName: "trash").foregroundColor(.red) }
                    )
                    Spacer()
                }
                .buttonBorderShape(.capsule)
                .tint(.red)
                .buttonStyle(.bordered)
            }
        } header: {
        } footer: {
            Text("WARNING: Resetting your profile cannot be undone.")
        }
        .listRowBackground(Color.clear)
    }
    
    private func saveProfileImage(_ image: UIImage?) {
        guard let image = image else {
            UserDefaults.standard.removeObject(forKey: "ProfileImage")
            return
        }
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            UserDefaults.standard.set(imageData, forKey: "ProfileImage")
        }
    }
    
    private func loadProfileImage() {
        if let imageData = UserDefaults.standard.data(forKey: "ProfileImage"),
           let image = UIImage(data: imageData) {
            self.profileImage = image
        }
    }
    
    private func adjustXPLevel(by amount: Double) {
        xpLevel = min(max(xpLevel + amount, 0.0), 1.0)
    }
    
    private func resetProfile() {
        if confirmedProfileReset == true {
            profileName = ""
            profileBio = ""
            profileDOB = ""
            profileImage = nil
            xpLevel = 0.0
            CombatXP = 0.0
            StealthXP = 0.0
            ExploreXP = 0.0
        }
    }
}

// Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
