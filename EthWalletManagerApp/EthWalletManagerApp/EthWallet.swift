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
    var type: WalletType
    var mnemonics: String

    init(id: UUID = UUID(),
         title: String,
         address: String,
         privateKey: String,
         balance: Int,
         mnemonics: String,
         type: WalletType) {
        self.id = id
        self.title = title
        self.address = address
        self.privateKey = privateKey
        self.balance = balance
        self.type = type
        self.mnemonics = mnemonics

    }
}

enum WalletType: Equatable {
    case normal
    case hd
}

extension EthWallet {
    struct Data {
        var title: String = ""
        var address: String = ""
        var privateKey: String = ""
        var type: WalletType = .normal
        var mnemonics: String = ""
        var balance: Double = 5
    }
    
    var data: Data {
        Data(title: title,
             address: address,
             privateKey: privateKey,
             type: type,
              mnemonics: mnemonics,
             balance: Double(balance)
        )
    }
    
    mutating func update(from data: Data) {
        title = data.title
        address = data.address
        privateKey = data.privateKey
        balance = Int(data.balance)
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        address = data.address
        balance = Int(data.balance)
        privateKey = data.privateKey
        mnemonics = data.mnemonics
        type = data.type
    }
}

extension EthWallet {
    static let sampleData: [EthWallet] =
    [
        EthWallet(title: "wallet1", address: "adres1", privateKey: "priv1", balance: 111, mnemonics: "mne1", type: .normal),
        EthWallet(title: "wallet3", address: "adres2", privateKey: "priv2", balance: 222, mnemonics: "mne2", type: .normal),
        EthWallet(title: "wallet2", address: "adres3", privateKey: "priv3", balance: 333, mnemonics: "mne3", type: .normal)
    ]
}
