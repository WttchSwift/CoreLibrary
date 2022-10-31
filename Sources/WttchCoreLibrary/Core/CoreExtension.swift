
import Foundation

/// 简单比较器, 使用 comparableValue 返回的值进行 Comparable 比较
public protocol ValueWrapper : Equatable {
    associatedtype T : Comparable, Hashable
    
    /// 使用返回的值进行 Comparable 比较
    func comparableValue() -> T
}

/// 扩展比较器的一些方法
public extension ValueWrapper {
    static func > (lhs: Self, rhs: Self) -> Bool {
        return lhs.comparableValue() > rhs.comparableValue()
    }
    static func >= (lhs: Self, rhs: Self) -> Bool {
        return lhs.comparableValue() >= rhs.comparableValue()
    }
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.comparableValue() < rhs.comparableValue()
    }
    static func <= (lhs: Self, rhs: Self) -> Bool {
        return lhs.comparableValue() <= rhs.comparableValue()
    }
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.comparableValue() == rhs.comparableValue()
    }
    var hashValue: Int {
        get {
            return comparableValue().hashValue
        }
    }
    func hash(into hasher: inout Hasher) {
        comparableValue().hash(into: &hasher)
    }
}
