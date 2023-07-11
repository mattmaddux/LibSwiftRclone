// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import LibRcloneCShim

public struct RcloneResult {
    public let output: String
    public let status: Int
}

public struct RcloneRequest {
    public let method: String
    public let body: String
}

public struct LibSwiftClone {
    public static func send(request: RcloneRequest) -> RcloneResult {
        LibRcloneCShim.RcloneInitialize()

        let result: RcloneRPCResult = LibRcloneCShim.RcloneRPC(
            request.method.toMutableCString(),
            request.body.toMutableCString()
        )

        LibRcloneCShim.RcloneFinalize()

        return RcloneResult(
            output: String(cString: result.Output),
            status: Int(result.Status)
        )
    }
}
