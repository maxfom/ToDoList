//
//  ToDoListViewController.swift
//  Login App
//
//  Created by Георгий Сабанов on 16.06.2021.
//

import UIKit

class ToDoListViewController: BaseTableViewController {

    // MARK: - Private
    private enum Spec {
        static let newItemAlertTitle = "Add task"
        static let newItemAlertMessage = "Input your task here"
        static let newItemAlertOkButtonTitle = "Save"
        static let newItemAlertCancelButtonTitle = "Cancel"
        static let newItemAlertTextFieldPlaceholder = "ex. Buy milk"
    }

    var items: [ToDoListItem] = []

    @IBAction func addNewToDoListItem() {
        showAlert(
            title: Spec.newItemAlertTitle,
            message: Spec.newItemAlertMessage,
            cancelButton: Spec.newItemAlertCancelButtonTitle,
            okButton: Spec.newItemAlertOkButtonTitle,
            okAction: { [weak self] itemTitle in
                guard let self = self,
                      let itemTitle = itemTitle
                else {
                    return
                }
                
                self.items.append(ToDoListItem(title: itemTitle, isDone: false))
                self.tableView.reloadData()
            },
            hasTextField: true,
            textFieldPlaceholder: Spec.newItemAlertTextFieldPlaceholder
        )
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ToDoListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ToDoTableViewCell.cellIdentifier, for: indexPath) as? ToDoTableViewCell {
            let item = items[indexPath.row]
            cell.configure(isDone: item.isDone, title: item.title)
            return cell
        }
        
        fatalError("Couldn't find cell's class")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        let item = items[indexPath.row]
        item.isDone.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
