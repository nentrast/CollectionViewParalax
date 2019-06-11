//
//  HaptikEngine.swift
//  ParalaxCollectionView
//
//  Created by Alexandr Lobanov on 6/6/19.
//  Copyright © 2019 Alexandr Lobanov. All rights reserved.
//

import UIKit

final class HaptikEngine {
    
    private init () {
        
    }
    
    class func notificationOccure(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator.init()
        generator.notificationOccurred(type)
    }
    
    class func feedbackGenerator(_ syle: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator.init(style: syle)
        generator.impactOccurred()
    }
    
    class func selecctiongenerator() {
        let generator = UISelectionFeedbackGenerator.init()
        generator.selectionChanged()
    }
}
