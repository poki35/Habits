//
//  HabitDetailsTableViewCell.swift
//  Habits
//
//  Created by Кирилл Пономаренко on 01.08.2022.
//

import UIKit

class HabitDetailsTableViewCell: UITableViewCell {

    lazy var activLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        
        contentView.addSubview(activLabel)
        
        activLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            activLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            activLabel.widthAnchor.constraint(equalToConstant: 150),
            activLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
}
