<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
* HybridAuth
* http://hybridauth.sourceforge.net | http://github.com/hybridauth/hybridauth
* (c) 2009-2015, HybridAuth authors | http://hybridauth.sourceforge.net/licenses.html
*/

// ----------------------------------------------------------------------------------------
//	HybridAuth Config file: http://hybridauth.sourceforge.net/userguide/Configuration.html
// ----------------------------------------------------------------------------------------

$config =
	array(
		// set on "base_url" the relative url that point to HybridAuth Endpoint
		'base_url' => '/hauth/endpoint',

		"providers" => array (
			// openid providers
			"OpenID" => array (
				"enabled" => true
			),

			"Yahoo" => array (
				"enabled" => true,
                "keys"    => array ( "key" => "dj0yJmk9YUhEaGhqaUhYRTltJmQ9WVdrOWF6VTVZM1pFTXpZbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1mNw--", "secret" => "9b00bd2e50ee2797d881c9b6d0f33a858328d2a6" ),
            ),

			"AOL"  => array (
				"enabled" => true
			),

			"Google" => array (
				"enabled" => true,
				"keys"    => array ( "id" => "135018674898-re8sd5nigbbuh30p19k8ca3nfv8qbsuk.apps.googleusercontent.com", "secret" => "iNxgUKBfzDtxYxNy0tAXg95U" ),
			),

			"Facebook" => array (
				"enabled" => true,
				"keys"    => array ( "id" => "114541098876849", "secret" => "44326818a1e5fd1013d3b4495e8fb7b3" ),
			),

			"Twitter" => array (
				"enabled" => true,
				"keys"    => array ( "key" => "dqu99PRCefOCpNPobQEvtBJpS", "secret" => "EXOPAceSDF7GNzaLXunByOClXLu0sGVxxAgxbyesLLSfYLcDLv" )
			),

			// windows live
			"Live" => array (
				"enabled" => true,
				"keys"    => array ( "id" => "", "secret" => "" )
			),

			"MySpace" => array (
				"enabled" => true,
				"keys"    => array ( "key" => "", "secret" => "" )
			),

			"LinkedIn" => array (
				"enabled" => true,
				"keys"    => array ( "key" => "75blw6tuiaom3x", "secret" => "rJMdMWsbpe2ixl9d" )
			),

			"Foursquare" => array (
				"enabled" => true,
				"keys"    => array ( "id" => "", "secret" => "" )
			),
		),

		// if you want to enable logging, set 'debug_mode' to true  then provide a writable file by the web server on "debug_file"
		"debug_mode" => (ENVIRONMENT == 'development'),

		"debug_file" => APPPATH.'/logs/hybridauth.log',
	);


/* End of file hybridauthlib.php */
/* Location: ./application/config/hybridauthlib.php */