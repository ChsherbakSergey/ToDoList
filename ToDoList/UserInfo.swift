import Foundation

class UserInfo {
    static let shared = UserInfo()
    
    private let kUserNameKey = "UserInfo.kUserNameKey"
    private let kUserSurnameKey = "UserInfo.kUserSurnameKey"
    
    var userName: String? {
        set {UserDefaults.standard.set(newValue, forKey: kUserNameKey)}
        get {return UserDefaults.standard.string(forKey: kUserNameKey)}
    }
    
    var userSurname: String? {
        set {UserDefaults.standard.set(newValue, forKey: kUserSurnameKey)}
        get {UserDefaults.standard.string(forKey: kUserSurnameKey)}
    }
    
}
