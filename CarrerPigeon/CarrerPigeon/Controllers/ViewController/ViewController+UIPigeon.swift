//
//  ViewController+UIPigeon.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 17/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UIPigeon {
	func updatePigeonToWaitingState() {
		print("P Waiting")
	}
	
	func updatePigeonToLoadingState() {
		print("P Loading")
	}
	
	func updatePigeonToFlyingState() {
		print("P Flying")
	}
	
	func updatePigeonToUnloadingState() {
		print("P Unloading")
	}
	
	func updatePigeonToFlyingBackState() {
		print("P Flying back")
	}
	
	func boxHas(quantityOfMessages: Int) -> Bool {
		return false
	}
	
	func decreaseBoxMessagesCounter(quantity: Int) {
		print(quantity)
	}
    
    func flapWings() {pigeonImageAnimationIndex = pigeonImageAnimationIndex == 0 ? 1 : 0
        pigeonView.pigeonImage.image = UIImage(named: pigeonImagesNames[pigeonImageAnimationIndex])
    }
}
