//
//  MainTableViewCell.swift
//  20201130-MVVM-Fipe
//
//  Created by Daniel Nascimento on 03/12/20.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var labelContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(brand: Brand) {
        self.labelContent.text = brand.name
    }

}
