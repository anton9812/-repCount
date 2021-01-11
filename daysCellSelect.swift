//
//  daysCellSelect.swift
//  repCount
//
//  Created by Anton Samuilov on 11/11/2020.
//

import UIKit

class daysCellSelect: UITableViewCell {

    
    @IBOutlet weak var tickButton: UIButton!
    
    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = .white

        // Configure the view for the selected state
    }

}


