upnode = require 'upnode'
{encode, decode} = require 'coden'

exports.connect = (host) ->
    upnode.connect {port: 29876, host}, (remote, conn) ->
        remote.auth (encode_str, cb) ->
            decode encode_str, (err, decode_str) ->
                orginal = decode_str.toString()
                encode orginal, (err, result) ->
                    cb result, (api) ->
                        conn.emit 'up', api