//
//  HabitsDetailViewController.swift
//  Habits
//
//  Created by Кирилл Пономаренко on 01.08.2022.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    var habitName: String?
    var currentHabit: Habit?
    let store = HabitsStore.shared
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.allowsSelection = false
        view.backgroundColor = .clear
        view.delegate = self
        view.dataSource = self
        view.tintColor = Colors.purple
        view.rowHeight = 44
        view.register(HabitDetailsTableViewCell.self, forCellReuseIdentifier: String(describing: HabitDetailsTableViewCell.self))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    private func setConstraints() {
        view.addSubviews(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
        
        let editButton = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(editButtonAction))
        self.navigationItem.rightBarButtonItem = editButton
        
        navigationController?.navigationBar.barTintColor = .white
        view.backgroundColor = .systemGray6
        self.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.tintColor = Colors.purple
        navigationItem.title = habitName
    }
    
    @objc private func editButtonAction() {
        let habitController = HabitViewController()
        habitController.habitEditionState = .edition
        navigationController?.pushViewController(habitController, animated: true)
        habitController.currentHabit = self.currentHabit
        habitController.habitName = currentHabit?.name
    }
}

extension HabitDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HabitDetailsTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: HabitDetailsTableViewCell.self),
            for: indexPath
        ) as! HabitDetailsTableViewCell
        
        if HabitsStore.shared.habit(currentHabit!, isTrackedIn: store.dates[indexPath.row]) {
            cell.accessoryType = .checkmark
        }
        
        cell.activLabel.text = HabitsStore.shared.trackDateString(forIndex: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.dates.count
    }
}

extension HabitDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "АКТИВНОСТЬ"
    }
}

