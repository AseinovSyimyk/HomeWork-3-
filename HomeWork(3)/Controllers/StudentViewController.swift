//
//  StudentViewController.swift
//  HomeWork(2)
//
//  Created by User on 17/1/24.
//

import UIKit

class StudentViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    var students: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadStudentsFromJSON()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(StudentCollectionViewCell.self, forCellWithReuseIdentifier: "StudentCell")
        setupUI()
    }
    private func setupUI() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return students.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudentCell", for: indexPath) as! StudentCollectionViewCell
        
        let student = students[indexPath.item]
        cell.configure(with: student)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    
    
    private func loadStudentsFromJSON() {
        guard let path = Bundle.main.path(forResource: "Students", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
              let students = JSONParser.parseStudents(data: data) else {
            return
        }
        
        self.students = students
    }
}
