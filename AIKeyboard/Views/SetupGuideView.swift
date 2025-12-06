import SwiftUI

struct SetupGuideView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Setup Guide")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                        
                        Text("Follow these steps to enable AI Keyboard")
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    // Steps
                    VStack(spacing: 20) {
                        SetupStep(
                            number: 1,
                            title: "Open Settings",
                            description: "Go to your device Settings app",
                            icon: "gear"
                        )
                        
                        SetupStep(
                            number: 2,
                            title: "Navigate to Keyboard",
                            description: "Tap General → Keyboard → Keyboards",
                            icon: "arrow.right.circle"
                        )
                        
                        SetupStep(
                            number: 3,
                            title: "Add New Keyboard",
                            description: "Tap 'Add New Keyboard' and select 'AI Keyboard'",
                            icon: "plus.circle"
                        )
                        
                        SetupStep(
                            number: 4,
                            title: "Enable Full Access",
                            description: "Tap 'AI Keyboard' and enable 'Allow Full Access' for AI features",
                            icon: "checkmark.circle",
                            isLast: true
                        )
                    }
                    .padding(.horizontal)
                    
                    // Settings Button
                    Button(action: {
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        HStack {
                            Image(systemName: "gear")
                            Text("Open Settings")
                                .font(.system(size: 17, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                colors: [.blue, .blue.opacity(0.8)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    Spacer(minLength: 20)
                }
                .padding(.vertical)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct SetupStep: View {
    let number: Int
    let title: String
    let description: String
    let icon: String
    var isLast: Bool = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            // Step Number
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.blue, .blue.opacity(0.7)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 44, height: 44)
                
                Text("\(number)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
            }
            
            // Content
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(title)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Spacer()
                    
                    Image(systemName: icon)
                        .font(.title3)
                        .foregroundColor(isLast ? .green : .blue)
                }
                
                Text(description)
                    .font(.system(size: 15))
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.secondarySystemBackground))
        )
    }
}

struct SetupGuideView_Previews: PreviewProvider {
    static var previews: some View {
        SetupGuideView()
    }
}
