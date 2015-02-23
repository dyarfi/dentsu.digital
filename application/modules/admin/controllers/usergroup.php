<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

// Class for User Groups
class UserGroup extends Admin_Controller {
	var $auth_message = '';
	
	public function __construct() {
	    parent::__construct();

	    //Load user related model
	    $this->load->model('Users');
	    $this->load->model('UserProfiles');
	    $this->load->model('UserGroups');		

	}
	
	public function index() {		
		
	    $rows = $this->UserGroups->getAllUserGroup();

	    if (@$rows) $data['rows'] = $rows;

	    $data['user_profiles'] = $this->UserProfiles->getUserProfile(ACL::user()->id);
	    
	    $data['statuses']	= array('Active'=>'active','Inactive'=>'inactive');

	    // Main template
	    $data['main'] = 'users/usergroups_index';

	    // Set module with URL request 
	    $data['module_title'] = $this->module;

	    // Set admin title page with module menu
	    $data['page_title'] = $this->module_menu;

	    // Load admin template
	    $this->load->view('template/admin/admin_template', $this->load->vars($data));
				
	}
	
	public function add(){
		
	    //Default data setup
	    $fields = array(
			    'name'=>'',
			    'backend_access'=>'',
			    'full_backend_access'=>'',
			    'status'=>'');

	    $errors = $fields;

	    // Set form validation rules
	    $this->form_validation->set_rules('name', 'Name', 'trim|required|xss_clean');
	    $this->form_validation->set_rules('status', 'Status','trim|required|xss_clean');

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

		    // Set data to add to database
		    $this->UserGroups->setUserGroup($this->input->post());

		    // Set message
		    $this->session->set_flashdata('message','User Group created!');

		    // Redirect after add
		    redirect('admin/usergroup');

		}
	    }	

	    // Set Action
	    $data['action'] = 'add';

	    // Set Param
	    $data['param']	= '';

	    // Set error data to view
	    $data['errors'] = $errors;

	    // Set field data to view
	    $data['fields'] = $fields;

	    // Group Status Data
	    $data['statuses']	= array('Active'=>1,'Inactive'=>0);	

	    // Post Fields
	    $data['fields']		= (object) $fields;

	    // Main template
	    $data['main']		= 'users/usergroups_form';		

	    // Set module with URL request 
	    $data['module_title'] = $this->module;

	    // Set admin title page with module menu
	    $data['page_title'] = $this->module_menu;

	    // Admin view template
	    $this->load->view('template/admin/admin_template', $this->load->vars($data));
		
	}
	
	public function edit($id=0){
		
	    // Check if param is given or not and check from database
	    if (empty($id) || !$this->UserGroups->getUserGroup($id)) {
		    $this->session->set_flashdata('message','Item not found!');
		    // Redirect to index
		    redirect(base_url().'admin/usergroup');
	    }				

	    // Default data setup
	    $fields = array(
			    'name' => '',
			    'backend_access' => '',
			    'full_backend_access' => '',
			    'status' => '');

	    $errors = $fields;

	    // Set form validation rules
	    $this->form_validation->set_rules('name', 'Name', 'trim|required|xss_clean');
	    $this->form_validation->set_rules('status', 'Status','trim|required|xss_clean');

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
				    'id'=>$id,
				    'name' => $this->input->post('name'),
				    'backend_access' => $this->input->post('backend_access'),
				    'full_backend_access' => $this->input->post('full_backend_access'),
				    'status' => $this->input->post('status')
			    );

			    // Set data to add to database
			    $this->UserGroups->updateUserGroup($posts);

			    // Set message
			    $this->session->set_flashdata('message','User Group updated');

			    // Redirect after add
			    redirect('admin/usergroup');

		    }

	    } else {	

		    // Set fields from database
		    $fields = $this->UserGroups->getUserGroup($id);		
	    }

	    // Set Action
	    $data['action'] = 'edit';

	    // Set Param
	    $data['param']	= $id;

	    // Set error data to view
	    $data['errors'] = $errors;

	    // Set field data to view
	    $data['fields'] = $fields;		

	    // Set user group status
	    $data['statuses'] = array('Active'=>1,'Inactive'=>0);							

	    // Set form to view
	    $data['main'] = 'users/usergroups_form';			

	    // Set module with URL request 
	    $data['module_title'] = $this->module;

	    // Set admin title page with module menu
	    $data['page_title'] = $this->module_menu;

	    // Set admin template
	    $this->load->view('template/admin/admin_template', $this->load->vars($data));

	}
	public function delete($id){
	    // Set delete method in model
	    $this->UserGroups->deleteUserGroup($id);
	    // Set flash message to display
	    $this->session->set_flashdata('message','User Group deleted');
	    // Redirect to index
	    redirect('admin/usergroup');
	}	
	public function view($id=null){
		
	    //Load form validation library if not auto loaded
	    $this->load->library('form_validation');

	    if (empty($id) && (int) $id == 0) {
		    $this->session->set_flashdata('message',"Error submission.");
		    redirect("users","refresh");
	    }

	    $user = $this->Users->getUser($id);
	    if (!count($user)){
		    redirect(ADMIN.'dashboard/index');
	    }

	    $data['upload_path']	= $this->config->item('upload_path');

	    $data['upload_url']		= $this->config->item('upload_url');

	    $data['user']			= $this->Users->getUser($id);

	    $data['user_profile']	= $this->UserProfiles->getUserProfile($id);

	    // Main template
	    $data['main']	= 'users/users_view';

	    // Set module with URL request 
	    $data['module_title'] = $this->module;

	    // Set admin title page with module menu
	    $data['page_title'] = $this->module_menu;

	    $this->load->view('template/admin/admin_template', $this->load->vars($data));
	}
	
	public function ajax($action='') {
				
	    //Check if the request via AJAX
	    if (!$this->input->is_ajax_request()) {
		    exit('No direct script access allowed');		
	    }	

	    //Define initialize result
	    $result['result'] = '';

	    //Update user profile via Ajax
	    if ($action == 'update' && $this->input->post() !== '') {

		    //Set User Data
		    $user_profile = $this->UserProfiles->setUserProfiles($this->input->post());

		    //Reload session if the user is logged in
		    //Set session data
		    //$this->session->set_userdata($user_profile);

		    if (!empty($user_profile) && $user_profile->status === 'active') {

			    $result['result']['code'] = 1;
			    $result['result']['text'] = 'Changes saved !';

		    } else if (!empty($user_profile) && $user->status !== 'active') { 

			    $result['result']['code'] = 2;
			    $result['result']['text'] = 'Your account profile is not active';			

		    } else {

			    $result['result']['code'] = 0;
			    $result['result']['text'] = 'Profile not found';			
		    }

	    }

	    // Load json template
	    $data['json'] = $result;

	    // Load admin template
	    $this->load->view('json', $this->load->vars($data));	
	}
		
}