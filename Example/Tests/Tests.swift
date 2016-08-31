// https://github.com/Quick/Quick

import Quick
import Nimble
import SwiftyJSON
import OHHTTPStubs
import Result // Needed for dependencies
@testable import MeshbluHttp

class MeshbluHttpSpec: QuickSpec {
  override func spec() {
    var mockRequester: MeshbluHttpRequester!
    var responseJSON: JSON!
    var responseError: NSError!
    var meshblu: MeshbluHttp!

    afterSuite {
      OHHTTPStubs.removeAllStubs()
    }

    beforeEach {
      mockRequester = MeshbluHttpRequester()
      meshblu = MeshbluHttp(requester: mockRequester)
    }
    
    describe(".register") {
      describe("when successful") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let obj = ["uuid":"123"]
            return OHHTTPStubsResponse(JSONObject: obj, statusCode:200, headers:nil)
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

      describe("when error") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.CFURLErrorNotConnectedToInternet.rawValue), userInfo:nil)
            return OHHTTPStubsResponse(error: notConnectedError)
          }
          waitUntil { done in
            meshblu.register([:]) { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should not return a value") {
          expect(responseJSON).to(beNil())
        }

        it("should have an error") {
          expect(responseError).to(beAKindOf(NSError))
        }
      }
    }

    describe(".message") {
      describe("when successful") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let obj = ["topic":"test"]
            return OHHTTPStubsResponse(JSONObject: obj, statusCode:200, headers:nil)
          }
          waitUntil { done in
            meshblu.message(["devices":["*"], "topic":"test"]) { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should return the message") {
          expect(responseJSON["topic"].string) == "test"
        }

        it("should not have an error") {
          expect(responseError).to(beNil())
        }
      }

      describe("when error") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.CFURLErrorNotConnectedToInternet.rawValue), userInfo:nil)
            return OHHTTPStubsResponse(error: notConnectedError)
          }
          waitUntil { done in
            meshblu.message(["devices":["*"], "topic":"test"]) { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should not return a value") {
          expect(responseJSON).to(beNil())
        }

        it("should have an error") {
          expect(responseError).to(beAKindOf(NSError))
        }
      }
    }

    describe(".getPublicKey") {
      describe("when successful") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let obj = ["publicKey":"blah"]
            return OHHTTPStubsResponse(JSONObject: obj, statusCode:200, headers:nil)
          }
          waitUntil { done in
            meshblu.getPublicKey("uuid") { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should return the message") {
          expect(responseJSON["publicKey"].string) == "blah"
        }

        it("should not have an error") {
          expect(responseError).to(beNil())
        }
      }

      describe("when error") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.CFURLErrorNotConnectedToInternet.rawValue), userInfo:nil)
            return OHHTTPStubsResponse(error: notConnectedError)
          }
          waitUntil { done in
            meshblu.getPublicKey("uuid") { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should not return a value") {
          expect(responseJSON).to(beNil())
        }

        it("should have an error") {
          expect(responseError).to(beAKindOf(NSError))
        }
      }

    }

    describe(".devices") {
      describe("when successful") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let obj = [["something":"test"]]
            return OHHTTPStubsResponse(JSONObject: obj, statusCode:200, headers:nil)
          }
          waitUntil { done in
            meshblu.devices([:]) { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should return a list of devices") {
          expect(responseJSON[0]["something"].string) == "test"
        }

        it("should not have an error") {
          expect(responseError).to(beNil())
        }
      }

      describe("when error") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.CFURLErrorNotConnectedToInternet.rawValue), userInfo:nil)
            return OHHTTPStubsResponse(error: notConnectedError)
          }
          waitUntil { done in
            meshblu.devices([:]) { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should not return a value") {
          expect(responseJSON).to(beNil())
        }

        it("should have an error") {
          expect(responseError).to(beAKindOf(NSError))
        }
      }

    }

    describe(".resetToken") {
      describe("when successful") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let obj = ["token":"blah"]
            return OHHTTPStubsResponse(JSONObject: obj, statusCode:200, headers:nil)
          }
          waitUntil { done in
            meshblu.resetToken("uuid") { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should return the message") {
          expect(responseJSON["token"].string) == "blah"
        }

        it("should not have an error") {
          expect(responseError).to(beNil())
        }
      }

      describe("when error") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.CFURLErrorNotConnectedToInternet.rawValue), userInfo:nil)
            return OHHTTPStubsResponse(error: notConnectedError)
          }
          waitUntil { done in
            meshblu.resetToken("uuid") { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should not return a value") {
          expect(responseJSON).to(beNil())
        }

        it("should have an error") {
          expect(responseError).to(beAKindOf(NSError))
        }
      }

    }

    describe(".generateToken") {
      describe("when successful") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let obj = ["token":"blah"]
            return OHHTTPStubsResponse(JSONObject: obj, statusCode:200, headers:nil)
          }
          waitUntil { done in
            meshblu.generateToken("uuid") { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should return the message") {
          expect(responseJSON["token"].string) == "blah"
        }

        it("should not have an error") {
          expect(responseError).to(beNil())
        }
      }

      describe("when error") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.CFURLErrorNotConnectedToInternet.rawValue), userInfo:nil)
            return OHHTTPStubsResponse(error: notConnectedError)
          }
          waitUntil { done in
            meshblu.generateToken("uuid") { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should not return a value") {
          expect(responseJSON).to(beNil())
        }

        it("should have an error") {
          expect(responseError).to(beAKindOf(NSError))
        }
      }

    }

    describe(".updateDangerously") {
      describe("when successful") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let obj = ["data":"blah"]
            return OHHTTPStubsResponse(JSONObject: obj, statusCode:200, headers:nil)
          }
          waitUntil { done in
            meshblu.updateDangerously("uuid", properties: ["$set": ["foo":"bar"]]) { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should return the data") {
          expect(responseJSON["data"].string) == "blah"
        }

        it("should not have an error") {
          expect(responseError).to(beNil())
        }
      }

      describe("when error") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.CFURLErrorNotConnectedToInternet.rawValue), userInfo:nil)
            return OHHTTPStubsResponse(error: notConnectedError)
          }
          waitUntil { done in
            meshblu.updateDangerously("uuid", properties: ["$set":["test":"this"]]) { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should not return a value") {
          expect(responseJSON).to(beNil())
        }

        it("should have an error") {
          expect(responseError).to(beAKindOf(NSError))
        }
      }

    }

    describe(".update") {
      describe("when successful") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let obj = ["data":"blah"]
            return OHHTTPStubsResponse(JSONObject: obj, statusCode:200, headers:nil)
          }
          waitUntil { done in
            meshblu.update("uuid", properties: ["foo":"bar"]) { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should return the data") {
          expect(responseJSON["data"].string) == "blah"
        }

        it("should not have an error") {
          expect(responseError).to(beNil())
        }
      }

      describe("when error") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.CFURLErrorNotConnectedToInternet.rawValue), userInfo:nil)
            return OHHTTPStubsResponse(error: notConnectedError)
          }
          waitUntil { done in
            meshblu.update("uuid", properties: ["test":"this"]) { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should not return a value") {
          expect(responseJSON).to(beNil())
        }

        it("should have an error") {
          expect(responseError).to(beAKindOf(NSError))
        }
      }

    }

    describe(".deleteDevice") {
      describe("when successful") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let obj = ["data":"blah"]
            return OHHTTPStubsResponse(JSONObject: obj, statusCode:200, headers:nil)
          }
          waitUntil { done in
            meshblu.deleteDevice("uuid") { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should return the data") {
          expect(responseJSON["data"].string) == "blah"
        }

        it("should not have an error") {
          expect(responseError).to(beNil())
        }
      }

      describe("when error") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.CFURLErrorNotConnectedToInternet.rawValue), userInfo:nil)
            return OHHTTPStubsResponse(error: notConnectedError)
          }
          waitUntil { done in
            meshblu.deleteDevice("uuid") { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should not return a value") {
          expect(responseJSON).to(beNil())
        }

        it("should have an error") {
          expect(responseError).to(beAKindOf(NSError))
        }
      }

    }

    describe(".whoami") {
      describe("when successful") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let obj = [["something":"test"]]
            return OHHTTPStubsResponse(JSONObject: obj, statusCode:200, headers:nil)
          }
          waitUntil { done in
            meshblu.whoami() { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should return a list of devices") {
          expect(responseJSON[0]["something"].string) == "test"
        }

        it("should not have an error") {
          expect(responseError).to(beNil())
        }
      }

      describe("when error") {
        beforeEach {
          stub(isHost("meshblu-http.octoblu.com")) { _ in
            let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.CFURLErrorNotConnectedToInternet.rawValue), userInfo:nil)
            return OHHTTPStubsResponse(error: notConnectedError)
          }
          waitUntil { done in
            meshblu.whoami() { (result) in
              responseJSON = result.value
              responseError = result.error
              done()
            }
          }
        }

        it("should not return a value") {
          expect(responseJSON).to(beNil())
        }

        it("should have an error") {
          expect(responseError).to(beAKindOf(NSError))
        }
      }

    }

  }
}
