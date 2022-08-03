//
//  HabitTableViewCell.swift
//  Habits
//
//  Created by Кирилл Пономаренко on 01.08.2022.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    
    let store = HabitsStore.shared
    var currentHabit: Habit?
    var habitIsTaken: (()->())?
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var checkInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 19
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(checkInButtonAction), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func checkInButtonAction(sender: UIButton) {
        
        takeCheckMark()
        habitIsTaken?()
        
    }
    
    func takeCheckMark() {
        checkInButton.backgroundColor = nameLabel.textColor
        checkInButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        checkInButton.tintColor = .white
    }
    
    public func update(with habit: Habit) {
        nameLabel.text = habit.name
        nameLabel.textColor = habit.color
        timeLabel.text = habit.dateString
        checkInButton.layer.borderColor = habit.color.cgColor
        countLabel.text = "Счетчик: \(habit.trackDates.count)"
        
        if habit.isAlreadyTakenToday {
            takeCheckMark()
            checkInButton.isEnabled = false
        } else {
            checkInButton.backgroundColor = .clear
        }
    }
    
    private func setConstraints() {
        
        contentView.addSubviews(nameLabel, timeLabel, countLabel, checkInButton)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        checkInButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 300),
            
            timeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            timeLabel.widthAnchor.constraint(equalToConstant: 200),
            timeLabel.heightAnchor.constraint(equalToConstant: 15),
            
            countLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            countLabel.widthAnchor.constraint(equalToConstant: 188),
            countLabel.heightAnchor.constraint(equalToConstant: 18),
            countLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            checkInButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25),
            checkInButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkInButton.widthAnchor.constraint(equalToConstant: 38),
            checkInButton.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
}
