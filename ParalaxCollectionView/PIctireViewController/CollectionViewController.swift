//
//  CollectionViewController.swift
//  ParalaxCollectionView
//
//  Created by Alexandr Lobanov on 5/29/19.
//  Copyright © 2019 Alexandr Lobanov. All rights reserved.
//

import UIKit

protocol CollectionViewCompatiable {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! 
    
    private var models: [CollectionViewCompatiable] = []
    var didSelectModel: ((CollectionViewCompatiable) -> Void)?
    
    init(models: [CollectionViewCompatiable]) {
        self.models = models
        super.init(nibName: "CollectionViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make it responds to highlight state faster
        collectionView.delaysContentTouches = false
        
        setupCollectionView()
        collectionView.reloadData()
    }
    
    private func setupCollectionView() {
        let className = String.init(describing: PictureCollectionViewCell.self)
        let nib = UINib.init(nibName: className, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: className)
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        HaptikEngine.feedbackGenerator(.light)
        didSelectModel?(model)
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return models[indexPath.row].collectionView(collectionView, cellForItemAt: indexPath)
    }
}
