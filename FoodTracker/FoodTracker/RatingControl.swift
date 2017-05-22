//
//  RatingControl.swift
//  FoodTracker
//
//  Created by nuke on 22.05.17.
//  Copyright © 2017 Nukersson. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

    // MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0

    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    // MARK: Initialization
    override init(frame: CGRect) {
        // Super class initializer
        super.init(frame: frame)
        setupButtons()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }

    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }

    // MARK: Private Methods
    private func setupButtons() {
        // Clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()

        // Create new buttons
        for _ in 0..<starCount {
            // Create the button
            let button = UIButton()
            button.backgroundColor = UIColor.red

            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true

            // Setup the button action
            button.addTarget(self, action:
                #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)

            // Add the button to the stack
            addArrangedSubview(button)

            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
    }
}
