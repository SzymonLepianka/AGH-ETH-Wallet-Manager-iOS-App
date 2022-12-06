//
//  DetailView.swift
//  EthWalletManagerApp
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct DetailView: View {
    @Binding var wallet: EthWallet
    
    @State private var data = EthWallet.Data()
    @State private var isPresentingEditView = false
    
    @State private var qrCodeContentData = EthWallet.Data()
    @State private var isPresentingQrCodeView = false
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        List {
            Section(header: Text("Wallet Info")) {
                HStack {
                    Label("Balance", systemImage: "suit.diamond.fill")
                    Spacer()
                    Text("\(wallet.balance) ETH")
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("QR")) {
                Button("Generate QR code") {
                    isPresentingQrCodeView = true
                    qrCodeContentData = wallet.data
                }
            }
        }
        .navigationTitle(wallet.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = wallet.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(wallet.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                wallet.update(from: data)
                            }
                        }
                    }
            }
        }
        .sheet(isPresented: $isPresentingQrCodeView) {
            NavigationView {
                QrCodeView(qrCodeContentData: $qrCodeContentData)
                    .navigationTitle(wallet.title)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(wallet: .constant(EthWallet.sampleData[0]))
        }
    }
}
