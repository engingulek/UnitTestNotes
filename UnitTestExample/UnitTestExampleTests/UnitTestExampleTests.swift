//
//  UnitTestExampleTests.swift
//  UnitTestExampleTests
//
//  Created by engin gülek on 27.05.2023.
//

import XCTest
@testable import UnitTestExample




final class UnitTestExampleTests: XCTestCase {

    var vc : ViewController!
    private var userDefaults : UserDefaults!
    private var userDefaultsSuitName : String!
    

    
// Her test yöntemi için başlangıç ​​durumunu ayarlamak üzere setUp()
    override func setUpWithError() throws {
       try super.setUpWithError()
        userDefaultsSuitName = UUID().uuidString
        userDefaults = UserDefaults(suiteName: userDefaultsSuitName)
      
    }

    override func tearDownWithError() throws {
        // temizlemek için de tearDown() yöntemini kullanabilirsiniz.
        try super.tearDownWithError()
        userDefaults.removeSuite(named: userDefaultsSuitName)
        userDefaults = nil

    }

    
    func testUppercaseFirst_WhenCreated_StringFirstUpperCased() {
        let input = "antoine"
        let expectedOutput = "Antoine"
        XCTAssertEqual(input.upperCasedFirst(), expectedOutput,"The String is not correctly capitalized.")
    }
    
    func testEmptyListOfUsers(){
        let list = ["Engin","Kemal","Ali"]
        // XCTAssert bir çok senaryo için kullanılmaktadır.
        // Bakınız aşşağıdakilerden hepsi aynı anlama gelmektedir.
        XCTAssert(list.count != 0)
        XCTAssertTrue(list.count != 0)
       // XCTAssertEqual(list.count, 0)
    }
    
    func  testSearchQuryStoring(){
        let cache = SearchQueryCache(userDefaults: userDefaults)
        
        // Bu işlemlerin yapılması test sırasında kullanılan default değişkenlerin değiştirilmemesini sağlamaktadır
        // Testin başında temiz bir durum ile başlanılacaktır
    }
    
    // Throw test yönetimide yazılabilinmektedir. Örnek olarak geen json nın dönüştürülmesi
    
    func testDecoding() throws {
        let jsonData = try Data(contentsOf: URL(string: "products.json")!)
        XCTAssertNoThrow(try JSONDecoder().decode(Product.self, from: jsonData))
        
    }
    
    func testFirstNameNotEmpty() throws {
        let viewModel = ["Engin","Kemal","Ali"]
        // XCTUnwrap, isteğe bağlı bir değişkenin değerinin sıfır olmadığını iddia eder ve iddia başarılı olursa değerini döndürür.
        let firstName =  try XCTUnwrap(viewModel.first)
        XCTAssertFalse(firstName.isEmpty)
    }
    
    
    func testOptional() throws {
        let optionalValue : Int? = 10
        let unwrappedValue = try XCTUnwrap(optionalValue)
        XCTAssertEqual(unwrappedValue, 10)
    }
    
    func testOptionalWithoutUnwrap() throws {
        let optionalValue: Int? = nil
        XCTAssertEqual(optionalValue, 10)
    }
    
    /* bu yalnızca bir değer iddia etmemiz gerekiyorsa harika çalışır. Bununla birlikte isteğe bağlı bir örnekte
     özellikler için iddiada bulunacak olsaydınız, örnekte sıfır olduğu için birden fazla başarısız iddiayla sonuçlanabilirsiniz
    
     */
    
   /* func testPersonValues()  {
        let optinalPerson : Person? = nil
        XCTAssertEqual(optinalPerson?.name, "Engin")
        XCTAssertEqual(optinalPerson?.age, 23)
    }*/
    
    func testPersonValues1() throws {
        let optinalPerson : Person? = Person(name: "Engin", age: 10)
        let unwrappedPerson = try XCTUnwrap(optinalPerson)
        XCTAssertEqual(unwrappedPerson.name, "Engin")
        XCTAssertEqual(unwrappedPerson.age, 10)
    }
    // İsteğe bağlı seçenekleri test ederken sıklıkla karşılaştığımız başka bir sorun da XCTAssertTrue veya XCTAssert False'ın isteğe bağlı seçeneklerle çalışmamasıdır:
    
    func testOptinolBool() throws {
        let optinalBool : Bool? = true
       // XCTAssertTrue(optinalBool)
        XCTAssertTrue(optinalBool == true)
        XCTAssert(optinalBool == true)
    }
    
    // Özel kodu doğrulamak için bir çözüm olarak Dependency injection
   // belirli bir örneğin sahte bir sürümünü enjekte ederek özel kodu doğrulamayı mümkün kılar.
    //  Bizim durumumuzda bu, Tracker örneğimizin sahte bir sürümünü oluşturmak anlamına gelir.

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
