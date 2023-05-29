//
//  SendMessageViewModel.swift
//  UnitTestExample
//
//  Created by engin gülek on 29.05.2023.
//

import Foundation

@MainActor class SendMessageViewModel : ObservableObject {
    @Published var message = ""
    @Published private(set) var errorText : String?
    
    private let sender: MessageSender
       private var isSending = false
    
    var buttonTitle : String {isSending ?  "Sending..." : "Send"}
    var isSendingDisabled : Bool {isSending || message.isEmpty}
    
    init(sender : MessageSender){
        self.sender = sender
    }
    
    func send() {
          guard !message.isEmpty else { return }
          guard !isSending else { return }

          isSending = true
          errorText = nil

          Task {
              do {
                  try await sender.sendMessage(message: message)
                  message = ""
              } catch {
                  errorText = error.localizedDescription
              }

              isSending = false
          }
      }
}
