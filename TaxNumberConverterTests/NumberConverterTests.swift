//
//  NumberConverterTests.swift
//  TaxNumberConverterTests
//
//  Created by Denis Shtangey on 05.09.22.
//

@testable import TaxNumberConverter
import XCTest

class NumberConverterTests: XCTestCase {
    
    var converter: NumberConverter!

    override func setUp() {
        converter = NumberConverter()
    }
    
    override func tearDown() {
        converter = nil
    }

    func test_badenWurttemberg_success() throws {
        // Arrange
        let input = "1234567890"
        
        // Act
        let result = converter.convert(number: input, in: .badenWuerttemberg)
        
        // Assert
        XCTAssertEqual(result, "2812034567890")
    }
    
    func test_badenWurttemberg_wrongLenght() throws {
        // Arrange
        let input = "12345678901"
        
        // Act
        let result = converter.convert(number: input, in: .badenWuerttemberg)
        
        // Assert
        XCTAssertNil(result)
    }
    
    func test_bayern_success() throws {
        // Arrange
        let input = "12345678901"
        
        // Act
        let result = converter.convert(number: input, in: .bayern)
        
        // Assert
        XCTAssertEqual(result, "9123045678901")
    }
    
    func test_bayern_wrongLenght() throws {
        // Arrange
        let input = "1234567890"
        
        // Act
        let result = converter.convert(number: input, in: .bayern)
        
        // Assert
        XCTAssertNil(result)
    }
    
    func test_berlin_success() throws {
        // Arrange
        let input = "1234567890"
        
        // Act
        let result = converter.convert(number: input, in: .berlin)
        
        // Assert
        XCTAssertEqual(result, "1112034567890")
    }
    
    func test_berlin_wrongLenght() throws {
        // Arrange
        let input = "12345678901"
        
        // Act
        let result = converter.convert(number: input, in: .berlin)
        
        // Assert
        XCTAssertNil(result)
    }
    
    func test_brandenburg_success() throws {
        // Arrange
        let input = "12345678901"
        
        // Act
        let result = converter.convert(number: input, in: .brandenburg)
        
        // Assert
        XCTAssertEqual(result, "3123045678901")
    }
    
    func test_brandenburg_wrongLenght() throws {
        // Arrange
        let input = "1234567890"
        
        // Act
        let result = converter.convert(number: input, in: .brandenburg)
        
        // Assert
        XCTAssertNil(result)
    }
    
    func test_bremen_success() throws {
        // Arrange
        let input = "1234567890"

        // Act
        let result = converter.convert(number: input, in: .bremen)

        // Assert
        XCTAssertEqual(result, "2412034567890")
    }

    func test_bremen_wrongLenght() throws {
        // Arrange
        let input = "12345678901"

        // Act
        let result = converter.convert(number: input, in: .bremen)

        // Assert
        XCTAssertNil(result)
    }

    func test_hamburg_success() throws {
        // Arrange
        let input = "1234567890"

        // Act
        let result = converter.convert(number: input, in: .hamburg)

        // Assert
        XCTAssertEqual(result, "2212034567890")
    }

    func test_hamburg_wrongLenght() throws {
        // Arrange
        let input = "12345678901"

        // Act
        let result = converter.convert(number: input, in: .hamburg)

        // Assert
        XCTAssertNil(result)
    }

    func test_hessen_success() throws {
        // Arrange
        let input = "01234567894"

        // Act
        let result = converter.convert(number: input, in: .hessen)

        // Assert
        XCTAssertEqual(result, "2612034567894")
    }

    func test_hessen_wrongLenght() throws {
        // Arrange
        let input = "1234567890"

        // Act
        let result = converter.convert(number: input, in: .hessen)

        // Assert
        XCTAssertNil(result)
    }
    
    func test_hessen_wrongFirstNumber() throws {
        // Arrange
        let input = "12345678901"

        // Act
        let result = converter.convert(number: input, in: .hessen)

        // Assert
        XCTAssertNil(result)
    }

    func test_mecklenburgVorpommern_success() throws {
        // Arrange
        let input = "12345678901"

        // Act
        let result = converter.convert(number: input, in: .mecklenburgVorpommern)

        // Assert
        XCTAssertEqual(result, "4123045678901")
    }

    func test_mecklenburgVorpommern_wrongLenght() throws {
        // Arrange
        let input = "1234567890"

        // Act
        let result = converter.convert(number: input, in: .mecklenburgVorpommern)

        // Assert
        XCTAssertNil(result)
    }
    
    func test_niedersachsen_success() throws {
        // Arrange
        let input = "1234567890"

        // Act
        let result = converter.convert(number: input, in: .niedersachsen)

        // Assert
        XCTAssertEqual(result, "2312034567890")
    }

    func test_niedersachsen_wrongLenght() throws {
        // Arrange
        let input = "12345678901"

        // Act
        let result = converter.convert(number: input, in: .niedersachsen)

        // Assert
        XCTAssertNil(result)
    }

    func test_nordrheinWestfalen_success() throws {
        // Arrange
        let input = "12345678901"

        // Act
        let result = converter.convert(number: input, in: .nordrheinWestfalen)

        // Assert
        XCTAssertEqual(result, "5123045678901")
    }

    func test_nordrheinWestfalen_wrongLenght() throws {
        // Arrange
        let input = "1234567890"

        // Act
        let result = converter.convert(number: input, in: .nordrheinWestfalen)

        // Assert
        XCTAssertNil(result)
    }

    func test_rheinlandPfalz_success() throws {
        // Arrange
        let input = "1234567890"
        
        // Act
        let result = converter.convert(number: input, in: .rheinlandPfalz)
        
        // Assert
        XCTAssertEqual(result, "2712034567890")
    }
    
    func test_rheinlandPfalz_wrongLenght() throws {
        // Arrange
        let input = "12345678901"
        
        // Act
        let result = converter.convert(number: input, in: .rheinlandPfalz)
        
        // Assert
        XCTAssertNil(result)
    }
    
    func test_saarland_success() throws {
        // Arrange
        let input = "12345678901"
        
        // Act
        let result = converter.convert(number: input, in: .saarland)
        
        // Assert
        XCTAssertEqual(result, "1123045678901")
    }
    
    func test_saarland_wrongLenght() throws {
        // Arrange
        let input = "1234567890"
        
        // Act
        let result = converter.convert(number: input, in: .saarland)
        
        // Assert
        XCTAssertNil(result)
    }
    
    func test_sachsenFreistaat_success() throws {
        // Arrange
        let input = "12345678901"
        
        // Act
        let result = converter.convert(number: input, in: .sachsenFreistaat)
        
        // Assert
        XCTAssertEqual(result, "3123045678901")
    }
    
    func test_sachsenFreistaat_wrongLenght() throws {
        // Arrange
        let input = "1234567890"
        
        // Act
        let result = converter.convert(number: input, in: .sachsenFreistaat)
        
        // Assert
        XCTAssertNil(result)
    }

    func test_sachsenAnhalt_success() throws {
        // Arrange
        let input = "12345678901"
        
        // Act
        let result = converter.convert(number: input, in: .sachsenAnhalt)
        
        // Assert
        XCTAssertEqual(result, "3123045678901")
    }
    
    func test_sachsenAnhalt_wrongLenght() throws {
        // Arrange
        let input = "1234567890"
        
        // Act
        let result = converter.convert(number: input, in: .sachsenAnhalt)
        
        // Assert
        XCTAssertNil(result)
    }
    
    func test_schleswigHolstein_success() throws {
        // Arrange
        let input = "1234567890"

        // Act
        let result = converter.convert(number: input, in: .schleswigHolstein)

        // Assert
        XCTAssertEqual(result, "2112034567890")
    }

    func test_schleswigHolstein_wrongLenght() throws {
        // Arrange
        let input = "12345678901"

        // Act
        let result = converter.convert(number: input, in: .schleswigHolstein)

        // Assert
        XCTAssertNil(result)
    }
    
    func test_thueringen_success() throws {
        // Arrange
        let input = "12345678901"
        
        // Act
        let result = converter.convert(number: input, in: .thueringen)
        
        // Assert
        XCTAssertEqual(result, "4123045678901")
    }
    
    func test_thueringen_wrongLenght() throws {
        // Arrange
        let input = "1234567890"
        
        // Act
        let result = converter.convert(number: input, in: .thueringen)
        
        // Assert
        XCTAssertNil(result)
    }
}
