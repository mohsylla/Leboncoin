//
//  HomeViewController.swift
//  Leboncoin
//
//  Created by Sylla on 23/04/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var pressbutton: UIButton!
    @IBOutlet weak var activtyIndicator: UIActivityIndicatorView!
    var annonce: [Annonce]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activtyIndicator.isHidden = true

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToList"{
            if let segueItem = segue.destination as? ListViewController{
                    segueItem.annonce = annonce
                
            }
        }
    }
    
    @IBAction func pressButton(_ sender: Any) {
        pressbutton.isHidden = true
        activtyIndicator.isHidden = false
        
        DataService.shared.getAnnonce {[weak self] annonces in
            switch annonces {
            case .success(let annonce):
                self?.annonce = annonce
                print("charged ok")
                self?.performSegue(withIdentifier: "segueToList", sender: nil)
            case .failure:
                    print("error")
            }
            
        }
        pressbutton.isHidden = !true
        activtyIndicator.isHidden = !false
    }
    
}
