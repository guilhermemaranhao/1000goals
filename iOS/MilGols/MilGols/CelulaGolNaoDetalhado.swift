//
//  CelulaGolNaoDetalhado.swift
//  MilGols
//
//  Created by Guilherme Maranhao on 29/09/15.
//  Copyright © 2015 Scrum Masters. All rights reserved.
//

import UIKit

class CelulaGolNaoDetalhado: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
