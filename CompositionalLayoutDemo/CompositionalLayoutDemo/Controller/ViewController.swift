//
//  ViewController.swift
//  CompositionalLayoutDemo
//
//  Created by Kévin MAAREK on 26/09/2019.
//  Copyright © 2019 Kévin MAAREK. All rights reserved.
//

import UIKit

fileprivate let GALLERY_SECTION: [Int] = [0, 2]
fileprivate let TEXT_SECTION: [Int] = [3]
fileprivate let LIST_SECTION: [Int] = [1, 4]

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    lazy var collectionView: UICollectionView = {
        let collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.makeLayout())
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(Featured.self, forCellWithReuseIdentifier: "featured")
        collectionView.register(Text.self, forCellWithReuseIdentifier: "text")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.collectionView)
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }

    func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            if GALLERY_SECTION.contains(section) {
                return LayoutBuilder.buildGallerySectionLayout(size: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.25)))
            } else if TEXT_SECTION.contains(section) {
                return LayoutBuilder.buildTextSectionLayout()
            } else {
                return LayoutBuilder.buildTableSectionLayout()
            }
        }
        return layout
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if GALLERY_SECTION.contains(section) {
            return 3
        }
        if TEXT_SECTION.contains(section) {
            return 1
        }
        if LIST_SECTION.contains(section) {
            return 5
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if GALLERY_SECTION.contains(indexPath.section) {
            return CellBuilder.getFeaturedCell(collectionView: collectionView, indexPath: indexPath)
        }
        if TEXT_SECTION.contains(indexPath.section) {
            return CellBuilder.getTextCell(collectionView: collectionView, indexPath: indexPath)
        }
        if LIST_SECTION.contains(indexPath.section) {
            return CellBuilder.getListCell(collectionView: collectionView, indexPath: indexPath)
        }
        return UICollectionViewCell()
    }
}
