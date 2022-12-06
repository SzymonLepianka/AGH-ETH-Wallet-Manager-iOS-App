//
//  QrCodeView.swift
//  EthWalletManagerApp
//
//  Created by Guest User on 29/11/2022.
//

import SwiftUI

struct QrCodeView: View {
    
    @Binding var qrCodeContentData: EthWallet.Data
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        Form {
            Section(header: Text("QR")) {
                HStack(alignment: .center) {
                    Image(uiImage: generateQRCode(from: "\("name")\n\("emailAddress")"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
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

struct QrCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QrCodeView(qrCodeContentData: .constant(EthWallet.sampleData[0].data))
    }
}

