//
//  daysCell.swift
//  repCount
//
//  Created by Anton Samuilov on 28/10/2020.
//

import UIKit

class daysCell: UITableViewCell {
    @IBOutlet weak var exerciseName: UILabel!
    @IBOutlet weak var exerciseReps: UILabel!
    @IBOutlet weak var exerciseSets: UILabel!
    
    @IBOutlet weak var lable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
