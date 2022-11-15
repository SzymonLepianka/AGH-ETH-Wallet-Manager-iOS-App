//
//  WalletView.swift
//  EthWalletManagerApp
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI

struct WalletView: View {
    @Binding var wallets: [EthWallet]
    
    var body: some View {
        List {
            ForEach($wallets) { $wallet in
                NavigationLink(destination: DetailView(wallet: $wallet)) {
                    CardView(wallet: wallet)
                }
//                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("ETH Wallets")
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Wallet")
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WalletView(wallets: .constant(EthWallet.sampleData))
        }
    }
}
