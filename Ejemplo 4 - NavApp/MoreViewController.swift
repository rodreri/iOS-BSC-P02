//
//  MoreViewController.swift
//  Ejemplo 4 - NavApp
//
//  Created by Erick Rodrigo Minero Pineda on 03/09/22.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    
    var movie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitle.text = movie?.title
        lblYear.text = movie?.year
        lblDirector.text = movie?.director
        
    }
}
