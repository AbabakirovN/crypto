//
//  File.swift
//  crypto
//
//  Created by Nurzhan Ababakirov on 17/9/21.
//

import Foundation

struct CryptListStruct: Codable {

    let asset_id, name: String
    let type_is_crypto: Int
    let data_quote_start, data_quoteEnd, data_orderbook_start, data_orderbook_end: String?
    let data_trade_start, data_trade_end: String?
    let data_symbols_count: Int
    let volume_1hrs_usd, volume_1day_usd, volume_1mth_usd: Double
    var price_usd: Double?
    let id_icon, data_start, data_end: String?

}

