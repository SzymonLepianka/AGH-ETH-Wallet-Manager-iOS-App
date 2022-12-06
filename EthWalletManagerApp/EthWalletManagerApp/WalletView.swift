//
//  WalletView.swift
//  EthWalletManagerApp
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI
import Core
import web3swift
import ActivityIndicatorView

struct WalletView: View {
    @Binding var wallets: [EthWallet]
    @State private var isPresentingNewWalletView = false
    @State private var newWalletData = EthWallet.Data()
    
    @State private var showLoadingIndicator: Bool = false
    
    var body: some View {
        
        
        VStack{
            ActivityIndicatorView(isVisible: $showLoadingIndicator, type: .arcs())
                .frame(width: 100, height: 100)
                .foregroundColor(.brown)
            List {
                ForEach($wallets) { $wallet in
                    NavigationLink(destination: DetailView(wallet: $wallet)) {
                        CardView(wallet: wallet)
                    }
                }
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
            Button("Refresh") {
                print("test")
                showLoadingIndicator = true
//                let ethAdd = EthereumAddress("0x67Fad66A4b7044c75214fA1f3ef33A0f072BDa62")
//                var web3Rinkeby:web3?
                Task {
                    let ethAdd = EthereumAddress("0x67Fad66A4b7044c75214fA1f3ef33A0f072BDa62")
                    let web3Rinkeby = await Web3.InfuraGoerliWeb3()
//                    let balancebigint = web3Rinkeby.eth.getBalance(address: ethAdd).value
                    let balancebigint = try await web3Rinkeby.eth.getBalance(for: ethAdd!)
                    print(balancebigint)
                    showLoadingIndicator = false
//                    let wei = Web3.Utils.formatToEthereumUnits(balancebigint, toUnits: .wei, decimals: 18, decimalSeparator: ",")
//                    Web3.Utils.
//                    print("Ether Balance :\(String(describing: Web3.Utils.formatToEthereumUnits(balancebigint ?? 0)!))")
                }
//                let web3Rinkeby = Web3.InfuraGoerliWeb3()
                
//                let balancebigint = web3Rinkeby.eth.getBalance(address: ethAdd).value
//                print("Ether Balance :\(String(describing: Web3.Utils.formatToEthereumUnits(balancebigint ?? 0)!))")
            }
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
    let mnemonics = try! BIP39.generateMnemonics(bitsOfEntropy: 128)!
    //    print(mnemonics)
    let keystore = try! BIP32Keystore(mnemonics: mnemonics, password: password, mnemonicsPassword: "")!
    //    let title = "New Wallet"
    let keyData = try! JSONEncoder().encode(keystore.keystoreParams)
    let address = keystore.addresses!.first!.address
    
    //    print(address)
    //    print(keystore.addresses)
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
