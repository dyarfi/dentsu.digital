<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Log extends Admin_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/setting
	 *	- or -  
	 * 		http://example.com/index.php/setting/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/setting/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	
	public function __construct() {
		parent::__construct();
		
		// Load settings model
		$this->load->model('ServerLogs');

	}
	
	public function index()
	{
		// Set default statuses
		$data['statuses'] = $this->configs['status'];
		
		// Set data rows
		$data['rows']	= $this->ServerLogs->getAllLog();
				
		// Set main template
		$data['main']		= 'settings/setting_index';
		
		// Set module with URL request 
		$data['module_title'] = $this->module;
		
		// Set admin title page with module menu
		$data['page_title'] = $this->module_menu;
						
		// Set default statuses
		$data['statuses'] = $this->configs['status'];
									
		// Set default system
		$data['is_system'] = $this->configs['is_system'];
		
		// Load admin template
		$this->load->view('template/admin/admin_template', $this->load->vars($data));
	}
        
        public function edit($id=0){
				
		// Check if param is given or not and check from database
		if (empty($id) || !$this->Settings->getSetting($id)) {
			$this->session->set_flashdata('message','Item not found!');
			// Redirect to index
			redirect(ADMIN. $this->controller . '/index');
		}	
		
		// Default data setup
		$fields	= array(
				'parameter'	=> '',
				'alias'		=> '',
				'value'		=> '',	
				'status'	=> '');
		
		$errors	= $fields;
		
                $this->form_validation->set_rules('parameter', 'Parameter', 'trim|required|xss_clean');
		$this->form_validation->set_rules('alias', 'Alias','trim|required|xss_clean');
		$this->form_validation->set_rules('value', 'Value','trim|required');				
		$this->form_validation->set_rules('status', 'Status','required');
                
		// Check if post is requested		
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			
			// Validation form checks
			if ($this->form_validation->run() == FALSE) {

				// Set error fields
				$error = array();
				foreach(array_keys($fields) as $error) {
					$errors[$error] = form_error($error);
				}

				// Set previous post merge to default
				$fields = array_merge($fields, $this->input->post());						

			} else {

				$posts = array(
                                    'id'        => $id,
                                    'parameter'	=> $this->input->post('parameter'),
                                    'alias'     => $this->input->post('alias'),
                                    'value'	=> $this->input->post('value'),		
                                    'status'	=> $this->input->post('status')
				);
				
				// Set data to add to database
				$this->Settings->updateSetting($posts);

				// Set message
				$this->session->set_flashdata('message','Setting updated');

				// Redirect after add
				redirect(ADMIN. $this->controller . '/index');

			}
		
		} else {	
			
			// Set fields from database
			$fields         = (object) $this->Settings->getSetting($id);
			
		}
	
		// Set Action
		$data['action']     = 'edit';
				
		// Set Param
		$data['param']      = $id;
		
		// Set error data to view
		$data['errors']     = $errors;

		// Set field data to view
		$data['fields']     = $fields;		
			
		// Setting Status Data
		$data['statuses']   = $this->configs['status'];		
		
		// Set form to view
		$data['main']       = 'settings/setting_form';			
		
		// Set module with URL request 
		$data['module_title'] = $this->module;
		
		// Set admin title page with module menu
		$data['page_title'] = $this->module_menu;
		
		// Set admin template
		$this->load->view('template/admin/admin_template', $this->load->vars($data));
		
	}
        
        public function add() {
		
		//Default data setup
		$fields	= array(
				'parameter'	=> '',
				'alias'		=> '',
				'value'		=> '',	
				'status'	=> '');
		
		$errors	= $fields;
		
		$this->form_validation->set_rules('parameter', 'Parameter', 'trim|required|xss_clean');
		$this->form_validation->set_rules('alias', 'Alias','trim|required|xss_clean');
		$this->form_validation->set_rules('value', 'Value','trim|required');				
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

				// Set data to add to database
				$this->Settings->setSetting($this->input->post());
				
				// Set message
				$this->session->set_flashdata('message','Setting created!');
				
				// Redirect after add
				redirect(ADMIN. $this->controller . '/index');
				
			}
			
		}	
			
		// Set Action
		$data['action'] = 'add';
				
		// Set Param
		$data['param']	= '';
				
		// Set error data to view
		$data['errors'] = $errors;
				
		// Setting Status Data
		$data['statuses']	= @$this->configs['status'];
		
		// Post Fields
		$data['fields']		= (object) $fields;

		// Main template
		$data['main']		= 'settings/setting_form';		
	
		// Set module with URL request 
		$data['module_title'] = $this->module;
		
		// Set admin title page with module menu
		$data['page_title'] = $this->module_menu;
		
		// Admin view template
		$this->load->view('template/admin/admin_template', $this->load->vars($data));
				
	}
        
        public function view($id=null){

            // Load form validation library if not auto loaded
            $this->load->library('form_validation');

            // Check if data is found and redirect if false
            if (empty($id) && (int) count($id) == 0) {
                    $this->session->set_flashdata('message',"Error submission.");
                    redirect(ADMIN. $this->controller . '/index');
            }

            // Check if Setting data ID is found and redirect if false
            $user = $this->Settings->getSetting($id);
            if (!count($user)){
                    $this->session->set_flashdata('message',"Data not found.");			
                    redirect(ADMIN. $this->controller . '/index');
            }

            // Setting account data
            $data['setting']			= $this->Settings->getSetting($id);		

            // Main template
            $data['main']	= 'settings/setting_view';

            // Set module with URL request 
            $data['module_title'] = $this->module;

            // Set admin title page with module menu
            $data['page_title'] = $this->module_menu;

            // Load admin template
            $this->load->view('template/admin/admin_template',$this->load->vars($data));
    }
    
    public function delete($id){

            // Delete user data
            $this->Settings->deleteSetting($id);

            // Set flash message
            $this->session->set_flashdata('message','Setting deleted');

            // Redirect after delete
            redirect(ADMIN. $this->controller . '/index');

    }
    
}

/* End of file setting.php */
/* Location: ./application/setting/controllers/setting.php */