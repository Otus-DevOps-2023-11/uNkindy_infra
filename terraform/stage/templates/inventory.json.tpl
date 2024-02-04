{
    "_meta": {
        "hostvars": {}
    },
	"db":{
		"hosts":["${app}"]
	},
	"app":{
		"hosts":["${db}"]
	}
}
