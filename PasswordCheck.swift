struct Password_Check {
    static func validPassword(newPassword: String, confirmPassword: String) -> String? {
        if confirmPassword.isEmpty || newPassword.isEmpty {
            return "All fields are required."
        }
        
        if !passwordMatch(newPassword: newPassword, confirmPassword: confirmPassword) {
            return "Passwords do not match"
        }
         if !passwordLength(new_password: newPassword) {
             return "Password must be at least 8 characters long"
        }
        return nil
    }
    
    static func passwordMatch(newPassword: String, confirmPassword: String) -> Bool {
        return newPassword == confirmPassword
    }
    
    static func passwordLength(new_password: String) -> Bool {
        return new_password.count >= 8
    }
    
    
}
