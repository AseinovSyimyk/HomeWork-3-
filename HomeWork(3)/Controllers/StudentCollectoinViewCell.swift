//
//  StudentCollectoinViewCell.swift
//  HomeWork(2)
//
//  Created by User on 17/1/24.
//

import UIKit

class StudentCollectionViewCell: UICollectionViewCell {
    
    let studentNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let studentSurnameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let studentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(studentNameLabel)
        addSubview(studentSurnameLabel)
        addSubview(studentImageView)
        contentView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            studentImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            studentImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            studentImageView.widthAnchor.constraint(equalToConstant: 60),
            studentImageView.heightAnchor.constraint(equalToConstant: 60),
            
            studentNameLabel.leadingAnchor.constraint(equalTo: studentImageView.trailingAnchor, constant: 16),
            studentNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            studentNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            studentSurnameLabel.leadingAnchor.constraint(equalTo: studentImageView.trailingAnchor, constant: 16),
            studentSurnameLabel.topAnchor.constraint(equalTo: studentNameLabel.bottomAnchor, constant: 8),
            studentSurnameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    func configure(with student: Student) {
        studentNameLabel.text = student.studentName
        studentSurnameLabel.text = student.studentSurname
        studentImageView.image = UIImage(systemName: student.studentImage)
    }
}
