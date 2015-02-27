<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class ACL {
		
	private $CI;
	public $user = '';
	
	public function __construct () {

	    $this->user		= $this->CI->session->userdata('user_session');
		
	}
	
	/**
	* Load the current users data
	*
	* @access	public
	* @param	NULL (session)
	* @return	array object
	*/		
	public function user() {
								
		return $this->user;
		
	}

	/**
	* Load the current users available module list
	*
	* @access	public
	* @param	NULL (session)
	* @return	array
	*/	
	public function admin_system_modules () {
				
		if ($this->user === FALSE) {
			return array();
		}	

		// ------- If User is Login set available data --- start
		if ($this->user != '') {
			//$this->userhistory		= Model_UserHistory::instance();
			$this->module_list		= json_decode($this->CI->session->userdata('module_list'),TRUE);
			$this->module_function_list	= json_decode($this->CI->session->userdata('module_function_list'),TRUE);
		}
		
		$modules				= array();

		// Check admin url
		if (strstr($this->CI->uri->uri_string, ADMIN) !== '') {	
			// Get module listings
			$modules	= $this->module_list;			
		}
		
		return $modules;		
	}
	
	
	public function isAuthorized() {

	}
	
}

