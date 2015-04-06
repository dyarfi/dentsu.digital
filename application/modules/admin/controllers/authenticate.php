<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

// Class for Authenticate used for user login
class Authenticate extends Admin_Controller {

	public function __construct() {
	    parent::__construct();		

	    // Load user, profile, groups and group permissions models
	    $this->load->model('Users');
	    $this->load->model('UserProfiles');
	    $this->load->model('UserGroups');
	    $this->load->model('UserGroupPermissions');

	    // Load ModuleLists, ModelLists and ModulePermissions models
	    $this->load->model('ModuleLists');
	    $this->load->model('ModelLists');
	    $this->load->model('ModulePermissions');

	    // Load Configurations, UserHistories and Captcha
	    $this->load->model('Configurations');		
	    $this->load->model('UserHistories');	
	    $this->load->model('Captcha');
		$this->load->model('Sessions');
	
	}

	public function index() {
	
	    // Check if user is logged in or not
	    if ($this->session->userdata('user_session') == '') {
			/** Redirect to authentication **/
			redirect(ADMIN . 'authenticate/login');
	    } else {
			/** Redirect to dashboards **/
			redirect(str_replace('{admin_id}', $this->user->id, $this->configs['default_page']));
	    }
	    
	}
	
	public function login () {	

	    // POST checking
	    if($_SERVER['REQUEST_METHOD'] === 'POST'){

		    $userObj = $_POST;

		    $this->form_validation->set_rules('username', 'Username', 'trim|required|min_length[5]|max_length[24]|xss_clean');
		    $this->form_validation->set_rules('password', 'Password','trim|required|min_length[5]|max_length[24]|xss_clean');

		    if ($this->form_validation->run() == FALSE) {

		    }
		    else {
			
		    }

		    //Make sure login object was true
		    if($userObj['username'] == '' OR $userObj['password'] == '') {
			//return false;

		    }
		    //Check if already logged in
		    if($this->session->userdata('username') == $userObj['username']) {
			//User is already logged in.				
			//return false;

		    }

		    // Initialize install
		    $this->Users->install();					   
		    $this->UserGroups->install();
			$this->ModuleLists->install();
		    $this->ModelLists->install();
		    $this->Configurations->install();		    
			$this->Captcha->install();		
			$this->Sessions->install();

		    //Check User login info
		    $user	= $this->Users->login($userObj);

		    // User data checking
		    if(!empty($user)) {

			    // Set return default
			    $return	    = '';

			    if ($user == 'disabled') {
					// Set flash message to disabled account
					$this->session->set_flashdata('flashdata', 'Your account is disabled!');
					// Redirect to login
					redirect(ADMIN.'authenticate/login');
			    }

			    // Check User Level from User ID given
			    $user_group = $this->UserGroups->getUserGroup($user->group_id);

			    // Checking for full backend access
			    if (intval($user_group->full_backend_access) === 1) {
					// Checking module access for ADMINISTRATOR Level
					$this->ModuleLists->module_check();
			    } 

			    // Get module list by user
			    $module_list	= $this->ModuleLists->getModules($user->group_id);

			    // Get function list by user
			    $function_list	= $this->UserGroupPermissions->getModuleFunction($user->group_id);

			    $user_session->id = $user->id;
			    $user_session->username = $user->username;
			    $user_session->email = $user->email;
			    $user_session->password = substr_replace($user->password, "********", 0, strlen($user->password));
			    $user_session->group_id = $user->group_id;
			    $user_session->status = $user->status;				
			    $user_session->last_login = $user->last_login;				
			    $user_session->logged_in = true;
			    $user_session->name = $this->UserProfiles->getName($user->id);

			    $ci_session = array(
				    'module_list'		=> json_encode($module_list),
				    'module_function_list'	=> json_encode($function_list),
				    'user_session'		=> $user_session,
			    );

			    //Set session data
			    $this->session->set_userdata($ci_session);
			    
			    // Redirect to dashboard
				redirect(ADMIN.'dashboard/index');
			    
		    } else {

			    $userObj = 'No user with that account';				
			    $this->session->set_flashdata('flashdata', $userObj);				

			    redirect(ADMIN.'authenticate/login');
		    }
	    }

	     // Set main template
	    $data['main']	= 'admin/login';
	    
	    // Load admin template
	    $this->load->view('template/admin/login_template', $this->load->vars($data));
	}
	public function logout() {
		
	    //Set user's last login 
	    $this->Users->setLastLogin(@Acl::user()->id);		

	    //Destroy user session		
	    $this->session->unset_userdata('module_list');
	    $this->session->unset_userdata('module_function_list');
	    $this->session->unset_userdata('user_data');		
	    $this->session->unset_userdata('user_session');

	    $this->session->sess_destroy();

	    //Redirect admin to refresh
	    redirect(ADMIN.'authenticate/login');

    }
	
}