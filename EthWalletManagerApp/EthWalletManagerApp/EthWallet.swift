//
//  EthWallet.swift
//  EthWalletManagerApp
//
//  Created by Guest User on 15/11/2022.
//

import Foundation

struct EthWallet: Identifiable {
    let id: UUID
    var title: String
    var address: String
    var privateKey: String
    var balance: Int
    
    init(id: UUID = UUID(), title: String, address: String, privateKey: String, balance: Int) {
        self.id = id
        self.title = title
        self.address = address
        self.privateKey = privateKey
        self.balance = balance
    }
}

extension EthWallet {
    struct Data {
        var title: String = ""
        var address: String = ""
        var privateKey: String = ""
        var balance: Double = 5
    }
    
    var data: Data {
        Data(title: title, address: address, privateKey: privateKey, balance: Double(balance))
    }
    
    mutating func update(from data: Data) {
        title = data.title
        address = data.address
        privateKey = data.privateKey
        balance = Int(data.balance)
    }
}

extension EthWallet {
    static let sampleData: [EthWallet] =
    [
        EthWallet(title: "wallet1", address: "adres1", privateKey: "priv1", balance: 111),
        EthWallet(title: "wallet3", address: "adres2", privateKey: "priv2", balance: 222),
        EthWallet(title: "wallet2", address: "adres3", privateKey: "priv3", balance: 333)
    ]
}
