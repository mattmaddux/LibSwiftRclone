extension String {
    func toMutableCString() -> UnsafeMutablePointer<Int8> {
        return self.withCString { UnsafeMutablePointer(mutating: $0) }
    }
}
