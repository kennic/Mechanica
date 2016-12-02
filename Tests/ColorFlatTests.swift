//
//  ColorFlatTests.swift
//  Mechanica
//
//  Copyright © 2016 Tinrobots.
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

import XCTest
@testable import Mechanica

class ColorFlatTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func test_flat_colors() {
    XCTAssert(Color.black.hexString == "#000000")
    XCTAssert(Color.Flat.turquoise.hexString == "#1abc9c")
    XCTAssert(Color.Flat.greenSea.hexString == "#16a085")
    XCTAssert(Color.Flat.nephritis.hexString == "#27ae60")
    XCTAssert(Color.Flat.emerald.hexString == "#2ecc71")
    XCTAssert(Color.Flat.belizeHole.hexString == "#2980b9")
    XCTAssert(Color.Flat.peterRiver.hexString == "#3498db")
    XCTAssert(Color.Flat.wisteria.hexString == "#8e44ad")
    XCTAssert(Color.Flat.amethyst.hexString == "#9b59b6")
    XCTAssert(Color.Flat.midnightBlue.hexString == "#2c3e50")
    XCTAssert(Color.Flat.wetAsphalt.hexString == "#34495e")
    XCTAssert(Color.Flat.sunFlower.hexString == "#f1c40f")
    XCTAssert(Color.Flat.orange.hexString == "#f39c12")
    XCTAssert(Color.Flat.carrot.hexString == "#e67e22")
    XCTAssert(Color.Flat.pumpkin.hexString == "#d35400")
    XCTAssert(Color.Flat.alizarin.hexString == "#e74c3c")
    XCTAssert(Color.Flat.pomegranate.hexString == "#c0392b")
    XCTAssert(Color.Flat.clouds.hexString == "#ecf0f1")
    XCTAssert(Color.Flat.silver.hexString == "#bdc3c7")
    XCTAssert(Color.Flat.concrete.hexString == "#95a5a6")
    XCTAssert(Color.Flat.asbestos.hexString == "#7f8c8d")
    
  }
  
  func test_demo() {
    
      //P3{234,51,35}
      let redP3 = Color(displayP3Red: 234/255, green: 51/255, blue: 35/255, alpha: 255/255)
      let redRGBA = Color(red: 255/255, green: 0/255, blue: 0/255, alpha: 255/255)
      
      XCTAssert(redP3.rgbaExtended! == redRGBA.rgba!)
      
    
    
       let peterRiverP3 = Color(displayP3Red: 0.322, green: 0.588, blue: 0.835, alpha: 1.0)
      let peterRiverRGBA = Color(red: 52/255, green: 152/255, blue: 219/255, alpha: 255/255)
        //Color.Flat.peterRiver
      //rgba(52, 152, 219, 255)
  
     XCTAssert(peterRiverP3.rgbaExtended! == peterRiverRGBA.rgba!)
    
    
      //(142, 68, 173, 1.0)
      let wisteriaP3 = Color(displayP3Red: 132/255, green: 72/255, blue: 167/255, alpha: 255/255)
      let wisteriaRGBA = Color(red: 142/255, green: 68/255, blue: 173/255, alpha: 255/255)
      
         XCTAssert(wisteriaP3.rgbaExtended! == wisteriaRGBA.rgba!)

    

    
  }
  
}
  extension Color {
  public final var rgbaExtended: (red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8)? {
    
    let color = self.cgColor.converted(to: CGColorSpace(name: CGColorSpace.sRGB)!, intent: CGColorRenderingIntent.defaultIntent, options: nil)!
    
    let r : CGFloat = color.components![0]
    let g : CGFloat = color.components![1]
    let b : CGFloat = color.components![2]
    let a : CGFloat = color.components![3]
    
    return (red: UInt8(round(r * 255)), green: UInt8(round(g * 255)), blue: UInt8(round(b * 255)), alpha: UInt8(round(a * 255)))
  }
    
    
  }

