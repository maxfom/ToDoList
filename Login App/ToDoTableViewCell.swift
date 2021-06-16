//
//  ToDoTableViewCell.swift
//  Login App
//
//  Created by Георгий Сабанов on 16.06.2021.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Private
    private enum Spec {
        static let undoneImage = UIImage(systemName: "circle")
        static let doneImage = UIImage(systemName: "checkmark.circle.fill")
        static let undoneIconColor:UIColor = .secondarySystemFill
        static let doneIconColor:UIColor = .systemGreen
    }

    func configure(isDone: Bool, title: String) {
        configureIcon(isDone: isDone)
        titleLabel.text = title
    }
    
    private func configureIcon(isDone: Bool) {
        iconImageView.image = isDone ? Spec.doneImage : Spec.undoneImage
        iconImageView.tintColor = isDone ? Spec.doneIconColor : Spec.undoneIconColor
    }
    
}

extension ToDoTableViewCell {
    
    static var cellIdentifier: String {
        return "ToDoTableViewCell"
    }
    
}
