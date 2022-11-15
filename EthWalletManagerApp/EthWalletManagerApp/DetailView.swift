//
//  DetailView.swift
//  EthWalletManagerApp
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI

struct DetailView: View {
    @Binding var wallet: EthWallet
    
    @State private var data = EthWallet.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(wallet: .constant(EthWallet.sampleData[0]))
        }
    }
}
