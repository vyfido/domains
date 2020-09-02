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


}