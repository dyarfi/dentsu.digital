<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Career extends Admin_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	
	public function __construct() {
		parent::__construct();
		
		// Load Careers model
		$this->load->model('Careers');
		
		// Load CareerDivision model
		$this->load->model('CareerDivisions');

	}
	
	public function index()
	{
		// Set default statuses
		$data['statuses'] = $this->configs['status'];
				 
		// Set data rows
		$data['rows']		= $this->Careers->getAllCareer();
						
		// Set main template
		$data['main']		= 'career_index';
		
		// Set module with URL request 
		$data['module_title'] = $this->module;
		
		// Set admin title page with module menu
		$data['page_title'] = $this->module_menu;
						
		// Set default statuses
		$data['statuses'] = $this->configs['status'];
									
		// Set default system
		$data['is_system'] = $this->configs['is_system'];
		
		// Set this controller
		$data['controller'] = $this->controller;
		
		// Load admin template
		$this->load->view('template/admin/admin_template', $this->load->vars($data));
	}
	
	public function add () {
	
		// Default data setup
		$fields	= array(
				'subject'		=> '',
				'sent_to'		=> '',
				'ref_no'		=> '',
				'start_date'	=> '',
				'end_date'		=> '',	
				'requirements'	=> '',
				'job_purpose'	=> '',
				'location'		=> '',
				'division_id'	=> '',
				'status'		=> '');
		
		$errors	= $fields;
		
		$this->form_validation->set_rules('subject', 'Subject', 'trim|required|min_length[5]|max_length[24]|xss_clean');
		$this->form_validation->set_rules('sent_to', 'Sent To','trim|valid_email|required|min_length[5]|max_length[24]|xss_clean');
		$this->form_validation->set_rules('ref_no', 'Ref No','trim|required');
		$this->form_validation->set_rules('start_date', 'Start Date','trim|required');
		$this->form_validation->set_rules('end_date', 'End Date','trim|required');
		$this->form_validation->set_rules('requirements', 'Requirements','required');
		$this->form_validation->set_rules('job_purpose', 'Job Purpose','required');
		$this->form_validation->set_rules('location', 'Location','trim|required');
		$this->form_validation->set_rules('division_id', 'Division','trim|required|callback_match_division');
		$this->form_validation->set_rules('status', 'Status','required');
		
		
		// Check if post is requested
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			
			// Validation form checks
			if ($this->form_validation->run() == FALSE)
			{
				// Set error fields
				$error = array();
				foreach(array_keys($fields) as $error) {
					$errors[$error] = form_error($error);
				}

				// Set previous post merge to default
				$fields = array_merge($fields, $this->input->post());
			}
			else
			{

				print_r($this->input->post());
				exit;
				// Set data to add to database
				//$this->Users->setUser($this->input->post());
				
				// Set message
				$this->session->set_flashdata('message','User created!');
				
				// Redirect after add
				redirect('admin/user');
				
			}
			
		}	
				
		// Set Action
		$data['action'] = 'add';
				
		// Set Param
		$data['param']	= '';
		
		// Set error data to view
		$data['errors'] = $errors;

		// Post Fields
		$data['fields']	= (object) $fields;	
		
		// Set default statuses
		$data['statuses']	= $this->configs['status'];
	
		// User Gender Data
		$data['genders']	= @$this->configs['gender'];
		
		// Set main template
		$data['main']		= 'career_form';
		
		// Set module with URL request 
		$data['module_title'] = $this->module;
		
		// Set admin title page with module menu
		$data['page_title'] = $this->module_menu;
						
		// Set default statuses
		$data['statuses'] = $this->configs['status'];
									
		// Set default system
		$data['is_system'] = $this->configs['is_system'];
		
		// Set this controller
		$data['controller'] = $this->controller;
		
		// Get Division data
		$data['divisions'] = $this->CareerDivisions->getAllCareerDivision();
		
		// Load admin template
		$this->load->view('template/admin/admin_template', $this->load->vars($data));
		
	}
	
	// -------------- CALLBACK METHODS -------------- //

	// Match Division post to Database
	public function match_division($division) {		
		
		// Check email if empty
		if ($email == '') {
			$this->form_validation->set_message('match_division', 'The %s can not be empty.');
			return false;
		}
		// Check division if match
		else if ($this->Users->getUserEmail($email) == 1) {
			$this->form_validation->set_message('match_division', 'The %s is already taken.');			
			return false;
		// Match current division
		} else {
			return true;
		} 
		
	}
}

/* End of file career.php */
/* Location: ./application/module/career/controllers/career.php */