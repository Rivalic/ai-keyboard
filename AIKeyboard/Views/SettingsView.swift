import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsManager: SettingsManager
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        NavigationView {
            Form {
                // Appearance Section
                Section {
                    Toggle("Dark Mode", isOn: $themeManager.isDarkMode)
                    
                    Picker("Accent Color", selection: $themeManager.selectedAccent) {
                        ForEach(ThemeManager.AccentOption.allCases, id: \.self) { option in
                            HStack {
                                Circle()
                                    .fill(option.color)
                                    .frame(width: 20, height: 20)
                                Text(option.rawValue)
                            }
                            .tag(option)
                        }
                    }
                } header: {
                    Text("Appearance")
                } footer: {
                    Text("Customize the look and feel of the keyboard")
                }
                
                // AI Features Section
                Section {
                    Toggle("Smart Predictions", isOn: $settingsManager.enablePredictions)
                    
                    Toggle("Autocomplete", isOn: $settingsManager.enableAutocomplete)
                    
                    Toggle("Grammar Check", isOn: $settingsManager.enableGrammarCheck)
                    
                    Toggle("Text Generation", isOn: $settingsManager.enableTextGeneration)
                } header: {
                    Text("AI Features")
                } footer: {
                    Text("Enable or disable AI-powered features")
                }
                
                // Typing Section
                Section {
                    Toggle("Auto-Capitalization", isOn: $settingsManager.autoCapitalization)
                    
                    Toggle("Auto-Correction", isOn: $settingsManager.autoCorrection)
                    
                    Toggle("Key Click Sound", isOn: $settingsManager.keyClickSound)
                    
                    Toggle("Haptic Feedback", isOn: $settingsManager.hapticFeedback)
                } header: {
                    Text("Typing")
                } footer: {
                    Text("Configure typing behavior and feedback")
                }
                
                // Privacy Section
                Section {
                    HStack {
                        Image(systemName: "lock.shield.fill")
                            .foregroundColor(.green)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("On-Device Processing")
                                .font(.system(size: 16, weight: .semibold))
                            
                            Text("All AI features run locally on your device. Your data never leaves your phone.")
                                .font(.system(size: 13))
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                } header: {
                    Text("Privacy")
                }
                
                // About Section
                Section {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                    
                    Link(destination: URL(string: "https://github.com")!) {
                        HStack {
                            Text("GitHub Repository")
                            Spacer()
                            Image(systemName: "arrow.up.right")
                                .font(.caption)
                        }
                    }
                    
                    Link(destination: URL(string: "https://github.com")!) {
                        HStack {
                            Text("Privacy Policy")
                            Spacer()
                            Image(systemName: "arrow.up.right")
                                .font(.caption)
                        }
                    }
                } header: {
                    Text("About")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(SettingsManager.shared)
            .environmentObject(ThemeManager.shared)
    }
}
