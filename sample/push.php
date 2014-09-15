<?php
/**
 * nRelay Server - Server Broadcast Demo
 */
session_start();
require __DIR__."/../vendor/autoload.php";
include __DIR__."/config.inc.php";

// Bad call
if (!isset($_GET['MSG']) || trim($_GET['MSG']) == "") {
  die("{result:false, error:'Message Could not be empty !'}");
}

try {
  // Connect to the nRelay Server
  $s = new nRelay(NRLY_HOST, NRLY_SECRET);

  // Push the message to the "demo" channel with the action "say"
  $s->push($session_id(), "demo", "say", $msg);

  // Clean the object
  unset($s);
}
catch(Exception $e) {
	die("{result:false, error:'Socket Connexion error:<br /><b>".$e->getMessage()."</b>'}");
}

// Everything is good
echo "{result:true}";