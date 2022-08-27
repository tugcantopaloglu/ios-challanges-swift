//
//  SymbolCell.swift
//  frks_challenge
//
//  Created by Yilmaz Gursoy on 23.08.2022.
//

import UIKit

class SymbolCell: UITableViewCell {
    @IBOutlet weak var symbolName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var field1Label: UILabel!
    @IBOutlet weak var field2Label: UILabel!
    
//    {
//      tke = "GARAN.E.BIST"
//      clo = "12:42:31"
//      pdd = "1,63"
//      las = "26,180"
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func createCell(symbol:Symbol) {
        symbolName.text = symbol.tke
        date.text = symbol.clo
        field1Label.text = symbol.pdd
        field2Label.text = symbol.las
    }
    
}
