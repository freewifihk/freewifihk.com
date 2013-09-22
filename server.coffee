express = require 'express'
http = require 'http'
path = require 'path'

app = express()
port = process.env.PORT or 3000

playstore = 'https://play.google.com/store/apps/details?id=com.onarray.freewifihk'

# Middleware
app.set 'port', port
app.use express.compress()
app.use express.logger 'short'

# Routes
app.get '*', (req, res) ->
  res.redirect 302, playstore

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get('port')}"
