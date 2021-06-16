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
        static let exampleItems: [ToDoListItem] = [
            ToDoListItem(title: "Помыть посуду", isDone: false),
            ToDoListItem(title: "Погулять с собакой", isDone: true),
            ToDoListItem(title: "Сходить за продуктами в ближайший магазин в 19:00 после работы если будет желание.", isDone: true)
        ]
    }

    var items: [ToDoListItem] = Spec.exampleItems

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
