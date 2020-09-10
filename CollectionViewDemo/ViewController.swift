//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Amirthy Tejeshwar on 10/09/20.
//  Copyright © 2020 Amirthy Tejeshwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var collectionViewLayout: CollectionViewLayout = CollectionViewLayout()
    private var page: Float = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = collectionViewLayout as UICollectionViewLayout
        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .gray
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {

}

class CollectionViewLayout: UICollectionViewFlowLayout {
    
    private var cellHeight: CGFloat = 100.0
    private var cellWidth: CGFloat = 100.0
    var contentInset: UIEdgeInsets = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
    private var numberOfColumns: Int = 1
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else {
            return
        }
        cellWidth = collectionView.frame.width - contentInset.left - contentInset.right
        cellHeight = collectionView.frame.height - contentInset.top - contentInset.bottom
        self.scrollDirection = .horizontal
        self.itemSize = CGSize(width: cellWidth, height: cellHeight)
    }
    
}
