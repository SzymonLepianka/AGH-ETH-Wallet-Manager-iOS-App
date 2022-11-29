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
//                NavigationLink(destination: MeetingView(scrum: $scrum)) {
//                    Label("Start Meeting", systemImage: "timer")
//                        .font(.headline)
//                        .foregroundColor(.accentColor)
//                }
                HStack {
                    Label("Balance", systemImage: "suit.diamond.fill")
                    Spacer()
                    Text("\(wallet.balance) ETH")
                }
                .accessibilityElement(children: .combine)
//                HStack {
//                    Label("Theme", systemImage: "paintpalette")
//                    Spacer()
//                    Text(scrum.theme.name)
//                        .padding(4)
//                        .foregroundColor(scrum.theme.accentColor)
//                        .background(scrum.theme.mainColor)
//                        .cornerRadius(4)
//                }
//                .accessibilityElement(children: .combine)
            }
            Section(header: Text("QR")) {
//                Image(uiImage: generateQRCode(from: "\("name")\n\("emailAddress")"))
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 200, height: 200)
                Button("Generate QR code") {
                    isPresentingQrCodeView = true
                    qrCodeContentData = wallet.data
                }
//                ForEach(scrum.attendees) { attendee in
//                    Label(attendee.name, systemImage: "person")
//                }
            }
//            Section(header: Text("History")) {
//                if scrum.history.isEmpty {
//                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
//                }
//                ForEach(scrum.history) { history in
//                    HStack {
//                        Image(systemName: "calendar")
//                        Text(history.date, style: .date)
//                    }
//                }
//            }
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
//                    .toolbar {
//                        ToolbarItem(placement: .cancellationAction) {
//                            Button("Cancel") {
//                                isPresentingEditView = false
//                            }
//                        }
//                        ToolbarItem(placement: .confirmationAction) {
//                            Button("Done") {
//                                isPresentingEditView = false
//                                wallet.update(from: data)
//                            }
//                        }
//                    }
            }
        }
    }
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(wallet: .constant(EthWallet.sampleData[0]))
        }
    }
}
