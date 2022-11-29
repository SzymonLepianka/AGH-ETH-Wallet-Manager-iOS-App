//
//  WalletView.swift
//  EthWalletManagerApp
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI
import Core
import web3swift

struct WalletView: View {
    @Binding var wallets: [EthWallet]
    @State private var isPresentingNewWalletView = false
    @State private var newWalletData = EthWallet.Data()
    
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
            Button(action: {
                isPresentingNewWalletView = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Wallet")
        }
        .sheet(isPresented: $isPresentingNewWalletView) {
                    NavigationView {
                        DetailEditView(data: $newWalletData)
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Dismiss") {
                                        isPresentingNewWalletView = false
                                        newWalletData = EthWallet.Data()
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Add") {
                                        let tempWallet = createAccount(title: newWalletData.title)
//                                        let newWallet = EthWallet(data: newWalletData)
                                        wallets.append(tempWallet)
                                        isPresentingNewWalletView = false
                                        newWalletData = EthWallet.Data()
                                    }
                                }
                            }
                    }
                }
        
    }
}

func createAccount(title: String) -> EthWallet {
    
    let password = "web3swift"
    let bitsOfEntropy: Int = 128 // Entropy is a measure of password strength. Usually used 128 or 256 bits.
    let mnemonics = try! BIP39.generateMnemonics(bitsOfEntropy: bitsOfEntropy)!
//    print(mnemonics)
    let keystore = try! BIP32Keystore(
        mnemonics: mnemonics,
        password: password,
        mnemonicsPassword: "",
        language: .english)!
//    let title = "New Wallet"
    let keyData = try! JSONEncoder().encode(keystore.keystoreParams)
    let address = keystore.addresses!.first!.address
    
//    print(address)
    print(keystore.addresses)
    let wallet = EthWallet(title: title, address: address, privateKey: "privateKey", balance: 0, mnemonics: mnemonics, type: .hd)
    return wallet
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WalletView(wallets: .constant(EthWallet.sampleData))
        }
    }
}
