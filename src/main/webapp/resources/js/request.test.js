const rewire = require("rewire")
const request = rewire("./request")
const getXMLHttpRequest = request.__get__("getXMLHttpRequest")
// @ponicode
describe("getXMLHttpRequest", () => {
    test("0", () => {
        let callFunction = () => {
            getXMLHttpRequest()
        }
    
        expect(callFunction).not.toThrow()
    })
})
