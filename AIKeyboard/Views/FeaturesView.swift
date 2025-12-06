import SwiftUI

struct FeaturesView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 12) {
                        Image(systemName: "sparkles")
                            .font(.system(size: 50))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.purple, .blue],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .padding(.top, 20)
                        
                        Text("Powerful Features")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                        
                        Text("Discover what makes AI Keyboard special")
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal)
                    
                    // Feature Details
                    VStack(spacing: 16) {
                        DetailedFeatureCard(
                            icon: "brain.head.profile",
                            title: "AI-Powered Predictions",
                            description: "Advanced machine learning models analyze your typing patterns to provide intelligent word and phrase suggestions in real-time.",
                            gradient: [.purple, .purple.opacity(0.7)]
                        )
                        
                        DetailedFeatureCard(
                            icon: "text.cursor",
                            title: "Smart Autocomplete",
                            description: "Context-aware autocomplete that understands what you're trying to say and suggests complete sentences and phrases.",
                            gradient: [.blue, .blue.opacity(0.7)]
                        )
                        
                        DetailedFeatureCard(
                            icon: "checkmark.seal.fill",
                            title: "Grammar & Spelling",
                            description: "Real-time grammar checking and spelling corrections powered by Natural Language Processing.",
                            gradient: [.green, .green.opacity(0.7)]
                        )
                        
                        DetailedFeatureCard(
                            icon: "wand.and.stars",
                            title: "Text Generation",
                            description: "Generate complete sentences and paragraphs based on your input context using advanced AI models.",
                            gradient: [.pink, .pink.opacity(0.7)]
                        )
                        
                        DetailedFeatureCard(
                            icon: "lock.shield.fill",
                            title: "Privacy First",
                            description: "All AI processing happens on your device. Your data never leaves your phone, ensuring complete privacy.",
                            gradient: [.orange, .orange.opacity(0.7)]
                        )
                        
                        DetailedFeatureCard(
                            icon: "bolt.fill",
                            title: "Lightning Fast",
                            description: "Optimized for performance with minimal battery impact. Get instant suggestions without any lag.",
                            gradient: [.yellow, .yellow.opacity(0.7)]
                        )
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 20)
                }
                .padding(.vertical)
            }
            .navigationTitle("Features")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetailedFeatureCard: View {
    let icon: String
    let title: String
    let description: String
    let gradient: [Color]
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            // Icon
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: gradient.map { $0.opacity(0.2) },
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Image(systemName: icon)
                    .font(.system(size: 26))
                    .foregroundStyle(
                        LinearGradient(
                            colors: gradient,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }
            
            // Content
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                
                Text(description)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.secondarySystemBackground))
        )
    }
}

struct FeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturesView()
            .environmentObject(ThemeManager.shared)
    }
}
