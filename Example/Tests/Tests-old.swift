// https://github.com/Quick/Quick

@testable import MeshbluHttp
import Quick
import Nimble
import Alamofire
import SwiftyJSON
import OHHTTPStubs

class MeshbluHttpSpec: QuickSpec {
  override func spec() {
    afterSuite {
      OHHTTPStubs.removeAllStubs()
    }
    
    describe(".register") {
      var mockRequester: MeshbluHttpRequester!
      var responseJSON: JSON!
      var responseError: NSError!
      var meshblu: MeshbluHttp!
      
      beforeEach {
        mockRequester = MeshbluHttpRequester()
        meshblu = MeshbluHttp(requester: mockRequester)
      }
      
      describe("when successful") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let stubData = "Hello World!".dataUsingEncoding(NSUTF8StringEncoding)
            return OHHTTPStubsResponse(data: stubData!, statusCode:200, headers:nil)
          }
          waitUntil { done in
            meshblu.register([:]) { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }
        
        it("should return the uuid") {
          expect(responseJSON["uuid"].string) == "123"
        }
        
        it("should not have an error") {
          expect(responseError).to(beNil())
        }
      }
    }
  }
}
      
//      describe("when error") {
//        beforeEach {
//          let error = NSError()
//          mockRequester.postResponse = Result(error: error)
//          waitUntil { done in
//            meshblu.register([:]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should not return a value") {
//          expect(responseJSON).to(beNil())
//        }
//        
//        it("should have an error") {
//          expect(responseError).to(beAKindOf(NSError))
//        }
//      }
//    }

    
//    describe(".message") {
//      var mockRequester: MockHttpRequester!
//      var responseJSON: JSON!
//      var responseError: NSError!
//      var meshblu: MeshbluHttp!
//      
//      beforeEach {
//        mockRequester = MockHttpRequester()
//        meshblu = MeshbluHttp(requester: mockRequester)
//      }
//      
//      describe("when successful") {
//        beforeEach {
//          mockRequester.postResponse = Result(value: JSON(["devices":["*"], "topic":"test"]))
//          waitUntil { done in
//            meshblu.message(["devices":["*"], "topic":"test"]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should return the message") {
//          expect(responseJSON["topic"].string) == "test"
//        }
//        
//        it("should not have an error") {
//          expect(responseError).to(beNil())
//        }
//      }
//      
//      describe("when error") {
//        beforeEach {
//          let error = NSError()
//          mockRequester.postResponse = Result(error: error)
//          waitUntil { done in
//            meshblu.message(["devices":["*"], "topic":"test"]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should not return a value") {
//          expect(responseJSON).to(beNil())
//        }
//        
//        it("should have an error") {
//          expect(responseError).to(beAKindOf(NSError))
//        }
//      }
//    }
//    
//    describe(".data") {
//      var mockRequester: MockHttpRequester!
//      var responseJSON: JSON!
//      var responseError: NSError!
//      var meshblu: MeshbluHttp!
//      
//      beforeEach {
//        mockRequester = MockHttpRequester()
//        meshblu = MeshbluHttp(requester: mockRequester)
//      }
//      
//      describe("when successful") {
//        beforeEach {
//          mockRequester.postResponse = Result(value: JSON(["data":"blah"]))
//          waitUntil { done in
//            meshblu.data("uuid", message: ["data":"blah"]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should return the message") {
//          expect(responseJSON["data"].string) == "blah"
//        }
//        
//        it("should not have an error") {
//          expect(responseError).to(beNil())
//        }
//      }
//      
//      describe("when error") {
//        beforeEach {
//          let error = NSError()
//          mockRequester.postResponse = Result(error: error)
//          waitUntil { done in
//            meshblu.data("uuid", message: ["data":"blah"]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should not return a value") {
//          expect(responseJSON).to(beNil())
//        }
//        
//        it("should have an error") {
//          expect(responseError).to(beAKindOf(NSError))
//        }
//      }
//      
//    }
//    
//    describe(".data") {
//      var mockRequester: MockHttpRequester!
//      var responseJSON: JSON!
//      var responseError: NSError!
//      var meshblu: MeshbluHttp!
//      
//      beforeEach {
//        mockRequester = MockHttpRequester()
//        meshblu = MeshbluHttp(requester: mockRequester)
//      }
//      
//      describe("when successful") {
//        beforeEach {
//          mockRequester.postResponse = Result(value: JSON(["data":"blah"]))
//          waitUntil { done in
//            meshblu.data("uuid", message: ["data":"blah"]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should return the message") {
//          expect(responseJSON["data"].string) == "blah"
//        }
//        
//        it("should not have an error") {
//          expect(responseError).to(beNil())
//        }
//      }
//      
//      describe("when error") {
//        beforeEach {
//          let error = NSError()
//          mockRequester.postResponse = Result(error: error)
//          waitUntil { done in
//            meshblu.getData("uuid", options: ["data":"blah"]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should not return a value") {
//          expect(responseJSON).to(beNil())
//        }
//        
//        it("should have an error") {
//          expect(responseError).to(beAKindOf(NSError))
//        }
//      }
//      
//    }
//    
//    describe(".getData") {
//      var mockRequester: MockHttpRequester!
//      var responseJSON: JSON!
//      var responseError: NSError!
//      var meshblu: MeshbluHttp!
//      
//      beforeEach {
//        mockRequester = MockHttpRequester()
//        meshblu = MeshbluHttp(requester: mockRequester)
//      }
//      
//      describe("when successful") {
//        beforeEach {
//          mockRequester.getResponse = Result(value: JSON(["data":"blah"]))
//          waitUntil { done in
//            meshblu.getData("uuid", options: ["data":"blah"]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should return the message") {
//          expect(responseJSON["data"].string) == "blah"
//        }
//        
//        it("should not have an error") {
//          expect(responseError).to(beNil())
//        }
//      }
//      
//      describe("when error") {
//        beforeEach {
//          let error = NSError()
//          mockRequester.getResponse = Result(error: error)
//          waitUntil { done in
//            meshblu.getData("uuid", options: ["data":"blah"]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should not return a value") {
//          expect(responseJSON).to(beNil())
//        }
//        
//        it("should have an error") {
//          expect(responseError).to(beAKindOf(NSError))
//        }
//      }
//      
//    }
//    
//    describe(".getPublicKey") {
//      var mockRequester: MockHttpRequester!
//      var responseJSON: JSON!
//      var responseError: NSError!
//      var meshblu: MeshbluHttp!
//      
//      beforeEach {
//        mockRequester = MockHttpRequester()
//        meshblu = MeshbluHttp(requester: mockRequester)
//      }
//      
//      describe("when successful") {
//        beforeEach {
//          mockRequester.getResponse = Result(value: JSON(["publicKey":"blah"]))
//          waitUntil { done in
//            meshblu.getPublicKey("uuid") { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should return the message") {
//          expect(responseJSON["publicKey"].string) == "blah"
//        }
//        
//        it("should not have an error") {
//          expect(responseError).to(beNil())
//        }
//      }
//      
//      describe("when error") {
//        beforeEach {
//          let error = NSError()
//          mockRequester.getResponse = Result(error: error)
//          waitUntil { done in
//            meshblu.getPublicKey("uuid") { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should not return a value") {
//          expect(responseJSON).to(beNil())
//        }
//        
//        it("should have an error") {
//          expect(responseError).to(beAKindOf(NSError))
//        }
//      }
//      
//    }
//    
//    describe(".devices") {
//      var mockRequester: MockHttpRequester!
//      var responseJSON: JSON!
//      var responseError: NSError!
//      var meshblu: MeshbluHttp!
//      
//      beforeEach {
//        mockRequester = MockHttpRequester()
//        meshblu = MeshbluHttp(requester: mockRequester)
//      }
//      
//      describe("when successful") {
//        beforeEach {
//          mockRequester.getResponse = Result(value: JSON([["something":"test"]]))
//          waitUntil { done in
//            meshblu.devices([:]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should return a list of devices") {
//          expect(responseJSON[0]["something"].string) == "test"
//        }
//        
//        it("should not have an error") {
//          expect(responseError).to(beNil())
//        }
//      }
//      
//      describe("when error") {
//        beforeEach {
//          let error = NSError()
//          mockRequester.getResponse = Result(error: error)
//          waitUntil { done in
//            meshblu.devices([:]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should not return a value") {
//          expect(responseJSON).to(beNil())
//        }
//        
//        it("should have an error") {
//          expect(responseError).to(beAKindOf(NSError))
//        }
//      }
//      
//    }
//    
//    describe(".resetToken") {
//      var mockRequester: MockHttpRequester!
//      var responseJSON: JSON!
//      var responseError: NSError!
//      var meshblu: MeshbluHttp!
//      
//      beforeEach {
//        mockRequester = MockHttpRequester()
//        meshblu = MeshbluHttp(requester: mockRequester)
//      }
//      
//      describe("when successful") {
//        beforeEach {
//          mockRequester.postResponse = Result(value: JSON(["token":"blah"]))
//          waitUntil { done in
//            meshblu.resetToken("uuid") { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should return the message") {
//          expect(responseJSON["token"].string) == "blah"
//        }
//        
//        it("should not have an error") {
//          expect(responseError).to(beNil())
//        }
//      }
//      
//      describe("when error") {
//        beforeEach {
//          let error = NSError()
//          mockRequester.postResponse = Result(error: error)
//          waitUntil { done in
//            meshblu.resetToken("uuid") { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should not return a value") {
//          expect(responseJSON).to(beNil())
//        }
//        
//        it("should have an error") {
//          expect(responseError).to(beAKindOf(NSError))
//        }
//      }
//      
//    }
//    
//    describe(".generateToken") {
//      var mockRequester: MockHttpRequester!
//      var responseJSON: JSON!
//      var responseError: NSError!
//      var meshblu: MeshbluHttp!
//      
//      beforeEach {
//        mockRequester = MockHttpRequester()
//        meshblu = MeshbluHttp(requester: mockRequester)
//      }
//      
//      describe("when successful") {
//        beforeEach {
//          mockRequester.postResponse = Result(value: JSON(["token":"blah"]))
//          waitUntil { done in
//            meshblu.generateToken("uuid") { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should return the message") {
//          expect(responseJSON["token"].string) == "blah"
//        }
//        
//        it("should not have an error") {
//          expect(responseError).to(beNil())
//        }
//      }
//      
//      describe("when error") {
//        beforeEach {
//          let error = NSError()
//          mockRequester.postResponse = Result(error: error)
//          waitUntil { done in
//            meshblu.generateToken("uuid") { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should not return a value") {
//          expect(responseJSON).to(beNil())
//        }
//        
//        it("should have an error") {
//          expect(responseError).to(beAKindOf(NSError))
//        }
//      }
//      
//    }
//    
//    describe(".updateDangerously") {
//      var mockRequester: MockHttpRequester!
//      var responseJSON: JSON!
//      var responseError: NSError!
//      var meshblu: MeshbluHttp!
//      
//      beforeEach {
//        mockRequester = MockHttpRequester()
//        meshblu = MeshbluHttp(requester: mockRequester)
//      }
//      
//      describe("when successful") {
//        beforeEach {
//          mockRequester.putResponse = Result(value: JSON(["data":"blah"]))
//          waitUntil { done in
//            meshblu.updateDangerously("uuid", properties: ["$set": ["foo":"bar"]]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should return the data") {
//          expect(responseJSON["data"].string) == "blah"
//        }
//        
//        it("should not have an error") {
//          expect(responseError).to(beNil())
//        }
//      }
//      
//      describe("when error") {
//        beforeEach {
//          let error = NSError()
//          mockRequester.putResponse = Result(error: error)
//          waitUntil { done in
//            meshblu.updateDangerously("uuid", properties: ["$set":["test":"this"]]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should not return a value") {
//          expect(responseJSON).to(beNil())
//        }
//        
//        it("should have an error") {
//          expect(responseError).to(beAKindOf(NSError))
//        }
//      }
//      
//    }
//    
//    describe(".update") {
//      var mockRequester: MockHttpRequester!
//      var responseJSON: JSON!
//      var responseError: NSError!
//      var meshblu: MeshbluHttp!
//      
//      beforeEach {
//        mockRequester = MockHttpRequester()
//        meshblu = MeshbluHttp(requester: mockRequester)
//      }
//      
//      describe("when successful") {
//        beforeEach {
//          mockRequester.patchResponse = Result(value: JSON(["data":"blah"]))
//          waitUntil { done in
//            meshblu.update("uuid", properties: ["foo":"bar"]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should return the data") {
//          expect(responseJSON["data"].string) == "blah"
//        }
//        
//        it("should not have an error") {
//          expect(responseError).to(beNil())
//        }
//      }
//      
//      describe("when error") {
//        beforeEach {
//          let error = NSError()
//          mockRequester.patchResponse = Result(error: error)
//          waitUntil { done in
//            meshblu.update("uuid", properties: ["test":"this"]) { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should not return a value") {
//          expect(responseJSON).to(beNil())
//        }
//        
//        it("should have an error") {
//          expect(responseError).to(beAKindOf(NSError))
//        }
//      }
//      
//    }
//    
//    describe(".deleteDevice") {
//      var mockRequester: MockHttpRequester!
//      var responseJSON: JSON!
//      var responseError: NSError!
//      var meshblu: MeshbluHttp!
//      
//      beforeEach {
//        mockRequester = MockHttpRequester()
//        meshblu = MeshbluHttp(requester: mockRequester)
//      }
//      
//      describe("when successful") {
//        beforeEach {
//          mockRequester.deleteResponse = Result(value: JSON(["data":"blah"]))
//          waitUntil { done in
//            meshblu.deleteDevice("uuid") { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should return the data") {
//          expect(responseJSON["data"].string) == "blah"
//        }
//        
//        it("should not have an error") {
//          expect(responseError).to(beNil())
//        }
//      }
//      
//      describe("when error") {
//        beforeEach {
//          let error = NSError()
//          mockRequester.deleteResponse = Result(error: error)
//          waitUntil { done in
//            meshblu.deleteDevice("uuid") { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should not return a value") {
//          expect(responseJSON).to(beNil())
//        }
//        
//        it("should have an error") {
//          expect(responseError).to(beAKindOf(NSError))
//        }
//      }
//      
//    }
//    
//    describe(".devices") {
//      var mockRequester: MockHttpRequester!
//      var responseJSON: JSON!
//      var responseError: NSError!
//      var meshblu: MeshbluHttp!
//      
//      beforeEach {
//        mockRequester = MockHttpRequester()
//        meshblu = MeshbluHttp(requester: mockRequester)
//      }
//      
//      describe("when successful") {
//        beforeEach {
//          mockRequester.getResponse = Result(value: JSON([["something":"test"]]))
//          waitUntil { done in
//            meshblu.whoami() { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should return a list of devices") {
//          expect(responseJSON[0]["something"].string) == "test"
//        }
//        
//        it("should not have an error") {
//          expect(responseError).to(beNil())
//        }
//      }
//      
//      describe("when error") {
//        beforeEach {
//          let error = NSError()
//          mockRequester.getResponse = Result(error: error)
//          waitUntil { done in
//            meshblu.whoami() { (result) in
//              responseJSON = result.value
//              responseError = result.error
//              done()
//            }
//          }
//        }
//        
//        it("should not return a value") {
//          expect(responseJSON).to(beNil())
//        }
//        
//        it("should have an error") {
//          expect(responseError).to(beAKindOf(NSError))
//        }
//      }
//      
//    }
//    
//  }
//}
