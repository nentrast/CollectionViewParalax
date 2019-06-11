//
//  Picture.swift
//  ParalaxCollectionView
//
//  Created by Alexandr Lobanov on 5/29/19.
//  Copyright © 2019 Alexandr Lobanov. All rights reserved.
//

import UIKit

struct Picture: CollectionViewCompatiable {
    let image: UIImage
    let user: User
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCollectionViewCell",
                                                            for: indexPath) as? PictureCollectionViewCell else {
            fatalError()
        }
        cell.configure(model: self)
        return cell
    }
}

struct User {
    let image: UIImage
    let name: String
}
