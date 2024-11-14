import Testing
@testable import FunctionCalling_AWSBedrock
import FunctionCalling

actor BedrockTests {
    @FunctionCalling(service: .claude)
    struct FunctionContainer {
        /// Return current weather of location that passed by the argument
        /// - Parameter location: location that
        /// - Returns: string of weather
        @CallableFunction
        func getWeather(location: String) -> String {
            return "Sunny"
        }

        @CallableFunction
        func getStock(args: String) -> Int {
            return 0
        }
    }

    @Test func checkConvertedResults() async throws {
        let functions = try FunctionContainer().bedrockAllTools

        #expect(functions.count == 2)

        let getWeather = try #require(functions.first?.toolSpecification)
        #expect(getWeather.name == "getWeather")
        // swiftlint:disable line_length
        #expect(getWeather.description == """
        Return current weather of location that passed by the argument- Parameter location: location that- Returns: string of weather
        """)
        // swiftlint:enable line_length

        let getStock = try #require(functions[1].toolSpecification)
        #expect(getStock.name == "getStock")
        #expect(getStock.description == "")
    }
}
