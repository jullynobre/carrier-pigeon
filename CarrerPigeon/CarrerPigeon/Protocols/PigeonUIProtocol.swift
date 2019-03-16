//
//  PigeonViewControllerProtocol.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 16/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import Foundation

protocol PigeonUI {
	
	func updatePigeonToLoadingState()
	func updatePigeonToFlingState()
	func updatePigeonToUnloadingState()
	func updatePigeonToFlingBackState()
	
	func pullBoxMessages(quantity: Int)
}
