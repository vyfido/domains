import ballerina/config;
import ballerina/http;
import ballerina/log;

@http:ServiceConfig {
   basePath:"/domain"
}
service hello on  new http:Listener(config:getAsInt("app.port", 9095)) {

  @http:ResourceConfig {
    methods:["GET"],
    path:"/"
  }
  resource function initial(http:Caller caller, http:Request req) {
    http:Response res = new;
    res.setPayload("Domains backend - services");
    res.setHeader("Content-Type","text/plain;charset=UTF-8;");
    var respondResult = caller->respond(res);
    if (respondResult is error) {
      log:printError("Error sending response", err = respondResult);
    }  
  }

  /// example json input: {"id": 2}
  @http:ResourceConfig {
    methods:["POST"],
    path:"/create"
  }
  resource function create(http:Caller caller, http:Request req) {
    http:Response res = new;
    res.setHeader("Content-Type","text/plain;charset=UTF-8;");
    var input = req.getJsonPayload();
    if(input is json){
      string message = "el valor es ".concat(" ", input.id.toString());
      res.setPayload(<@untainted>message);
      var respondResult = caller->respond(res);
      if (respondResult is error) {
        log:printError("Error sending response", err = respondResult);
      }  
    }else{
      res.statusCode = 400;
      res.setPayload("Invalid request.");
      var respondResult = caller->respond(res);
      if (respondResult is error) {
        log:printError("Error sending response", err = respondResult);
      } 
    }

  }

  /// example json input: {"id": 1}
  @http:ResourceConfig {
    methods:["PUT"],
    path:"/update"
  }
  resource function update(http:Caller caller, http:Request req) {
    http:Response res = new;
    res.setHeader("Content-Type","text/plain;charset=UTF-8;");
    var input = req.getJsonPayload();
    if(input is json){
      string message = "el valor es ".concat(" ", input.id.toString());
      res.setPayload(<@untainted>message);
      var respondResult = caller->respond(res);
      if (respondResult is error) {
        log:printError("Error sending response", err = respondResult);
      }  
    }else{
      res.statusCode = 400;
      res.setPayload("Invalid request.");
      var respondResult = caller->respond(res);
      if (respondResult is error) {
        log:printError("Error sending response", err = respondResult);
      } 
    }

  }

  /// example json input: {"id": 1}
  @http:ResourceConfig {
    methods:["PUT"],
    path:"/delete"
  }
  resource function delete(http:Caller caller, http:Request req) {
    http:Response res = new;
    res.setHeader("Content-Type","text/plain;charset=UTF-8;");
    var input = req.getJsonPayload();
    if(input is json){
      string message = "el valor es ".concat(" ", input.id.toString());
      res.setPayload(<@untainted>message);
      var respondResult = caller->respond(res);
      if (respondResult is error) {
        log:printError("Error sending response", err = respondResult);
      }  
    }else{
      res.statusCode = 400;
      res.setPayload("Invalid request.");
      var respondResult = caller->respond(res);
      if (respondResult is error) {
        log:printError("Error sending response", err = respondResult);
      } 
    }

  }


}