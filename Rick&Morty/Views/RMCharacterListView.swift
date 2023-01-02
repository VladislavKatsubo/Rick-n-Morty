//
//  RMCharacterListView.swift
//  Rick&Morty
//
//  Created by Vlad Katsubo on 1.01.23.
//

import UIKit

// View that handles showing list of characters, loader, etc.
final class RMCharacterListView: UIView {
    
    private let viewModel = RMCharacterListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionvView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RMCharacterCollectionViewCell.self,
                                forCellWithReuseIdentifier: RMCharacterCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(collectionvView, spinner)
        addConstraints()
        spinner.startAnimating()
        
        viewModel.fetchCharacters()
        
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionvView.topAnchor.constraint(equalTo: topAnchor),
            collectionvView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionvView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionvView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    private func setUpCollectionView() {
        collectionvView.delegate = viewModel
        collectionvView.dataSource = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.spinner.stopAnimating()
            self.collectionvView.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.collectionvView.alpha = 1
            }
        })
    }
    
    
}
