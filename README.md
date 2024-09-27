# FunctionCalling-AWSBedrock

This library simplifies the integration of the [FunctionCalling](https://github.com/fumito-ito/FunctionCalling) macro into [AWSBedrock](https://github.com/awslabs/aws-sdk-swift). By using this library, you can directly generate `Tool` objects from Swift native functions, which can then be specified as FunctionCalling when invoking Bedrock.

## Usage

```swift

import FunctionCalling
import FunctionCalling_AWSBedrock
import AWSBedrockRuntime

// MARK: Declare the container and functions for the tools to be called from FunctionCalling.

@FunctionCalling(service: .claude)
struct MyFunctionTools {
    @CallableFunction
    /// Get the current stock price for a given ticker symbol
    ///
    /// - Parameter: The stock ticker symbol, e.g. AMZN for Google Inc.
    func getStockPrice(ticker: String) async throws -> String {
        // code to return stock price of passed ticker
    }
}

// MARK: You can directly pass the tools generated from objects to the model in Bedrock.

let client = try BedrockRuntimeClient(region: "us-east-1")
let input = ConverseInput(toolConfig: .init(tools: MyFunctionTools().bedrockAllTools))
try await client.converse(input: input)
```

## Installation

### Swift Package Manager

```
let package = Package(
    name: "MyPackage",
    products: [...],
    targets: [
        .target(
            "YouAppModule",
            dependencies: [
                .product(name: "FunctionCalling_AWSBedrock", package: "FunctionCalling_AWSBedrock")
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/FunctionCalling/FunctionCalling-AWSBedrock", from: "0.1.0")
    ]
)
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.Please make sure to update tests as appropriate.

## License

The MIT License
