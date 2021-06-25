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
    
    fileprivate func dataValue(forKey key: String) -> Data? {
        userDefaults.data(forKey: key)
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
    
    public enum ToDoListSaveError: Error {
        case arrayIndexOutOfBounds
    }
        
    var toDoList: [ToDoListItem]? {
        guard let data = dataValue(forKey: ToDoListSpec.todoListKey) else { return nil }
        return try? JSONDecoder().decode([ToDoListItem].self, from: data)
    }
    
    func addToDoListItem(_ item: ToDoListItem) throws {
        var currentList = toDoList ?? []
        currentList.append(item)
        let data = try JSONEncoder().encode(currentList)
        setValue(data, forKey: ToDoListSpec.todoListKey)
    }

    func removeToDoListItem(at index: Int) throws {
        guard var newList = toDoList, newList.count > index else { throw ToDoListSaveError.arrayIndexOutOfBounds }
        newList.remove(at: index)
        let data = try JSONEncoder().encode(newList)
        setValue(data, forKey: ToDoListSpec.todoListKey)
    }
    
    func saveToDoList(_ list: [ToDoListItem]) throws {
        let data = try JSONEncoder().encode(list)
        setValue(data, forKey: ToDoListSpec.todoListKey)
    }
    
}
