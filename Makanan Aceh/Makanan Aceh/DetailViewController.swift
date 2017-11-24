//
//  DetailViewController.swift
//  Makanan Aceh
//
//  Created by Abi Sayuti on 11/24/17.
//  Copyright © 2017 Abi Sayuti. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var NamaResep: UILabel!
    @IBOutlet weak var Porsi: UILabel!
    @IBOutlet weak var Waktu: UILabel!
    @IBOutlet weak var Harga: UILabel!
    @IBOutlet weak var Bahan: UITextView!
    @IBOutlet weak var Step: UITextView!
    
    
    var passResep:String?
    var passWaktu:String?
    var passPorsi:String?
    var passStep:String?
    var passHarga:String?
    var passBahan:String?

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NamaResep.text = passResep
        Waktu.text = passWaktu
        Porsi.text = passPorsi
        Harga.text = passHarga
        Bahan.text = passBahan
        Step.text = passStep
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    

  

}
