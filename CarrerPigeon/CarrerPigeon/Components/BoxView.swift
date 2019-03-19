//
//  BoxView.swift
//  CarrerPigeon
//
//  Created by Jully Nobre on 18/03/19.
//  Copyright © 2019 Jully Nobre. All rights reserved.
//

import UIKit

class BoxView: UIView {

	@IBOutlet var contentView: UIView!
	@IBOutlet weak var boxImage: UIImageView!
	@IBOutlet weak var progressLabel: UILabel!
	@IBOutlet weak var progressBar: UIProgressView!
	
	/*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
	
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
	}

}
