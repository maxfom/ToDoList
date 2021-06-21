//
//  UserDefaultsService.swift
//  Login App
//
//  Created by Георгий Сабанов on 21.06.2021.
//

import Foundation

class UserDefaultsService {
    
    private let userDefaults = UserDefaults.standard
    
    fileprivate func setValue(_ value: Any?, forKey key: String) {
        userDefaults.setValue(value, forKey: key)
    }
    
    fileprivate func removeValue(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
    
    fileprivate func stringValue(forKey key: String) -> String? {
        userDefaults.string(forKey: key)
    }
    
    fileprivate func arrayValue(forKey key: String) -> Array<Any>? {
        userDefaults.array(forKey: key)
    }

}

// MARK: - Authorization flow
extension UserDefaultsService {
    
    private enum AuthSpec {
        static let loginKey = "user_login"
        static let passwordKey = "password"
    }
    
    var userLogin: String? {
        stringValue(forKey: AuthSpec.loginKey)
    }
    
    var userPassword: String? {
        stringValue(forKey: AuthSpec.passwordKey)
    }
    
    func saveUser(login: String, password: String) {
        setValue(login, forKey: AuthSpec.loginKey)
        setValue(password, forKey: AuthSpec.passwordKey)
    }
    
    func removeUser() {
        removeValue(forKey: AuthSpec.loginKey)
        removeValue(forKey: AuthSpec.passwordKey)
    }
    
}

// MARK: - ToDo List
extension UserDefaultsService {
    
    private enum ToDoListSpec {
        static let todoListKey = "todo_list"
    }
    
    var toDoList: [String]? {
        guard let array = arrayValue(forKey: ToDoListSpec.todoListKey) else { return nil }
        return array.compactMap { $0 as? String }
    }
    
    func addToDoListItem(_ item: String) {
        var currentList = toDoList ?? []
        currentList.append(item)
        setValue(currentList, forKey: ToDoListSpec.todoListKey)
    }

}
