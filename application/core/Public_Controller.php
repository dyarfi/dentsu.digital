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
		self::setAccessLog(1);
		
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
		
		// Set user agents and platform
		$user_agents['user_agent']	= $this->agent->agent;
		$user_agents['platform']	= $this->agent->platform;
		$user_agents['browser']		= $this->agent->browser;
		
		// Load status code from config
		$status_code				= $this->load->config('http_code',true);
		
		if ($public) {
			// Set ServerLog data
			$object = array(
				'session_id'	=> $this->session->userdata('session_id'),
				'url'			=> base_url(uri_string()),
				'user_id'		=> @$object['user_id'],	
				'status_code'	=> $status_code[http_response_code()],	
				'bytes_served'	=> @$object['bytes_served'],	
				'total_time'	=> $this->benchmark->marker['total_execution_time_start'],	
				'ip_address'	=> $this->input->ip_address,	
				'http_code'		=> http_response_code(),	
				'referrer'		=> $this->agent->is_referral() ? $this->agent->referrer() : '',			
				'user_agent'	=> json_encode($user_agents),
				'is_mobile'		=> $this->agent->is_mobile,
				'status'		=> 1,
				'added'			=> time()
			);
		}
		//echo '<pre>';
		//print_r($object);
		//echo '</pre>';
		// Get value from tbl_configurations for maintenance
		if ($this->ServerLogs->setServerLog($object)) { }
	}
	
}