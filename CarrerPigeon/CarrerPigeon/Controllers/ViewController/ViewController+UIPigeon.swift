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
        DispatchQueue.main.async{
            self.pigeonView.pigeonStatusLabel.text = "ESPERANDO"
        }
	}
	
	func updatePigeonToLoadingState() {
        DispatchQueue.main.async{
            self.pigeonView.pigeonStatusLabel.text = "CARREGANDO"
        }
	}
	
	func updatePigeonToFlyingState() {
        DispatchQueue.main.async{
            self.pigeonView.pigeonStatusLabel.text = "VIAJANDO"
        }
	}
	
	func updatePigeonToUnloadingState() {
        DispatchQueue.main.async{
            self.pigeonView.pigeonStatusLabel.text = "DESCARREGANDO"
        }
	}
	
	func updatePigeonToFlyingBackState() {
        DispatchQueue.main.async{
            self.pigeonView.pigeonStatusLabel.text = "VOLTANDO"
        }
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
