<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

//======================== Administrator Access - start config - ========================//

$config['module_list.models']		= array('admin/ModuleLists');
$config['module_list.module_menu']	= array('modulelist/index'  => 'Module Lists');
$config['module_list.module_function']	= array(
											'modulelist/edit'   => 'Edit Module',
											'modulelist/trash'	=> 'Delete User Permission'
											);

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
						'user/image'	=> 'Change User Image', /** Upload temp user image **/
						'user/upload'	=> 'Upload User Image', /** Upload user image **/
						'user/export'	=> 'Export User Data', /** Export user data  **/
						// User Group functions
						'usergroup/add'	    => 'Add User Group',
						'usergroup/view'    => 'View User Group',
						'usergroup/edit'    => 'Edit User Group',
						'usergroup/delete'  => 'Delete User Group',
						'usergroup/change'  => 'Change User Group Status',
						'usergroup/export'	=> 'Export User Group Data', /** Export User Group data  **/
						// Language functions
						'language/add'	    => 'Add Language',
						'language/view'	    => 'View Language',
						'language/edit'	    => 'Edit Language',
						'language/delete'   => 'Delete Language',
						'language/change'   => 'Change Language Status',
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
						'serverlog/trash'	=> 'Trash Server Log',
						'serverlog/export'	=> 'Export Server Log Data' /** Export Server Log data  **/
						)
	),
	// Page module
	'Page' => array (
		// Page Models list
		'models'		=> array('page/Pages','page/PageMenus'),
		// Page module menus
		'module_menu'	=> array(
						'page/index'		=> 'Pages',
						'pagemenu/index'	=> 'Page Menus'),
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
						// Pages Gallery functions
                        'page_gallery/index'        => 'Gallery',
                        'page_gallery/index/add'	=> 'Add Gallery',
                        'page_gallery/index/view'	=> 'View Gallery',
                        'page_gallery/index/edit'	=> 'Edit Gallery',
                        'page_gallery/index/delete' => 'Delete Gallery',
                        'page_gallery/index/change' => 'Change Gallery',
                        'page_gallery/index/export' => 'Export Gallery',
                        'page_gallery/index/print'	=> 'Print Gallery',
                        'page_gallery/index/upload_file'	=> 'Upload Gallery',
						// Page Menu functions
						'pagemenu/index/add'	=> 'Add Page Menu',
						'pagemenu/index/view'	=> 'View Page Menu',
						'pagemenu/index/edit'	=> 'Edit Page Menu',
						'pagemenu/index/delete'	=> 'Delete Page Menu',
						'pagemenu/index/change'	=> 'Change Page Menu Status',
						'pagemenu/index/export'	=> 'Export Page Menu',
						'pagemenu/index/print'	=> 'Print Page Menu'
					    ),
	),
	// Career module
	'Career' => array (
		// Career Models list
		'models'		=> array('career/Careers','career/Divisions','career/Applicants'),
		// Career module menus
		'module_menu'	=> array(
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
						'employee/set'			=> 'Set to Employee',
						'employee/index/change' => 'Change Employee',
						'employee/index/export' => 'Export Employee',
						'employee/index/print'	=> 'Print Employee'
						),
	),
	// Questionnaire module
	'Questionnaire' => array (
		// Questionnaire Models list
		'models'		=> array('questionnaire/Questionnaires','questionnaire/Questions','questionnaire/QuestionRules','questionnaire/QuestionnaireUserAnswers','questionnaire/Questionnairecompleted'),
		// Questionnaire module menus
		'module_menu'	=> array(
						'questionnaire/index'	=> 'Questionnaires',
						'question/index'		=> 'Questions',
						'questionrule/index'	=> 'Question Rule',
						'participantanswered/index' => 'Questionnaires Answer'
						),
		// Questionnaire module functions
		'module_function'	=> array(
						// Questionnaire functions
						'questionnaire/index/add'	=> 'Add Questionnaire',
						'questionnaire/index/view'	=> 'View Questionnaire',
						'questionnaire/index/edit'	=> 'Edit Questionnaire',
						'questionnaire/index/delete'	=> 'Delete Questionnaire',
						'questionnaire/index/change'	=> 'Change Questionnaire Status',
						'questionnaire/index/export'	=> 'Export Questionnaire',
						'questionnaire/index/print'	=> 'Print Questionnaire',
						// Question functions
						'question/index/add'	=> 'Add Question',
						'question/index/view'	=> 'View Question',
						'question/index/edit'	=> 'Edit Question',
						'question/index/delete'	=> 'Delete Question',
						'question/index/change'	=> 'Change Question Status',
						'question/index/export'	=> 'Export Question',
						'question/index/print'	=> 'Print Question',
						// Question rule functions
						'questionrule/index/add'	=> 'Add Question Rule',
						'questionrule/index/view'	=> 'View Question Rule',
						'questionrule/index/edit'	=> 'Edit Question Rule',
						'questionrule/index/delete'	=> 'Delete Question Rule',
						'questionrule/index/change'	=> 'Change Question Rule Status',
						'questionrule/index/export'	=> 'Export Question Rule',
						'questionrule/index/print'	=> 'Print Question Rule',
						// Questionnaire Participant Answer rule functions
						'participantanswered/index/add'	=> 'Add Participant Answer',
						'participantanswered/index/view'	=> 'View Participant Answer',
						'participantanswered/index/edit'	=> 'Edit Participant Answer',
						'participantanswered/index/delete'	=> 'Delete Participant Answer',
						'participantanswered/index/change'	=> 'Change Participant Answer Status',
						'participantanswered/index/export'	=> 'Export Participant Answer',
						'participantanswered/index/print'	=> 'Print Participant Answer',
						),
	),
	// Qrcode module
	'Qrcode' => array (
		// Qrcode Models list
		'models'		=> array('qrcode/Qrcodes'),
		// Qrcode module menus
		'module_menu'	=> array(
						'qrcode/index'			=> 'QR Codes',
						'qrcodescanner/index'	=> 'QR Code Scanner'
						),
		// Qrcode module functions
		'module_function'	=> array(
						// Qrcode functions
						'qrcode/index/add'	=> 'Add QR Code',
						'qrcode/index/view'	=> 'View QR Code',
						'qrcode/index/edit'	=> 'Edit QR Code',
						'qrcode/index/delete'	=> 'Delete QR Code',
						'qrcode/index/change'	=> 'Change QR Code Status',
						'qrcode/index/export'	=> 'Export QR Code',
						'qrcode/index/print'	=> 'Print QR Code'
						),
	),
	// Color Recognizer module
	'Color' => array (
		// Color Recognizer Models list
		'models'		=> array('color/Colors','color/Colorcontents','color/Colorpersonals'),
		// Color Recognizer module menus
		'module_menu'	=> array(
						'color/index'			=> 'Color Data',
						'colorcontent/index'	=> 'Color Content',
						'colorpersonal/index'	=> 'Color Personal',
						'colorscanner/index'	=> 'Color Scanner'
						),
		// Color Recognizer module functions
		'module_function'	=> array(
						// Color Recognizer functions
						'color/index/add'	=> 'Add Color Recognizer',
						'color/index/view'	=> 'View Color Recognizer',
						'color/index/edit'	=> 'Edit Color Recognizer',
						'color/index/delete'	=> 'Delete Color Recognizer',
						'color/index/change'	=> 'Change Color Recognizer Status',
						'color/index/export'	=> 'Export Color Recognizer',
						'color/index/print'	=> 'Print Color Recognizer',
						// Color Content functions
						'colorcontent/index/add'	=> 'Add Color Content',
						'colorcontent/index/view'	=> 'View Color Content',
						'colorcontent/index/edit'	=> 'Edit Color Content',
						'colorcontent/index/delete'	=> 'Delete Color Content',
						'colorcontent/index/change'	=> 'Change Color Content Status',
						'colorcontent/index/export'	=> 'Export Color Content',
						'colorcontent/index/print'	=> 'Print Color Content',
						// Color Personal functions
						'colorpersonal/index/add'	=> 'Add Color Personal',
						'colorpersonal/index/view'	=> 'View Color Personal',
						'colorpersonal/index/edit'	=> 'Edit Color Personal',
						'colorpersonal/index/delete'	=> 'Delete Color Personal',
						'colorpersonal/index/change'	=> 'Change Color Personal Status',
						'colorpersonal/index/export'	=> 'Export Color Personal',
						'colorpersonal/index/print'	=> 'Print Color Personal'
						)
	),
    // Participant Module
    'Participant' => array(// Career Models list
		'models'    => array('participant/Participants','participant/Attachments'),
		// Participant module menus
		'module_menu'		=> array(
                    'participant/index' => 'Participant',
                    'attachment/index'	=> 'Attachment',
                    'attachment/index'	=> 'Attachment'
        ),
		// Participant module functions
		'module_function'	=> array(
                    // Participant functions
                    'participant/index/add'	    => 'Add Participant',
                    'participant/index/view'    => 'View Participant',
                    'participant/index/edit'    => 'Edit Participant',
                    'participant/index/delete'  => 'Delete Participant',
                    'participant/index/change'  => 'Change Participant Status',
                    'participant/index/export'  => 'Export Participant',
                    'participant/index/print'   => 'Print Participant',
                    // Attachment functions
                    'attachment/index/add'	=> 'Add Attachment',
                    'attachment/index/view'    => 'View Attachment',
                    'attachment/index/edit'    => 'Edit Attachment',
                    'attachment/index/delete'  => 'Delete Attachment',
                    'attachment/index/change'  => 'Change Attachment Status',
                    'attachment/index/export'  => 'Export Attachment',
                    'attachment/index/print'   => 'Print Attachment',
        )
	),
	// Conference module
	'Conference' => array (
		// Career Models list
		'models'		=> array('conference/Conferences','conference/Speakers','conference/Informations','conference/Schedules','conference/Submissions','conference/Galleries','conference/Banners'),
		// Career module menus
		'module_menu'	=> array(
                    'conference/index'	=> 'Conferences',
                    'speaker/index'     => 'Speakers',
                    'information/index'	=> 'Informations',
                    'schedule/index'	=> 'Schedules',
                    'submission/index'	=> 'Submissions'
        ),
		// Conference module functions
		'module_function'	=> array(
                // Conference functions
                'conference/index/add'	=> 'Add Conference',
                'conference/index/view'	=> 'View Conference',
                'conference/index/edit'	=> 'Edit Conference',
                'conference/index/delete'	=> 'Delete Conference',
                'conference/index/change'	=> 'Change Conference Status',
                'conference/index/export'	=> 'Export Conference',
                'conference/index/print'	=> 'Print Conference',
                // Speaker functions
                'speaker/index/add'     => 'Add Speaker',
                'speaker/index/view'	=> 'View Speaker',
                'speaker/index/edit'	=> 'Edit Speaker',
                'speaker/index/delete'	=> 'Delete Speaker',
                'speaker/index/change'	=> 'Change Speaker Status',
                'speaker/index/export'  => 'Export Speaker',
                'speaker/index/print'	=> 'Print Speaker',
                // Informations functions
                'information/index/add'     => 'Add Information',
                'information/index/view'	=> 'View Information',
                'information/index/edit'	=> 'Edit Information',
                'information/index/delete'  => 'Delete Information',
                'information/index/change'  => 'Change Information',
                'information/index/export'  => 'Export Information',
                'information/index/print'	=> 'Print Information',
                // Schedule functions
                'schedule/index/add'	=> 'Add Schedule',
                'schedule/index/view'	=> 'View Schedule',
                'schedule/index/edit'	=> 'Edit Schedule',
                'schedule/index/delete' => 'Delete Schedule',
                'schedule/set'			=> 'Set to Schedule',
                'schedule/index/change' => 'Change Schedule',
                'schedule/index/export' => 'Export Schedule',
                'schedule/index/print'	=> 'Print Schedule',

                // Conferences Submissions functions
                'conference/submission/index/add'	=> 'Add Submission',
                'conference/submission/index/view'	=> 'View Submission',
                'conference/submission/index/edit'	=> 'Edit Submission',
                'conference/submission/index/delete' => 'Delete Submission',
                'conference/submission/index/change' => 'Change Submission',
                'conference/submission/index/export' => 'Export Submission',
                'conference/submission/index/print'	=> 'Print Submission',

                // Conferences Gallery functions
                'conference_gallery/index'	=> 'Gallery',
                'conference_gallery/index/add'	=> 'Add Gallery',
                'conference_gallery/index/view'	=> 'View Gallery',
                'conference_gallery/index/edit'	=> 'Edit Gallery',
                'conference_gallery/index/delete' => 'Delete Gallery',
                'conference_gallery/index/change' => 'Change Gallery',
                'conference_gallery/index/export' => 'Export Gallery',
                'conference_gallery/index/print'	=> 'Print Gallery',

                // Conferences Banner functions
                'conference_banner/index'	=> 'Banner',
                'conference_banner/index/add'	=> 'Add Banner',
                'conference_banner/index/view'	=> 'View Banner',
                'conference_banner/index/edit'	=> 'Edit Banner',
                'conference_banner/index/delete' => 'Delete Banner',
                'conference_banner/index/change' => 'Change Banner',
                'conference_banner/index/export' => 'Export Banner',
                'conference_banner/index/print'	=> 'Print Banner'
                ),
	)
);


/* End of file modules.php */
/* Location: ./application/config/modules.php */
