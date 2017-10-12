//
// Mechanica
//
// Copyright © 2016-2017 Tinrobots.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

extension RangeReplaceableCollection where Self.Index == Int {

  /// **Mechanica**
  ///
  /// Appends a new `element`.
  @discardableResult
  public func appending(_ element: Element) -> Self {
    var copy = self
    copy.append(element)

    return copy
  }

  /// **Mechanica**
  ///
  /// Removes all the elements that matches the given `condition`.
  /// - Parameters:
  ///   - condition: A closure that takes an element of the sequence as its argument and returns a Boolean value indicating whether the element is a match.
  public mutating func remove(where condition: (Element) -> Bool ) {
    self = filter { !condition($0) }

  }

  /// **Mechanica**
  ///
  /// Removes all the elements that matches the given `condition` and returns a `new` collection.
  /// - Parameters:
  ///   - condition: A closure that takes an element of the sequence as its argument and returns a Boolean value indicating whether the element is a match.
  @discardableResult
  public func removing(where condition: (Element) -> Bool ) -> Self {
    var copy = self
    copy.remove(where: condition)

    return copy
  }

  /// **Mechanica**
  ///
  /// Removes the first element that matches the given `condition`.
  /// - Parameters:
  ///   - condition: A closure that takes an element of the sequence as its argument and returns a Boolean value indicating whether the element is a match.
  public mutating func removeFirst(where condition: (Element) -> Bool) {
    guard let idx = index(where: condition) else { return }

    remove(at: idx)
  }

  /// **Mechanica**
  ///
  /// Removes the first element that matches the given `condition` and returns a `new` collection.
  /// - Parameters:
  ///   - condition: A closure that takes an element of the sequence as its argument and returns a Boolean value indicating whether the element is a match.
  public func removingFirst(where condition: (Element) -> Bool) -> Self {
    var copy = self
    copy.removeFirst(where: condition)

    return copy
  }

  public mutating func removeLast(where condition: (Element) -> Bool) {
    for idx in stride(from: self.endIndex-1, through: 0, by: -1) {
      if condition(self[idx]) {
        remove(at: idx)

        return
      }
    }

  }

  /// **Mechanica**
  ///
  /// Removes the last element that matches the given `condition` and returns a `new` collection.
  /// - Parameters:
  ///   - condition: A closure that takes an element of the sequence as its argument and returns a Boolean value indicating whether the element is a match.
  @discardableResult
  public func removingLast(where condition: (Element) -> Bool) -> Self {
    var copy = self
    copy.removeLast(where: condition)

    return copy
  }

}

extension RangeReplaceableCollection where Self.Index == Int, Element: Equatable {

  /// **Mechanica**
  /// Removes the first specified element from the collection (if exists).
  /// - Parameter element: The element to remove the last occurrence.
  public mutating func removeFirstOccurrence(of element: Element) {
    guard let idx = index(of: element) else { return }

    remove(at: idx)
  }

  /// **Mechanica**
  ///
  /// Removes the last specified element from the array (if exists).
  /// - Parameter element: The element to remove the collection occurrence.
  public mutating func removeLastOccurrence(of element: Element) {
    if let idx = lastIndex(of: element) {
      remove(at: idx)
      return
    }

  }

}
