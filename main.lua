math.randomseed( os.time() )
local json = require ("json")
local habiticaID = "<yourID>"
local habiticaAPIkey = "<yourKey>"

function getResponse( event )
    if ( event.isError ) then
        --Hostname not found?
        print("Error?")
    else
        print("Response"..json.prettify(event.response))
    end
end

function CreateANewTodo(url, action, callback)
    local headers = {}

    headers["Content-Type"] = "application/json"
    headers[ "x-api-user"] = habiticaID
    headers[ "x-api-key"] = habiticaAPIkey

    local params = {}
    local body = {}
    body["text"]= "My single task!!" -- <-- The task name
    body["type"]= "daily" -- Allowed values: "habit", "daily", "todo", "reward"
    body["notes"]="Going to bust some dope tasks!" -- <-- A little subtitle, this can be anything, optional
    body["priority"]= 0.1 -- Allowed values: "0.1", "1", "1.5", "2"
    params.headers = headers
    params.body = json.encode(body)
    network.request ( url, action, callback, params )
end

CreateANewTodo("https://habitica.com/api/v3/tasks/user", "POST", getResponse)
