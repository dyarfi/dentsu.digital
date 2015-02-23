<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Log extends Admin_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/log
	 *	- or -  
	 * 		http://example.com/index.php/log/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/log/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	
	public function __construct() {
	    parent::__construct();

	    // Load logs model
	    $this->load->model('ServerLogs');
		
	}
	
	public function index()
	{
	    // Set default statuses
	    $data['statuses'] = $this->configs['status'];

	    // Set data rows
	    $data['rows']	= $this->ServerLogs->getAllServerLog();

	    // Set main template
	    $data['main']	= 'users/log_index';

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
		if (empty($id) || !$this->ServerLogs->getServerLog($id)) {
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
				$this->ServerLogs->updateServerLog($posts);

				// Set message
				$this->session->set_flashdata('message','ServerLog updated');

				// Redirect after add
				redirect(ADMIN. $this->controller . '/index');

			}
		
		} else {	
			
			// Set fields from database
			$fields         = (object) $this->ServerLogs->getServerLog($id);
			
		}
	
		// Set Action
		$data['action']     = 'edit';
				
		// Set Param
		$data['param']      = $id;
		
		// Set error data to view
		$data['errors']     = $errors;

		// Set field data to view
		$data['fields']     = $fields;		
			
		// ServerLog Status Data
		$data['statuses']   = $this->configs['status'];		
		
		// Set form to view
		$data['main']       = 'logs/log_form';			
		
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
				$this->ServerLogs->setServerLog($this->input->post());
				
				// Set message
				$this->session->set_flashdata('message','ServerLog created!');
				
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
				
		// ServerLog Status Data
		$data['statuses']	= @$this->configs['status'];
		
		// Post Fields
		$data['fields']		= (object) $fields;

		// Main template
		$data['main']		= 'logs/log_form';		
	
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

            // Check if ServerLog data ID is found and redirect if false
            $user = $this->ServerLogs->getServerLog($id);
            if (!count($user)){
                    $this->session->set_flashdata('message',"Data not found.");			
                    redirect(ADMIN. $this->controller . '/index');
            }

            // ServerLog account data
            $data['log']			= $this->ServerLogs->getServerLog($id);		

            // Main template
            $data['main']	= 'logs/log_view';

            // Set module with URL request 
            $data['module_title'] = $this->module;

            // Set admin title page with module menu
            $data['page_title'] = $this->module_menu;

            // Load admin template
            $this->load->view('template/admin/admin_template',$this->load->vars($data));
    }
    
    public function delete($id){

            // Delete user data
            $this->ServerLogs->deleteServerLog($id);

            // Set flash message
            $this->session->set_flashdata('message','ServerLog deleted');

            // Redirect after delete
            redirect(ADMIN. $this->controller . '/index');

    }
    
}

/* End of file log.php */
/* Location: ./application/log/controllers/log.php */