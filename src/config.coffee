
prodUrl = "mongodb://nodejitsu_nko3-jujube-souffl:t0h8drjcbs3p0qi6839ko3qccd@ds039257.mongolab.com:39257/nodejitsu_nko3-jujube-souffl_nodejitsudb2886501832"
devUrl = "mongodb://localhost/tweetdvr"

dbUrl = if process.env.NODE_ENV == "production" then prodUrl else devUrl

module.exports =
    dbServer: dbUrl
    twitter:
        consumerKey: "dNZoUXAururMB7mkPQkbfA"
        consumerSecret: "zLYa9YRukIHh5Lj2thM2PMau65HaGM1VPji68piKZZo"