import ballerina/http;

# A Ballerina service representing a network-accessible API
# bound to port `9090`.


configurable string greeting = "Halo";
configurable int count = 10;
configurable boolean isAdmin = true;

service / on new http:Listener(9091) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return greeting + ", " + name + count.toString() + isAdmin.toString();
    }
}
