<!DOCTYPE html>
<html>
	<head>
		<title>nRelay Client Demo</title>
		<script defer src="vendor/socket.io-client/socket.io.js"></script>
		<script defer src="vendor/jquery/dist/jquery.min.js"></script>
		<script defer src="assets/nRelay.js"></script>
		<script>

			// Don't use jQuery for simple element selection if we can !
		  function domId(eltId) { return document.getElementById(eltId); }

		 	// Server Push function
		 	function doPush() {
		 		var url = "push.php?MSG="+encodeURIComponent(domId('clientText').value);
		 		$.get(url, function(r){
		 			if (!r.result) { 
		 				console.log('error'); 
		 			}
		 			domId('clientText').value = "";
		 			domId('clientText').focus();
		 		},'json');
		 	}

			// This is what to do when ServerPush is received:
		  function myPush(msg) {
		  	console.log("MyPush:"+msg);
		  	domId("log").innerHTML = "<b>SERVER PUSH ("+msg.uid+") :</b> Action:"+msg.action+", Data:"+msg.data+"<br />"+domId("log").innerHTML;
		  }

		  // This is what to do when ClientSync is received:
		  function mySync(msg) {
		  	domId("log").innerHTML = "<b>CLIENT SYNC ("+msg.uid+") :</b> Action:"+msg.action+", Data:"+msg.data+"<br />"+domId("log").innerHTML;
		  }
		
		  // Client Sync function
		 	function doSync() {
		 		nRelayDemo.sync("userSync", domId('clientText').value);
		 		domId('clientText').value = "";
		 		domId('clientText').focus();
		 	}

		 	$(document).ready(function() {
		 		// These lines ignite the realtime communication.
			 	var nRelayDemo = new nRelay("{$NLRY_HOST}","{$USER_HASH}");
			 	nRelayDemo.debug = true;
			 	nRelayDemo..start(myPush, mySync);
		 	});

		</script>
	</head>
	<body>
		<h1>nRelay demo</h1>
		<input type="text" id="clientText" /> 
		<button type="button" onclick="doPush()">Push Test</button>
		<button type="button" onclick="doSync()">Sync Test</button>
		<hr />
		<div id="log" style="font-family:monospace; font-size:1.2em;"></div>
	</body>
</html>