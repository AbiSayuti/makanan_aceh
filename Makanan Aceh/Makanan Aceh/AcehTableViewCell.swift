//
//  AcehTableViewCell.swift
//  Makanan Aceh
//
//  Created by Abi Sayuti on 11/24/17.
//  Copyright © 2017 Abi Sayuti. All rights reserved.
//

import UIKit

class AcehTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labelNamaResep: UILabel!
    
    @IBOutlet weak var labelPorsi: UILabel!
    
    @IBOutlet weak var labelHarga: UILabel!
    @IBOutlet weak var labelWaktu: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
