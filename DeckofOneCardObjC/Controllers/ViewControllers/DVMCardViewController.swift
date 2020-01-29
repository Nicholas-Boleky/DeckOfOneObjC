//
//  DVMCardViewController.swift
//  DeckofOneCardObjC
//
//  Created by Nicholas Boleky on 1/28/20.
//  Copyright © 2020 Nicholas Boleky. All rights reserved.
//

import UIKit

class DVMCardViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardSuitLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCards()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func DrawCardButtonPushed(_ sender: Any) {
        self.fetchCards()
    }
    
    
    func fetchCards() {
        DVMCardController.drawANewCard(1) { (cards) in
            if let cards = cards {
                DVMCardController.fetchCardImage(cards[0]) { (cardImage) in
                    DispatchQueue.main.async {
                        if let cardImage = cardImage {
                            self.updateViews(card: cards[0], image: cardImage)
                        }
                    }
                }
            }
        }
    }
    func updateViews(card: DVMCard, image: UIImage) {
        self.cardImageView.image = image
        self.cardSuitLabel.text = card.suit
    }
}//end of class
