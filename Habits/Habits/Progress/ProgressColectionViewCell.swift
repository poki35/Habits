//
//  ProgressColectionViewCell.swift
//  Habits
//
//  Created by Кирилл Пономаренко on 01.08.2022.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Все получится!"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.progressViewStyle = .default
        view.trackTintColor = .systemGray2
        view.progressTintColor = Colors.purple
        view.layer.cornerRadius = 3.5
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textAlignment = .right
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .white
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        
        contentView.addSubviews(title, progressView, percentLabel)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            title.widthAnchor.constraint(equalToConstant: 220),
            title.heightAnchor.constraint(equalToConstant: 18),
            
            progressView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            progressView.heightAnchor.constraint(equalToConstant: 7),
            progressView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            progressView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            
            percentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            percentLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            percentLabel.widthAnchor.constraint(equalToConstant: 50),
            percentLabel.heightAnchor.constraint(equalToConstant: 18)
            
            ])
    }
    
    func setupProgress() {
        let store = HabitsStore.shared
        progressView.setProgress(store.todayProgress, animated: true)
        percentLabel.text = String(Int(store.todayProgress * 100.0)) + "%"
    }
    
}
