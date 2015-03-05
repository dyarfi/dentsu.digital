<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
				
//======================== Administrator Access - start config - ========================//

$config['module_list.models']		= array('admin/ModuleLists');
$config['module_list.module_menu']	= array('modulelist/index'  => 'Modules');
$config['module_list.module_function']	= array('modulelist/edit'   => 'Edit Module');

/* MODULE MENU 
 * 
 * Current MENU is only set to user and setting
 * Accessed by administrators only
 * 
 */

// Module Menu List
$config['admin_list.module_menu']	= array(
						'userhistory/index' => 'User Histories',
						'dashboard/index'   => 'Dashboard Panel',
						'user/index'	    => 'Users',
						'usergroup/index'   => 'User Groups',
                                                'language/index'    => 'Languages',
                                                'setting/index'	    => 'Settings'
						);
									
/* MODULE FUNCTION
 * 
 * Current FUNCTION is only set to user and setting
 * Accessed by administrators only
 */

// Module Function Menu List
$config['admin_list.module_function']	= array(
                                                'dashboard/add'	    => 'Add New Dashboard',
						'dashboard/view'    => 'View Dashboard',
						'dashboard/edit'    => 'Edit Dashboard',
						'dashboard/delete'  => 'Delete Dashboard',
						);

//======================== Administrator Access - end config - ========================//

// Default modules
$config['modulelist'] = array(	
	// Admin module
	'Admin' => array(
		// Admin Models list
		'models'	=> array(
					'admin/Users',
					'admin/UserProfiles',
					'admin/UserHistories',
					'admin/ModulePermissions',
                                        'admin/UserGroupPermissions',
                                        'admin/Languages',
					'admin/Settings',
					'admin/ServerLogs',
                                        'admin/Sessions'
					),
		// Admin module menus
		'module_menu'	=> array(
					// Dashboard index
					'dashboard/index'   => 'Dashboard Panel',
					// User index
					'user/index'	    => 'Users',
					// User Group index
					'usergroup/index'   => 'User Groups',
					// Language index
					'language/index'     => 'Languages',
                                        // Setting index
					'setting/index'     => 'Settings',
					// Server Log index
					'serverlog/index'   => 'Server Logs'
					),
		// Admin module functions
		'module_function'	=> array(
						// Dashboard functions
						'dashboard/add'	    => 'Add New Dashboard',
						'dashboard/view'    => 'View Dashboard',
						'dashboard/edit'    => 'Edit Dashboard',
						'dashboard/delete'  => 'Delete Dashboard',
						'dashboard/change'  => 'Change Dashboard Status',
						// User functions
						'user/add'	    => 'Add User',
						'user/view'	    => 'View User',
						'user/edit'	    => 'Edit User',
						'user/delete'	=> 'Delete User',
						'user/change'	=> 'Change User Status',	
						// User Group functions
						'usergroup/add'	    => 'Add User Group',
						'usergroup/view'    => 'View User Group',
						'usergroup/edit'    => 'Edit User Group',
						'usergroup/delete'  => 'Delete User Group',
						'usergroup/change'  => 'Change User Group Status',
                                                // Language functions
						'language/add'	    => 'Add Language',
						'language/view'	    => 'View Language',
						'language/edit'	    => 'Edit Language',
						'language/delete'    => 'Delete Language',
						'language/change'    => 'Change Language Status',
						// Setting functions
						'setting/add'	    => 'Add Setting',
						'setting/view'	    => 'View Setting',
						'setting/edit'	    => 'Edit Setting',
						'setting/delete'    => 'Delete Setting',
						'setting/change'    => 'Change Setting Status',
						// Server Log functions
						'serverlog/view'	=> 'View Server Log',
						'serverlog/edit'	=> 'Edit Server Log',
						'serverlog/delete'	=> 'Delete Server Log',
						'serverlog/trash'	=> 'Trash Server Log'
						)
	),
	// Page module
	'Page' => array (
		// Page Models list
		'models'		=> array('page/Pages','page/PageMenus'),
		// Page module menus
		'module_menu'		=> array('page/index'	  => 'Pages',
						 'pagemenu/index' => 'Page Menus'),
		// Page module functions
		'module_function'	=> array(
						// Page functions
						'page/index/add'	=> 'Add Page',							
						'page/index/view'	=> 'View Page',
						'page/index/edit'	=> 'Edit Page',
						'page/index/delete'	=> 'Delete Page',
						'page/index/change'	=> 'Change Page Status',
						'page/index/export'	=> 'Export Page',
						'page/index/print'	=> 'Print Page',
						// Page Menu functions
						'pagemenu/index/add'	=> 'Add Page Menu',
						'pagemenu/index/view'	=> 'View Page Menu',
						'pagemenu/index/edit'	=> 'Edit Page Menu',
						'pagemenu/index/delete'	=> 'Delete Page Menu',
						'pagemenu/index/change'	=> 'Change Page Menu Status',
						'pagemenu/index/export'	=> 'Export Page Menu',
						'pagemenu/index/print'	=> 'Print Page Menu',
					    ),
	),
	// Career module
	'Career' => array (
		// Career Models list
		'models'		=> array('career/Careers','career/Divisions','career/Applicants'),
		// Career module menus
		'module_menu'		=> array(
						'career/index'		=> 'Careers',
						'division/index'	=> 'Divisions',
						'applicant/index'	=> 'Applicants',
						'employee/index'	=> 'Employees'
						),
		// Career module functions
		'module_function'	=> array(
						// Career functions
						'career/index/add'	=> 'Add Career',
						'career/index/view'	=> 'View Career',
						'career/index/edit'	=> 'Edit Career',
						'career/index/delete'	=> 'Delete Career',
						'career/index/change'	=> 'Change Career Status',
						'career/index/export'	=> 'Export Career',
						'career/index/print'	=> 'Print Career',
						// Division functions
						'division/index/add'	=> 'Add Division',
						'division/index/view'	=> 'View Division',
						'division/index/edit'	=> 'Edit Division',
						'division/index/delete'	=> 'Delete Division',
						'division/index/change'	=> 'Change Division Status',
						'division/index/export' => 'Export Division',
						'division/index/print'	=> 'Print Division',
						// Applicant functions
						'applicant/index/add'	 => 'Add Applicant',
						'applicant/index/view'	 => 'View Applicant',			
						'applicant/index/edit'	 => 'Edit Applicant',			
						'applicant/index/delete' => 'Delete Applicant',
						'applicant/index/change' => 'Change Applicant',
						'applicant/index/export' => 'Export Applicant',
						'applicant/index/print'	 => 'Print Applicant',
						// Employee functions
						'employee/index/add'	=> 'Add Employee',
						'employee/index/view'	=> 'View Employee',			
						'employee/index/edit'	=> 'Edit Employee',			
						'employee/index/delete' => 'Delete Employee',
						'employee/set'		=> 'Set to Employee',
						'employee/index/change' => 'Change Employee',
						'employee/index/export' => 'Export Employee',
						'employee/index/print'	=> 'Print Employee'
						),
	)
);


/* End of file modules.php */
/* Location: ./application/config/modules.php */