//
//  BoxView.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 18/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import UIKit
import Foundation

class BoxView: UIView {

	@IBOutlet var contentView: UIView!
	@IBOutlet weak var boxImage: UIImageView!
	@IBOutlet weak var progressLabel: UILabel!
	@IBOutlet weak var progressBar: UIProgressView!
    
    let muxSemaphore = DispatchSemaphore(value: 1)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	private func commonInit() {
		Bundle.main.loadNibNamed("BoxView", owner: self, options: nil)
		addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
		
        configureProgressBar()
		
	}
	
    private func configureProgressBar() {
        self.progressBar.transform = CGAffineTransform(scaleX: 1, y: 5)
        
        self.progressBar.layer.cornerRadius = 5.0
        self.progressBar.clipsToBounds = true
    }
	
	func setCapacity(capacity: Int) {
		self.progressLabel.text = "0/\(capacity)"
		
		self.boxImage.image = UIImage(named: "mail-box")
	}
	
	func addToBox(quantity: Int) {
        muxSemaphore.wait()
		let progessArr = self.progressLabel.text!.components(separatedBy: "/")
		let itens = Int(progessArr[0])! + quantity
		let capacity = Int(progessArr[1])!
		
		self.progressLabel.text = "\(itens)/\(capacity)"
		self.progressBar.setProgress(Float(itens)/Float(capacity), animated: true)
        muxSemaphore.signal()
	}
	
	func removeFromBox(quantity: Int) {
        muxSemaphore.wait()
		let progessArr = self.progressLabel.text!.components(separatedBy: "/")
		let itens = Int(progessArr[0])! - quantity
		let capacity = Int(progessArr[1])!
		
		self.progressLabel.text = "\(itens)/\(capacity)"
		self.progressBar.setProgress(Float(itens)/Float(capacity), animated: true)
        muxSemaphore.signal()
	}
	
}
