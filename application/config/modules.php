<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
				
//======================== Administrator Access - start config - ========================//

/* MODULE MENU 
 * 
 * Current MENU is only set to user and and setting
 * Accessed by administrators only
 * 
 */

// Module Menu List
$config['admin_list.module_menu']	= array(
						'userhistory/index'	=> 'User History Listings',
						'dashboard/index'	=> 'Dashboard Panel',
						'user/index'		=> 'User Listings',
						'usergroup/index'	=> 'User Group Listings',
                                                'setting/index'         => 'Setting Listing'
					);
									
/* MODULE FUNCTION
 * 
 * Current FUNCTION is only set to user and and setting
 * Accessed by administrators only
 */

// Module Function Menu List
$config['admin_list.module_function']	= array(
                                                'dashboard/add'		=> 'Add New Dashboard',
						'dashboard/view'	=> 'View Dashboard Details',
						'dashboard/edit'	=> 'Edit Dashboard Details',
						'dashboard/delete'	=> 'Delete Dashboard',
					);

$config['module_list.models']		= array('ModuleLists');
$config['module_list.module_menu']	= array('modulelist/index' => 'Module Listing');
$config['module_list.module_function']	= array('modulelist/edit' => 'Edit Module Details');

//======================== Administrator Access - end config - ========================//

// Default modules
$config['modulelist'] = array(	
	// Admin module
	'Admin' => array(
		// Admin Model list
		'models'		=> array(
							'Users',
							'UserGroups',
							'UserProfiles',
							'UserHistories',
							'ModulePermissions',
                                                        'Settings',
							'ServerLogs'
						),
		// Admin module menu
		'module_menu'	=> array(
							// Dashboard index
							'dashboard/index'	=> 'Dashboard Panel',
							// User index
							'user/index'		=> 'User Listings',
							// User Group index
							'usergroup/index'	=> 'User Group Listings',
                                                        // Setting index
							'setting/index'         => 'Setting Listings',
							// Log index
							'log/index'		=> 'Log Listings'
						),
		// Admin module function
		'module_function'	=> array(
							// Dashboard functions
							'dashboard/add'		=> 'Add New Dashboard',
							'dashboard/view'	=> 'View Dashboard Details',
							'dashboard/edit'	=> 'Edit Dashboard Details',
							'dashboard/delete'	=> 'Delete Dashboard',
							'dashboard/change'	=> 'Change Dashboard Status',
							// User functions
							'user/add'		=> 'Add User Details',
							'user/view'		=> 'View User Details',
							'user/edit'		=> 'Edit User Details',
							'user/delete'		=> 'Delete User Details',
							'user/change'		=> 'Change User Status',	
							// User Group functions
							'usergroup/add'		=> 'Add User Group Details',
							'usergroup/view'	=> 'View User Group Details',
							'usergroup/edit'	=> 'Edit User Group Details',
							'usergroup/delete'	=> 'Delete User Group Details',
							'usergroup/change'	=> 'Change User Group Status',
                                                        // Setting functions
                                                        'setting/add'	  => 'Add Setting Details',
                                                        'setting/view'	  => 'View Setting Details',
                                                        'setting/edit'    => 'Edit Setting Details',
                                                        'setting/delete'  => 'Delete Setting Details',
                                                        'setting/change'  => 'Change Setting Status',
							// Log functions
							'log/view'	=> 'View Log Details',
                                                        'log/edit'	=> 'Edit Log Details',
							'log/delete'	=> 'Delete Log Details',
							'log/empty'	=> 'Empty Log Details'
							)
	),
	// Page module
	'Page' => array (
		// Page Model list
		'models'		=> array('Pages','PageMenus'),
		// Page module menu
		'module_menu'		=> array('page/index'	  => 'Page Listings',
						 'pagemenu/index' => 'Page Menu Listings'),
		// Page module function
		'module_function'	=> array(
						// Page functions
						'page/index/add'	=> 'Add Page Details',							
						'page/index/view'	=> 'View Page Details',
						'page/index/edit'	=> 'Edit Page Details',
						'page/index/delete'	=> 'Delete Page Details',
						'page/index/change'	=> 'Change Page Status'	,
						// Page Menu functions
						'pagemenu/index/view'	=> 'View Page Details',
						'pagemenu/index/edit'	=> 'Edit Page Details',
						'pagemenu/index/delete'	=> 'Delete Page Details',
						'pagemenu/index/change'	=> 'Change Page Status'	
					    ),
	),
	// Career module
	'Career' => array (
		// Career Model list
		'models'		=> array('Careers','CareerDivisions','CareerApplicants'),
		// Career module menu
		'module_menu'		=> array(
						'career/index'		=> 'Career Listings',
						'careerdivision/index'	=> 'Career Division Listings',
						'careerapplicant/index'	=> 'Career Applicant Listings'
						),
		// Career module function
		'module_function'	=> array(
						// Career functions
						'career/index/add'		=> 'Add Career Details',
						'career/index/view'		=> 'View Career Details',
						'career/index/edit'		=> 'Edit Career Details',
						'career/index/delete'		=> 'Delete Career Details',
						'career/index/change'		=> 'Change Career Status',	
						// Career Applicant functions
						'careerapplicant/index/add'	 => 'Add Career Division Listings',
						'careerapplicant/index/view'	 => 'View Career Division Listings',			
						'careerapplicant/index/edit'	 => 'Edit Career Division Listings',			
						'careerapplicant/index/delete' => 'Delete Career Division Listings',
						'careerapplicant/index/change' => 'Change Career Division Listings'
						),
	)
);

/* End of file modules.php */
/* Location: ./application/config/modules.php */