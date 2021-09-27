//
//  CryptListTableViewCell.swift
//  crypto
//
//  Created by Nurzhan Ababakirov on 17/9/21.
//

import UIKit

class CryptListTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(cryptsList: CryptListStruct){
        
        nameLabel.text = "\(cryptsList.name) / \(cryptsList.asset_id)"
        
        priceLabel.text = String(format: "%.4f",cryptsList.price_usd ?? 0)
        
    }

}
