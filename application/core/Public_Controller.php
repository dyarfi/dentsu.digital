<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

class Public_Controller extends MY_Controller {
	
    function __construct() {
		
        parent::__construct();
        
		// Load site models
		$this->load->model('admin/Configurations');
		$this->load->model('admin/ServerLogs');
		
		// Set site status default
		self::getSiteStatus();
		
		// Set site user access logs
		self::setAccessLog();
		
		if($this->config->item('site_open') === FALSE)
        {
            show_error('Sorry the site is shut for now.');
        }

        // If the user is using a mobile, use a mobile theme
        $this->load->library('user_agent');
	
        if( $this->agent->is_mobile() )
        {
            /*
             * Use my template library to set a theme for your staff
             *     http://philsturgeon.co.uk/code/codeigniter-template
             */
            $this->template->set_theme('mobile');
        }
    }
	
	protected function getSiteStatus() {
		
		// Get value from tbl_configurations for maintenance
		if ($this->Configurations->getConfiguration_ByParam('maintenance')) {
			
			// Set config value for default
			$this->config->set_item('site_open', FALSE);
			
		}
		
	}
	
	protected function setAccessLog($public='') {
		// url 	user_id 	status_code 	bytes_served 	ip_address 	http_code 	referrer 	user_agent 	status 	added 	modified 
		
		// Set ServerLog data
		$object = array(
			'session_id'	=> $object['session_id'],
			'url'			=> $object['url'],	
			'user_id'		=> @$object['user_id'],	
			'status_code'	=> $object['status_code'],	
			'bytes_served'	=> $object['bytes_served'],	
			'ip_address'	=> $object['ip_address'],	
			'http_code'	=> $object['http_code'],	
			'referrer'	=> @$object['referrer'],			
			'user_agent'	=> @$object['user_agent'],
			'status'		=> $object['status'],
			'added'			=> time()
		);
		
		// Get value from tbl_configurations for maintenance
		//if ($this->ServerLogs->setServerLog($object)) { }
	}
	
}