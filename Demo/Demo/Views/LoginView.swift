import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                    // Email Field
                TextField("Enter email", text: $email)
                    .textInputAutocapitalization(.never)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                    .padding(.horizontal, 24)
                
                    // Passsword Field
                SecureField("Enter Password", text: $password)
                    .textInputAutocapitalization(.never)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                    .padding(.horizontal, 24)
                
                    // Login Button
                
                NavigationLink(destination: HomeView(email: $email)) {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.white))
                        .frame(width: 360, height: 44)
                        .background(Color(.systemOrange))
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    LoginView()
}
