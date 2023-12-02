import Security
import Foundation

open class TokenManager {
    
    private static let queue = DispatchQueue(label: "com.yourapp.tokenQueue", attributes: .concurrent)

    // Сохранение токена в Keychain
    static public func saveToken(_ token: String, forAccount account: String) {
        queue.async(flags: .barrier) {
            let tokenData = token.data(using: .utf8)!
            
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: account,
                kSecValueData as String: tokenData,
                kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
            ]
            
            let status = SecItemAdd(query as CFDictionary, nil)
            if status != errSecSuccess {
                print("Failed to save token to Keychain with status: \(status)")
            }
        }
    }

    // Загрузка токена из Keychain
    static public func loadToken(forAccount account: String, completion: @escaping (String?) -> Void) {
        queue.async {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: account,
                kSecReturnData as String: kCFBooleanTrue!,
                kSecMatchLimit as String: kSecMatchLimitOne
            ]

            var tokenData: AnyObject?
            let status = SecItemCopyMatching(query as CFDictionary, &tokenData)

            if status == errSecSuccess, let data = tokenData as? Data {
                let token = String(data: data, encoding: .utf8)
                DispatchQueue.main.async {
                    completion(token)
                }
            } else {
                print("Failed to load token from Keychain with status: \(status)")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

    // Удаление токена из Keychain
    static public func deleteToken(forAccount account: String) {
        queue.async(flags: .barrier) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: account
            ]

            let status = SecItemDelete(query as CFDictionary)
            if status != errSecSuccess && status != errSecItemNotFound {
                print("Failed to delete token from Keychain with status: \(status)")
            }
        }
    }
}

//// Сохранение токена после успешной авторизации
//let authToken = "your_auth_token"
//TokenManager.saveToken(authToken, forAccount: "user_account")
//
//// Загрузка токена при необходимости
//TokenManager.loadToken(forAccount: "user_account") { loadedToken in
//    if let loadedToken = loadedToken {
//        print("Loaded token: \(loadedToken)")
//    } else {
//        print("Token not found in Keychain")
//    }
//}
//
//// Удаление токена (например, при выходе из аккаунта)
//TokenManager.deleteToken(forAccount: "user_account")
