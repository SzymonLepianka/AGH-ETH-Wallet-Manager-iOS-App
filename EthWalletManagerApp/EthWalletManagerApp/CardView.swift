//
//  CardView.swift
//  EthWalletManagerApp
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI

struct CardView: View {
    let wallet: EthWallet
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(wallet.title)
                    .accessibilityAddTraits(.isHeader)
                    .font(.headline)
                Spacer()
                Label("\(wallet.address)", systemImage: "link.circle")
                    .accessibilityLabel("address: \(wallet.address)")
                Spacer()
                Label("\(wallet.balance)", systemImage: "suit.diamond.fill")
                    .accessibilityLabel("\(wallet.balance) ETH")
            }
            .padding()
            .foregroundColor(.brown)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var wallet = EthWallet.sampleData[0]
    static var previews: some View {
        CardView(wallet: wallet)
            .background(.mint)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
