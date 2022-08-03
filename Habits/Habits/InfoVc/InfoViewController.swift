//
//  InfoViewController.swift
//  Habits
//
//  Created by Кирилл Пономаренко on 01.08.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.text = TextForInfoVC.heading
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.text = TextForInfoVC.subtitle
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var paragraph1: UILabel = {
        let label = UILabel()
        label.text = TextForInfoVC.paragraph1
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var paragraph2: UILabel = {
        let label = UILabel()
        label.text = TextForInfoVC.paragraph2
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var paragraph3: UILabel = {
        let label = UILabel()
        label.text = TextForInfoVC.paragraph3
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var paragraph4: UILabel = {
        let label = UILabel()
        label.text = TextForInfoVC.paragraph4
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var paragraph5: UILabel = {
        let label = UILabel()
        label.text = TextForInfoVC.paragraph5
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var paragraph6: UILabel = {
        let label = UILabel()
        label.text = TextForInfoVC.paragraph6
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var source: UILabel = {
        let label = UILabel()
        label.text = TextForInfoVC.source
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        setConstraints()
        
    }
    
    private func setConstraints() {
        
        view.addSubview(scrollView)
        
        scrollView.addSubviews(contentView, headingLabel, subtitle, paragraph1, paragraph2, paragraph3, paragraph4, paragraph5, paragraph6, source)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        paragraph1.translatesAutoresizingMaskIntoConstraints = false
        paragraph2.translatesAutoresizingMaskIntoConstraints = false
        paragraph3.translatesAutoresizingMaskIntoConstraints = false
        paragraph4.translatesAutoresizingMaskIntoConstraints = false
        paragraph5.translatesAutoresizingMaskIntoConstraints = false
        paragraph6.translatesAutoresizingMaskIntoConstraints = false
        source.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            headingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            headingLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            headingLabel.heightAnchor.constraint(equalToConstant: 24),
            headingLabel.widthAnchor.constraint(equalToConstant: 230),
            
            subtitle.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 16),
            subtitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            subtitle.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            subtitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            
            paragraph1.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 12),
            paragraph1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            paragraph1.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            
            paragraph2.topAnchor.constraint(equalTo: paragraph1.bottomAnchor, constant: 12),
            paragraph2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            paragraph2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            
            paragraph3.topAnchor.constraint(equalTo: paragraph2.bottomAnchor, constant: 12),
            paragraph3.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            paragraph3.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            
            paragraph4.topAnchor.constraint(equalTo: paragraph3.bottomAnchor, constant: 12),
            paragraph4.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            paragraph4.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            
            paragraph5.topAnchor.constraint(equalTo: paragraph4.bottomAnchor, constant: 12),
            paragraph5.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            paragraph5.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            
            paragraph6.topAnchor.constraint(equalTo: paragraph5.bottomAnchor, constant: 12),
            paragraph6.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            paragraph6.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            
            source.topAnchor.constraint(equalTo: paragraph6.bottomAnchor, constant: 12),
            source.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            source.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            source.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        ])
    }
    
}
