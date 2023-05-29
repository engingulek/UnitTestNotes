//
//  SendMessageView.swift
//  UnitTestExample
//
//  Created by engin gülek on 29.05.2023.
//

import SwiftUI

struct SendMessageView: View {
    @ObservedObject var viewModel : SendMessageViewModel
    var sender: MessageSender
    
    @State private var message = ""
    @State private var isSending = false
    @State private var sendingError: Error?
    var body: some View {
        VStack(alignment: .leading) {
                   Text("Your message:")

                   TextEditor(text: $viewModel.message)

                   Button(viewModel.buttonTitle) {
                       viewModel.send()
                   }
                   .disabled(viewModel.isSendingDisabled)

                   if let errorText = viewModel.errorText {
                       Text(errorText).foregroundColor(.red)
                   }
               }
    }
}

