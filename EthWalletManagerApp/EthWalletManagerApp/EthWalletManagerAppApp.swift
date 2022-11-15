//
//  EthWalletManagerAppApp.swift
//  EthWalletManagerApp
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI

@main
struct EthWalletManagerAppApp: App {
    @State private var wallets = EthWallet.sampleData

    var body: some Scene {
        WindowGroup {
            NavigationView {
                WalletView(wallets: $wallets)
            }
        }
    }
}
