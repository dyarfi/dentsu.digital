<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); ?>
<section id="account" class="account marginbot-50">
    <div class="container">
        <div class="col-lg-12 col-md-12 col-sm-12 marginbot-50">
            <div class="row marginbot-50">
                <h2 class="page-header text-center">HELLO</h2>
                <div class="boxed-grey marginbot-50">
                    <fieldset class="marginbot-50"><legend>Login to your account to proceed</legend>
                        <ul class="list-inline marginbot-50">
                            <li>
                                <a href="javascript:void(0);" class="btn btn-default btn-md twitter" id="twitter" onclick="popupCenter('<?php echo base_url('hauth/login/Twitter');?>', 'myPop1',480,520);">
                                    <span class="fa fa-twitter"></span>&nbsp;&nbsp;Login With Twitter
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="btn btn-default btn-md facebook" id="facebook" onclick="popupCenter('<?php echo base_url('hauth/login/Facebook');?>', 'myPop1',480,520);">
                                    <span class="fa fa-facebook"></span>&nbsp;&nbsp;Login With Facebook
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="btn btn-default btn-md googleplus" id="google" onclick="popupCenter('<?php echo base_url('hauth/login/Google');?>', 'myPop1',480,520);">
                                    <span class="fa fa-google-plus"></span>&nbsp;&nbsp;Login With Google
                                </a>
                            </li>
                        </ul>
                    </fieldset>    
                </div> 
            </div>
        </div>
    </div>
</section>