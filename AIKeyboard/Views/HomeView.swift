import SwiftUI

struct HomeView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @State private var showSetupGuide = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Hero Section
                    VStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            themeManager.accentColor.opacity(0.3),
                                            themeManager.accentColor.opacity(0.1)
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 120, height: 120)
                                .blur(radius: 20)
                            
                            Image(systemName: "keyboard.fill")
                                .font(.system(size: 60))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [
                                            themeManager.accentColor,
                                            themeManager.accentColor.opacity(0.7)
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        }
                        .padding(.top, 20)
                        
                        Text("AI Keyboard")
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                        
                        Text("Your intelligent typing companion")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.secondary)
                    }
                    .padding(.bottom, 10)
                    
                    // Setup Card
                    SetupCard(showSetupGuide: $showSetupGuide)
                        .padding(.horizontal)
                    
                    // Features Grid
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Key Features")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 16) {
                            FeatureCard(
                                icon: "brain.head.profile",
                                title: "AI Predictions",
                                description: "Smart text suggestions",
                                color: .purple
                            )
                            
                            FeatureCard(
                                icon: "text.cursor",
                                title: "Autocomplete",
                                description: "Context-aware completion",
                                color: .blue
                            )
                            
                            FeatureCard(
                                icon: "checkmark.seal.fill",
                                title: "Grammar Check",
                                description: "Real-time corrections",
                                color: .green
                            )
                            
                            FeatureCard(
                                icon: "lock.shield.fill",
                                title: "Privacy First",
                                description: "On-device processing",
                                color: .orange
                            )
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 20)
                }
                .padding(.vertical)
            }
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showSetupGuide) {
                SetupGuideView()
            }
        }
    }
}

struct SetupCard: View {
    @Binding var showSetupGuide: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "info.circle.fill")
                    .font(.title2)
                    .foregroundColor(.blue)
                
                Text("Setup Required")
                    .font(.system(size: 20, weight: .semibold))
                
                Spacer()
            }
            
            Text("Enable AI Keyboard in your device settings to start using intelligent text predictions.")
                .font(.system(size: 15))
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
            
            Button(action: {
                showSetupGuide = true
            }) {
                HStack {
                    Text("View Setup Guide")
                        .font(.system(size: 16, weight: .semibold))
                    
                    Image(systemName: "arrow.right")
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
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
    }
}

struct FeatureCard: View {
    let icon: String
    let title: String
    let description: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 32))
                .foregroundColor(color)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(title)
                .font(.system(size: 16, weight: .semibold))
            
            Text(description)
                .font(.system(size: 13))
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.secondarySystemBackground))
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ThemeManager.shared)
    }
}
