import SwiftUI

struct ContentView: View {
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmNewPassword: String = ""
    @State private var errorMessage: String? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Update Password")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 70)
                .padding(.bottom, 100)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Text("Current Password*")
            TextField("Current Password", text: $currentPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 16)
            
            Text("New Password*")
            TextField("New Password", text: $newPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 16)
            
            Text("Confirm New Password*")
            TextField("Confirm New Password", text: $confirmNewPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.top, 8)
            }
            
            Button(action: validateInputs) {
                Text("Save")
                    .foregroundColor(.white)
                    .frame(width: 150, height: 40)
                    .background(Color.green)
                    .clipShape(Capsule())
            }
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .center)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    
    private func validateInputs() {
        errorMessage = Password_Check.validPassword(newPassword: newPassword, confirmPassword: confirmNewPassword)
        
        if errorMessage == nil {
            print("Passwords match. Proceed.")
        }
    }
}


#Preview {
    ContentView()
}
