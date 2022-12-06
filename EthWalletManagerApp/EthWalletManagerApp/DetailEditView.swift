//
//  DetailEditView.swift
//  EthWalletManagerApp
//
//  Created by Guest User on 22/11/2022.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var data: EthWallet.Data
    // @State private var newWalletName = ""
    
    
    var body: some View {
        Form {
            Section(header: Text("Wallet name")) {
                TextField("Title", text: $data.title)
                //                HStack {
                //                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) {
                //                        Text("Length")
                //                    }
                //                    .accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                //                    Spacer()
                //                    Text("\(Int(data.lengthInMinutes)) minutes")
                //                        .accessibilityHidden(true)
                //                }
                //                ThemePicker(selection: $data.theme)
                //            }
                //            Section(header: Text("Attendees")) {
                //                ForEach(data.attendees) { attendee in
                //                    Text(attendee.name)
                //                }
                //                .onDelete { indices in
                //                    data.attendees.remove(atOffsets: indices)
                //                }
                //            }
            }
        }
    }}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(EthWallet.sampleData[0].data))
    }
}
