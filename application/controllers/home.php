<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class home extends CI_Controller {

	public function __construct() {
		parent::__construct();
		
		// Load User related model in admin module
		$this->load->model('admin/Users');
		$this->load->model('admin/UserProfiles');
		
		// Load Setting data
		$this->load->model('setting/Settings');
		
		// Load Setting data
		$this->load->model('career/Careers');

	}
	
	public function index() {
		
					
		// Set site title page with module menu
		$data['page_title'] = $this->config->item('developer_name') .' | '. $this->Settings->getByParameter('title_default')->value;
		
		// Set facebook link data
		$data['vacancies']	= $this->Careers->getAllCareer();
				
		// Set facebook link data
		$data['facebook']	= $this->Settings->getByParameter('socmed_facebook');
				
		// Set twitter link data
		$data['twitter']	= $this->Settings->getByParameter('socmed_twitter');
		
		// Set google link data
		$data['google']		= $this->Settings->getByParameter('socmed_gplus');
		
		// Set contact email info data
		$data['email_info']	= $this->Settings->getByParameter('email_info');		
		
		// Set contactus address info data
		$data['contactus_address']	= $this->Settings->getByParameter('contactus_address');		
		
		// Set main template
		$data['main'] = 'home';
		
		// Load admin template
		$this->load->view('template/public/site_template', $this->load->vars($data));
		
	}
}

/* End of file user.php */
/* Location: ./application/controllers/user.php */