//
//  PigeonViewControllerProtocol.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 16/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation

protocol UIPigeon {
    
    var pigeonView: PigeonView! {get set}
	
	func updatePigeonToWaitingState()
	func updatePigeonToLoadingState()
	func updatePigeonToFlyingState()
	func updatePigeonToUnloadingState()
	func updatePigeonToFlyingBackState()
	
	func boxHas(quantityOfMessages: Int) -> Bool
	func decreaseBoxMessagesCounter(quantity: Int)
	
    func flapWings()
    func stepLabelLoading()
}
