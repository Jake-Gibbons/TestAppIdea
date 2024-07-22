import SwiftUI
import Combine

struct Achievement: Identifiable {
    var id = UUID()
    var name: String
    var isAchieved: Bool
    var isLocked: Bool
    var description: String
    var dateUnlocked: Date?
}

enum SortOption: String, CaseIterable, Identifiable {
    case name = "Name (A-Z)"
    case locked = "Locked"
    case achieved = "Achieved"
    case unachieved = "Unachieved"

    var id: String { self.rawValue }
}

class AchievementViewModel: ObservableObject {
    @Published var achievements: [Achievement] = [
        Achievement(name: "First Steps", isAchieved: true, isLocked: false, description: "Complete your first task", dateUnlocked: Date()),
        Achievement(name: "Explorer", isAchieved: false, isLocked: false, description: "Explore the new areas"),
        Achievement(name: "Master", isAchieved: false, isLocked: true, description: "Master all skills"),
        Achievement(name: "Veteran", isAchieved: true, isLocked: false, description: "Complete 100 tasks", dateUnlocked: Date().addingTimeInterval(-86400)),
        Achievement(name: "Champion", isAchieved: false, isLocked: true, description: "Win the championship"),
        Achievement(name: "Beginner", isAchieved: true, isLocked: false, description: "Start your journey", dateUnlocked: Date().addingTimeInterval(-172800)),
        Achievement(name: "Intermediate", isAchieved: false, isLocked: false, description: "Reach the intermediate level"),
        Achievement(name: "Advanced", isAchieved: false, isLocked: true, description: "Advance to the next stage"),
        Achievement(name: "Expert", isAchieved: true, isLocked: false, description: "Become an expert", dateUnlocked: Date().addingTimeInterval(-432000)),
        Achievement(name: "Guru", isAchieved: false, isLocked: true, description: "Achieve guru status"),
        Achievement(name: "Rookie", isAchieved: true, isLocked: false, description: "Join the team", dateUnlocked: Date().addingTimeInterval(-604800)),
        Achievement(name: "Novice", isAchieved: false, isLocked: false, description: "Complete the beginner course"),
        Achievement(name: "Proficient", isAchieved: false, isLocked: true, description: "Show proficiency in tasks"),
        Achievement(name: "Adept", isAchieved: true, isLocked: false, description: "Become adept at new skills", dateUnlocked: Date().addingTimeInterval(-1209600)),
        Achievement(name: "Skillful", isAchieved: false, isLocked: true, description: "Demonstrate skill"),
        Achievement(name: "Competent", isAchieved: true, isLocked: false, description: "Show competence", dateUnlocked: Date().addingTimeInterval(-2419200)),
        Achievement(name: "Talented", isAchieved: false, isLocked: true, description: "Display talent"),
        Achievement(name: "Gifted", isAchieved: true, isLocked: false, description: "Show gifted abilities", dateUnlocked: Date().addingTimeInterval(-3024000)),
        Achievement(name: "Virtuoso", isAchieved: false, isLocked: true, description: "Become a virtuoso"),
        Achievement(name: "Ace", isAchieved: true, isLocked: false, description: "Ace your performance", dateUnlocked: Date().addingTimeInterval(-3456000)),
        Achievement(name: "Maverick", isAchieved: false, isLocked: true, description: "Show maverick tendencies"),
        Achievement(name: "Top Gun", isAchieved: true, isLocked: false, description: "Become the top gun", dateUnlocked: Date().addingTimeInterval(-3888000)),
        Achievement(name: "Hot Shot", isAchieved: false, isLocked: true, description: "Be a hot shot"),
        Achievement(name: "Trailblazer", isAchieved: true, isLocked: false, description: "Blaze the trail", dateUnlocked: Date().addingTimeInterval(-4320000)),
        Achievement(name: "Pioneer", isAchieved: false, isLocked: true, description: "Be a pioneer"),
        Achievement(name: "Pathfinder", isAchieved: true, isLocked: false, description: "Find the path", dateUnlocked: Date().addingTimeInterval(-4752000)),
        Achievement(name: "Innovator", isAchieved: false, isLocked: true, description: "Innovate new ideas"),
        Achievement(name: "Visionary", isAchieved: true, isLocked: false, description: "Be a visionary", dateUnlocked: Date().addingTimeInterval(-5184000)),
        Achievement(name: "Creator", isAchieved: false, isLocked: true, description: "Create something new"),
        Achievement(name: "Inventor", isAchieved: true, isLocked: false, description: "Invent a solution", dateUnlocked: Date().addingTimeInterval(-5616000)),
        Achievement(name: "Developer", isAchieved: false, isLocked: true, description: "Develop new skills"),
        Achievement(name: "Designer", isAchieved: true, isLocked: false, description: "Design a masterpiece", dateUnlocked: Date().addingTimeInterval(-6048000)),
        Achievement(name: "Architect", isAchieved: false, isLocked: true, description: "Architect a plan"),
        Achievement(name: "Builder", isAchieved: true, isLocked: false, description: "Build something great", dateUnlocked: Date().addingTimeInterval(-6480000)),
        Achievement(name: "Engineer", isAchieved: false, isLocked: true, description: "Engineer a solution"),
        Achievement(name: "Producer", isAchieved: true, isLocked: false, description: "Produce results", dateUnlocked: Date().addingTimeInterval(-6912000)),
        Achievement(name: "Director", isAchieved: false, isLocked: true, description: "Direct a project"),
        Achievement(name: "Manager", isAchieved: true, isLocked: false, description: "Manage a team", dateUnlocked: Date().addingTimeInterval(-7344000)),
        Achievement(name: "Leader", isAchieved: false, isLocked: true, description: "Lead a group"),
        Achievement(name: "Captain", isAchieved: true, isLocked: false, description: "Captain a team", dateUnlocked: Date().addingTimeInterval(-7776000)),
        Achievement(name: "Commander", isAchieved: false, isLocked: true, description: "Command respect"),
        Achievement(name: "General", isAchieved: true, isLocked: false, description: "Become a general", dateUnlocked: Date().addingTimeInterval(-8208000)),
        Achievement(name: "Marshal", isAchieved: false, isLocked: true, description: "Marshal the troops"),
        Achievement(name: "Warden", isAchieved: true, isLocked: false, description: "Be a warden", dateUnlocked: Date().addingTimeInterval(-8640000)),
        Achievement(name: "Guardian", isAchieved: false, isLocked: true, description: "Guard the secrets"),
        Achievement(name: "Sentinel", isAchieved: true, isLocked: false, description: "Stand as a sentinel", dateUnlocked: Date().addingTimeInterval(-9072000)),
        Achievement(name: "Protector", isAchieved: false, isLocked: true, description: "Protect the weak"),
        Achievement(name: "Defender", isAchieved: true, isLocked: false, description: "Defend the cause", dateUnlocked: Date().addingTimeInterval(-9504000))
    ]
    
    func sortAchievements(by option: SortOption) {
        switch option {
        case .name:
            achievements.sort { $0.name < $1.name }
        case .locked:
            achievements.sort { $0.isLocked && !$1.isLocked }
        case .achieved:
            achievements.sort { $0.isAchieved && !$1.isAchieved }
        case .unachieved:
            achievements.sort { !$0.isAchieved && $1.isAchieved }
        }
    }
}

struct AchievementsView: View {
    @StateObject private var viewModel = AchievementViewModel()
    @State private var selectedSortOption: SortOption = .name

    var body: some View {
        NavigationStack {
            List(viewModel.achievements) { achievement in
                achievementListItem(
                    isLocked: achievement.isLocked,
                    isAchieved: achievement.isAchieved,
                    name: achievement.name,
                    description: achievement.description,
                    dateUnlocked: achievement.dateUnlocked
                )
            }
            .navigationTitle("Achievements")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Picker("Sort", selection: $selectedSortOption) {
                        ForEach(SortOption.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .onChange(of: selectedSortOption) { newValue in
                        viewModel.sortAchievements(by: newValue)
                    }
                }
            }
        }
    }
}

struct achievementListItem: View {
    var isLocked: Bool
    var isAchieved: Bool
    var name: String
    var description: String
    var dateUnlocked: Date?

    var body: some View {
        HStack {
            if isLocked {
                Image(systemName: "lock.fill")
                    .foregroundColor(.secondary)
                    .font(.title)
            } else if isAchieved {
                ZStack{
                    Image(systemName: "trophy.fill")
                        .foregroundColor(.yellow)
                        .font(.title)
                    ZStack{
                        Circle()
                            .frame(width: 20)
                            .foregroundStyle(.green)
                        Image(systemName: "checkmark")
                            .fontWeight(.black)
                            .foregroundStyle(.white)
                    }
                    .offset(x: 15, y: 15)
                }
            } else {
                ZStack{
                    Image(systemName: "trophy.fill")
                        .foregroundColor(.secondary)
                        .font(.title)
                    ZStack{
                        Circle()
                            .frame(width: 20)
                            .foregroundStyle(.red)
                        Image(systemName: "xmark")
                            .fontWeight(.black)
                            .foregroundStyle(.white)
                    }
                    .offset(x: 15, y: 15)
                }
            }
            HStack{
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.title3)
                    Text(isLocked ? "Achievement Locked" : description)
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                    
                }
                .padding(.leading, 20)
                Spacer()
                if let dateUnlocked = dateUnlocked {
                    Text("Unlocked: \(dateUnlocked.formatted(date: .numeric, time: .shortened))")
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                        .frame(width: 100)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
    }
}

#Preview {
    AchievementsView()
}
