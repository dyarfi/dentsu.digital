<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There area two reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router what URI segments to use if those provided
| in the URL cannot be matched to a valid route.
|
*/

$route['default_controller'] = "home";
$route['download/(:num)'] = 'download';
$route['404_override'] = '';


/*** Admin Related Routes - start - **/
$admin = (ADMIN) ? str_replace('/', '', ADMIN) : '';

$route[$admin]				= "admin/authenticate";
$route[$admin.'/authenticate']		= "admin/authenticate/index";
$route[$admin.'/authenticate/(:any)']	= "admin/authenticate/$1";

$route[$admin.'/dashboard/(:any)']	= 'admin/dashboard/$1';
$route[$admin.'/user/(:any)']		= 'admin/user/$1';
$route[$admin.'/usergroup/(:any)']	= 'admin/usergroup/$1';
$route[$admin.'/modulelist/(:any)']	= 'admin/modulelist/$1';
$route[$admin.'/setting/(:any)']	= 'admin/setting/$1';
$route[$admin.'/log/(:any)']		= 'admin/log/$1';

$route[$admin.'/career/(:any)']		= 'career/$1';
$route[$admin.'/careerdivision/(:any)'] = 'career/careerdivision/$1';
$route[$admin.'/careerapplicant/(:any)']    = 'career/careerapplicant/$1';

$route[$admin.'/page/(:any)']		    = 'page/$1';
$route[$admin.'/pagemenu/(:any)']	    = 'page/pagemenu/$1';

$route[$admin.'/(:any)'] = '$1';

//$route['admin/authenticate']	 = "admin/authenticate";
//$route['admin/(:any)'] = 'admin/$1';
//$route['admin/login'] = 'admin/login';
//$route['admin/logout'] = 'admin/logout';
//$route['admin/([a-zA-Z_-]+)'] = '$1/admin/index';
//$route['admin'] = 'modules';

/*** Admin Related Routes - end - **/


/* End of file routes.php */
/* Location: ./application/config/routes.php */