//
//  ViewController.swift
//  ParalaxCollectionView
//
//  Created by Alexandr Lobanov on 5/29/19.
//  Copyright © 2019 Alexandr Lobanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var models: [Picture] = []
        let anna = User.init(image: #imageLiteral(resourceName: "connor"), name: "Anna")
        let helen = User.init(image: #imageLiteral(resourceName: "jonathan"), name: "Helen")
        let yan = User.init(image: #imageLiteral(resourceName: "kevin"), name: "Yan")

        models.append(Picture.init(image: #imageLiteral(resourceName: "leon"), user: anna))
        models.append(Picture.init(image: #imageLiteral(resourceName: "patrick"), user: helen))
        models.append(Picture.init(image: #imageLiteral(resourceName: "zuyet"), user: yan))
        models.append(Picture.init(image: #imageLiteral(resourceName: "patrick"), user: anna))
        models.append(Picture.init(image: #imageLiteral(resourceName: "leon"), user: helen))
        models.append(Picture.init(image: #imageLiteral(resourceName: "zuyet"), user: yan))

        let controller = CollectionViewController.init(models: models)
        controller.didSelectModel = showTappedModel
        addViewController(controller)
    }
    
    func showTappedModel(_ model: CollectionViewCompatiable) {
//        let detailedProfileVC = DetailedProfileViewController()
//        detailedProfileVC.transitioningDelegate = self
//        present(detailedProfileVC, animated: true, completion: nil)
    }
    
    func addViewController(_ vc: UIViewController) {
        vc.view.frame = collectionViewContainer.bounds
        vc.willMove(toParent: self)
        collectionViewContainer.addSubview(vc.view)
        addChild(vc)
        vc.didMove(toParent: self)
    }

//    let controller:MyView = self.storyboard!.instantiateViewControllerWithIdentifier("MyView") as! MyView
//    controller.ANYPROPERTY=THEVALUE // If you want to pass value
//    controller.view.frame = self.view.bounds;
//    controller.willMoveToParentViewController(self)
//    self.view.addSubview(controller.view)
//    self.addChildViewController(controller)
//    controller.didMoveToParentViewController(self)
//
//
//    self.willMoveToParentViewController(nil)
//    self.view.removeFromSuperview()
//    self.removeFromParentViewController()


}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PopCustomAnimator()
    }
}
