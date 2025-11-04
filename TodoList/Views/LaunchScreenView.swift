import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            VStack(spacing: 20) {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.secondaryAccent)
                
                Text("ToDoList")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
    }
}
