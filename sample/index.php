<?php
/**
 * nRelay demo - Server Side
 */
session_start();
require __DIR__."/../vendor/autoload.php";

// Configuration of the nRelay server
include __DIR__."/config.inc.php";

try {
  // Start new nRelay instance
  $s = new nRelay(NRLY_HOST, NRLY_PASS);

  // Get a userAccess on the channel 'demo' to pass to the views 
  $userAccessHash = $s->allow(session_id(), "demo");

  // Clean the object
  unset($s);
}
catch(Exception $e) {
	die("nRelay Error: nRelay Bridge seems to be offline.");
}

// Assign Template values
$assignAry['{$NLRY_HOST}'] = NRLY_HOST;
$assignAry['{$USER_HASH}'] = $userAccessHash;

// Here is maybe the world's smallest template engine !
$html = file_get_contents(__DIR__."/assets/index.tpl");
foreach($assignAry as $key=>$value) { 
  $html = str_replace($key, $value, $html); 
}

// Send HTML to browser.
echo $html;