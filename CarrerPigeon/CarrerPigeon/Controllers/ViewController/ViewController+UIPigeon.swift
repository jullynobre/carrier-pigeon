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
        self.pigeonView.pigeonStatusLabel.text = "DORMINDO"
	}
	
	func updatePigeonToLoadingState() {
        self.pigeonView.pigeonStatusLabel.text = "CARREGANDO"
	}
	
	func updatePigeonToFlyingState() {
        self.pigeonView.pigeonStatusLabel.text = "VIAJANDO"
	}
	
	func updatePigeonToUnloadingState() {
        self.pigeonView.pigeonStatusLabel.text = "DESCARREGANDO"
	}
	
	func updatePigeonToFlyingBackState() {
        self.pigeonView.pigeonStatusLabel.text = "VOLTANDO"
	}
    
    func updatePigeonToFreeState() {
        pigeonView.pigeonImage.image = UIImage()
        pigeonView.pigeonStatusLabel.text = "LIVRE"
    }
	
	func boxHas(quantityOfMessages: Int) -> Bool {
		return false
	}
	
	func decreaseBoxMessagesCounter(quantity: Int) {
		boxView.removeFromBox(quantity: quantity)
	}
    
    func flapWings() {
        pigeonImageAnimationIndex = pigeonImageAnimationIndex == 0 ? 1 : 0
        pigeonView.pigeonImage.image = UIImage(named: pigeonImagesNames[pigeonImageAnimationIndex])
    }
    
    func stepLabelLoading() {
        let labelText = pigeonView.pigeonStatusLabel.text
        if (labelText!.countLetter(letter: ".") < 3) {
            pigeonView.pigeonStatusLabel.text = labelText! + "."
        } else {
            let index = labelText!.firstIndex(of: ".") ?? labelText!.endIndex
            pigeonView.pigeonStatusLabel.text = String(labelText![..<index])
        }
    }
}

extension String {
    func countLetter(letter: Character) -> Int {
        return self.reduce(0) {acc, c in c == letter ? acc+1 : acc}
    }
}
