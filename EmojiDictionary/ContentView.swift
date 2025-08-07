import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1 // Start with "Transactions" tab selected
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // Header
                HeaderView()
                
                // Main content
                VStack(spacing: 20) {
                    // Balance cards
                    BalanceCardView()
                    
                    // Action buttons
                    ActionButtonsView()
                    
                    // Tab selector and content
                    TabSelectorView(selectedTab: $selectedTab)
                    
                    Spacer()
                    
                    // Transaction entries
                    if selectedTab == 1 {
                        TransactionListView()
                    }
                }
                .padding(.horizontal, 20)
                .background(Color(.systemGray6))
            }
            .ignoresSafeArea(.all, edges: .top)
            
            // Floating Action Button
            FloatingActionButton()
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Button(action: {}) {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack {
                    Text("CIBC VISA")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    Text("4505530144191200")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.9))
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 50)
            .padding(.bottom, 20)
        }
        .background(
            LinearGradient(
                colors: [Color.red.opacity(0.8), Color.red],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

struct BalanceCardView: View {
    var body: some View {
        VStack(spacing: 15) {
            // Current Balance
            VStack(spacing: 5) {
                HStack {
                    Text("CURRENT BALANCE")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Button(action: {}) {
                        Image(systemName: "info.circle")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Text("$486.37")
                    .font(.system(size: 36, weight: .medium))
                    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.6))
            }
            
            // Cash back balance
            VStack(spacing: 5) {
                HStack {
                    Text("Cash back balance")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Button(action: {}) {
                        Image(systemName: "info.circle")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Text("$27.81")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.6))
            }
        }
        .padding(.top, 20)
    }
}

struct ActionButtonsView: View {
    var body: some View {
        VStack(spacing: 15) {
            Button(action: {}) {
                Text("Redeem $10 or more")
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .underline()
            }
            
            Button(action: {}) {
                Text("Lock my card")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .underline()
            }
        }
    }
}

struct TabSelectorView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            // Summary tab
            Button(action: { selectedTab = 0 }) {
                Text("Summary")
                    .font(.subheadline)
                    .foregroundColor(selectedTab == 0 ? .red : .secondary)
                    .padding(.bottom, 8)
                    .overlay(
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(selectedTab == 0 ? .red : .clear),
                        alignment: .bottom
                    )
            }
            
            Spacer()
            
            // Transactions tab
            Button(action: { selectedTab = 1 }) {
                Text("Transactions")
                    .font(.subheadline)
                    .foregroundColor(selectedTab == 1 ? .red : .secondary)
                    .padding(.bottom, 8)
                    .overlay(
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(selectedTab == 1 ? .red : .clear),
                        alignment: .bottom
                    )
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
}

struct TransactionListView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Transaction Glossary
            HStack {
                Image(systemName: "doc.text.magnifyingglass")
                    .foregroundColor(.secondary)
                
                Text("Transaction Glossary")
                    .font(.subheadline)
                    .foregroundColor(.red)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            
            Divider()
            
            // Viewing period
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                
                Text("Viewing Last 4 Weeks")
                    .font(.subheadline)
                    .foregroundColor(.red)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            
            Rectangle()
                .frame(height: 3)
                .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.6))
            
            // Questions link
            Button(action: {}) {
                HStack {
                    Text("Questions about your transactions?")
                        .font(.subheadline)
                        .foregroundColor(.red)
                        .underline()
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            }
            
            // Date header
            HStack {
                Text("AUG 07, 2025")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            
            Divider()
            
            // Transaction item
            TransactionItemView()
            
            Spacer()
        }
    }
}

struct TransactionItemView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("OPENAI +14158799686, CA")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                Text("4505********1200")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("-$10.00")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                HStack(spacing: 4) {
                    Image(systemName: "clock")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text("PENDING")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
    }
}

// Floating Action Button
struct FloatingActionButton: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {}) {
                    Image(systemName: "plus")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 56, height: 56)
                        .background(Color.red)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    ContentView()
}