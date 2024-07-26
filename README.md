# NetworkLayer
A simple Network Layer built with Swift & URLSession :)

## Description
This is a light, simple, and powerful Swift Package that allows easy integration of the Network Layer to your iOS project. 

## Getting started
To use this package, you can simply add it to your packages in your iOS project from project's settings, or copy the following code into your Package.swift file:
```
dependencies: [
    .package(url: "https://github.com/iNoor72/NetworkLayer", .upToNextMajor(from: "1.0.0"))
]
```

## How to use it
Using this package is simple, you're going to create an endpoint in your project as an Enum, import NetworkLayer package in the file, and then conform to the Endpoint protocol.
By conforming to the protocol, you're asked to fill in 3 required parameters from the protocol: baseURL, path, and method. You can make an extension on Endpoint protocol and provide some default values to these required parameters or any other parameters you would like.

Your endpoint enum simply would look like the following:
![Screenshot 2024-07-26 at 7 37 32 PM](https://github.com/user-attachments/assets/40449572-60fb-470d-bea9-30bb1a66d291)

Of course, you can provide custom values for queryItems, headers, and parameters variables, as they are by default are set to "nil" in the Endpoint protocol extension in the package.


## License
This project is maintained under a MIT License.

Copyright (c) [2024] [Nooreldin Walid]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
