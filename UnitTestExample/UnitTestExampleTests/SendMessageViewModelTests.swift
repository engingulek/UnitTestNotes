//
//  SendMessageViewModelTests.swift
//  UnitTestExampleTests
//
//  Created by engin gülek on 29.05.2023.
//

import XCTest
@testable import UnitTestExample
final class SendMessageViewModelTests: XCTestCase {

    private var sender: MessageSenderMock!
       private var viewModel: SendMessageViewModel!
   @MainActor override func setUpWithError() throws {
       try super.setUpWithError()
       sender = MessageSenderMock()
            viewModel = SendMessageViewModel(sender: sender)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    @MainActor func testSendingDisabledWhileMessageIsEmpty(){
        XCTAssertTrue(viewModel.isSendingDisabled)
               viewModel.message = "Message"
               XCTAssertFalse(viewModel.isSendingDisabled)
               viewModel.message = ""
               XCTAssertTrue(viewModel.isSendingDisabled)
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
