//
//  PigeonViewControllerProtocol.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 16/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation

protocol UIPigeon {
	
	func updatePigeonToWaitingState()
	func updatePigeonToLoadingState()
	func updatePigeonToFlingState()
	func updatePigeonToUnloadingState()
	func updatePigeonToFlingBackState()
	
	func boxHas(quantityOfMessages: Int) -> Bool
	func decreaseBoxMessagesCounter(quantity: Int)
	
}
