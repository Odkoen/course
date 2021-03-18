<!DOCTYPE html>
<html lang="{LANG_CODE}" dir="{LANGUAGE_DIRECTION}">
<head>
    <title>IF("{PAGE_TITLE}"!=""){ {PAGE_TITLE} - {:IF}{SITE_TITLE}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="author" content="{SITE_TITLE}">
    <meta name="keywords" content="{PAGE_META_KEYWORDS}">
    <meta name="description" content="{PAGE_META_DESCRIPTION}">
    <meta property="fb:app_id" content="{FACEBOOK_APP_ID}"/>
    <meta property="og:site_name" content="{SITE_TITLE}"/>
    <meta property="og:locale" content="en_US"/>
    <meta property="og:url" content="{PAGE_LINK}"/>
    <meta property="og:title" content="IF("{PAGE_TITLE}"!=""){ {PAGE_TITLE} - {:IF}{SITE_TITLE}" />
    <meta property="og:description" content="{PAGE_META_DESCRIPTION}"/>
    <meta property="og:type" content="{META_CONTENT}"/>
    IF("{META_CONTENT}"=="article"){
    <meta property="article:author" content="#"/>
    <meta property="article:publisher" content="#"/>
    <meta property="og:image" content="{META_IMAGE}"/>
    {:IF}
    IF("{META_CONTENT}"=="website"){
    <meta property="og:image" content="{META_IMAGE}"/>
    {:IF}

    <meta property="twitter:card" content="summary">
    <meta property="twitter:title" content="{PAGE_TITLE} - {SITE_TITLE}">
    <meta property="twitter:description" content="{PAGE_META_DESCRIPTION}">
    <meta property="twitter:domain" content="{SITE_URL}">
    <meta name="twitter:image:src" content="{META_IMAGE}"/>

    <link rel="shortcut icon" href="{SITE_URL}storage/logo/{SITE_FAVICON}">

    <script async>
        var themecolor = '{THEME_COLOR}';
        var mapcolor = '{MAP_COLOR}';
        var siteurl = '{SITE_URL}';
        var template_name = '{TPL_NAME}';
    </script>
    <style>
        :root{{LOOP: COLORS}--theme-color-{COLORS.id}: {COLORS.value};{/LOOP: COLORS}}
    </style>
    <link rel="stylesheet" href="{SITE_URL}includes/assets/css/icons.css">
    <link rel="stylesheet" href="{SITE_URL}includes/assets/plugins/flags/flags.min.css">
    <link rel="stylesheet" href="{SITE_URL}includes/assets/plugins/styleswitcher/styleswitcher.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/style.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/slick.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/color.css">
    <script src="{SITE_URL}templates/{TPL_NAME}/js/jquery-3.4.1.min.js"></script>

    IF("{LANGUAGE_DIRECTION}"=="rtl"){
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/rtl.css">
    {:IF}
    <script async>var ajaxurl = "{APP_URL}user-ajax.php";</script>
    <script async type="text/javascript">
        $(document).ready(function() {
            $('.resend').click(function(e) { 						// Button which will activate our modal
                var the_id = $(this).attr('id');						//get the id
                // show the spinner
                $(this).html("<i class='fa fa-spinner fa-pulse'></i>");
                $.ajax({											//the main ajax request
                    type: "POST",
                    data: "action=email_verify&id="+$(this).attr("id"),
                    url: ajaxurl,
                    success: function(data)
                    {
                        var tpl = '<a class="button ripple-effect gray" href="javascript:void(0);">'+data+'</a>';
                        $("span#resend_count"+the_id).html(tpl);
                        //fadein the vote count
                        $("span#resend_count"+the_id).fadeIn();
                        //remove the spinner
                        $("a.resend_buttons"+the_id).remove();

                    }
                });
                return false;
            });
        });
    </script>
    <!-- ===External Code=== -->
    {EXTERNAL_CODE}
    <!-- ===/External Code=== -->
</head>
<body data-role="page" class="{LANGUAGE_DIRECTION}" id="page" data-ipapi="{LIVE_LOCATION_API}" data-showlocationicon="{LOCATION_TRACK_ICON}">
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<!--Country-Cities-changes-Model-->
<a class="popup-with-zoom-anim hidden" href="#citiesModal" id="change-city">city</a>
<div class="zoom-anim-dialog mfp-hide popup-dialog big-dialog" id="citiesModal">
    <div class="popup-tab-content padding-0">
        <div class="quick-states" id="country-popup" data-country-id="{DEFAULT_COUNTRY_ID}" style="display: block;">
            <div id="regionSearchBox" class="title clr">
                <div class="clr">
                    <div class="locationrequest smallBox br5 col-sm-4">
                        <div class="rel input-container">
                            <div class="input-with-icon">
                                <input id="inputStateCity" class="with-border" type="text" placeholder="{LANG_TYPE_YOUR_CITY}">
                                <i class="la la-map-marker"></i>
                            </div>
                            <div id="searchDisplay"></div>
                            <div class="suggest bottom abs small br3 error hidden"><span
                                        class="target abs icon"></span>

                                <p></p>
                            </div>
                        </div>
                        <div id="lastUsedCities" class="last-used binded" style="display: none;">{LANG_LAST_VISITED}
                            <ul id="last-locations-ul">
                            </ul>
                        </div>
                    </div>
                   
                </div>
            </div>
            
            <div class="viewport">
                <div class="full" id="getCities">
                    <div class="col-sm-12 col-md-12 loader" style="display: none"></div>
                    <div id="results" class="animate-bottom">
                        <ul class="column cities">
                            {LOOP: STATELIST}
                            {STATELIST.tpl}
                            {/LOOP: STATELIST}
                        </ul>
                    </div>
                </div>
                <div class="table full subregionslinks hidden" id="subregionslinks"></div>
            </div>
        </div>
    </div>
</div>
<!--Country-Cities-changes-Model-->
<!-- Wrapper -->
<div id="wrapper">
    <header id="header-container" class="transparent">
        <!-- Header -->
        <div id="header">
            <div class="container">
                <div class="left-side">
                    <div id="logo">
                        <a href="{LINK_INDEX}"><img src="{SITE_URL}storage/logo/{SITE_LOGO}" alt="{SITE_TITLE}"></a>
                    </div>
                  
                    <div class="clearfix"></div>
                    <!-- Mobile Navigation -->
                    <nav class="mmenu-init">
                        <ul class="mm-listview">
                            <li><a href="{LINK_LISTING}">{LANG_FIND_ADS}</a></li>
                            IF({LOGGED_IN}){
                            <li><a href="{LINK_DASHBOARD}">{LANG_DASHBOARD}</a></li>
                            <li><a href="{LINK_MYADS}">{LANG_MY_ADS}</a></li>
                            <li><a href="{LINK_PROFILE}/{USERNAME}">{LANG_MY_PROFILE}</a></li>
                            <li><a href="{LINK_MEMBERSHIP}">{LANG_MEMBERSHIP}</a></li>
                            <li><a href="{LINK_TRANSACTION}">{LANG_TRANSACTION}</a></li>
                            IF('{WCHAT_ON_OFF}'=='on' || '{QUICKCHAT_AJAX_ON_OFF}'=='on' || '{QUICKCHAT_SOCKET_ON_OFF}'=='on'){
                            <li><a href="{LINK_MESSAGE}">{LANG_MESSAGE}</a></li>
                            {:IF}
                            <li><a href="{LINK_POST-AD}" class="button ripple-effect">{LANG_POST_FREE_AD}</a></li>
                            <li><a href="{LINK_LOGOUT}">{LANG_LOGOUT}</a></li>
                            {ELSE}
                            <li><a href="{LINK_LOGIN}">{LANG_LOGIN}</a></li>
                            <li><a href="{LINK_SIGNUP}">{LANG_REGISTER}</a></li>
                            <li><a href="{LINK_POST-AD}" class="button ripple-effect">{LANG_POST_FREE_AD}</a></li>
                            {:IF}
                        </ul>
                    </nav>
                </div>
                <div class="right-side">
                    IF({LOGGED_IN}){
                    <div class="header-widget padding-right-0 d-none d-lg-block">
                        <div class="header-notifications user-menu">
                            <div class="header-notifications-trigger">
                                <a href="#"><i class="icon-feather-user"></i> {USERNAME}<i
                                            class="icon-feather-chevron-down"></i></a>
                            </div>
                           
                        </div>
                    </div>
                    {:IF}
                    <div class="header-widget d-none d-lg-block">
                        <nav class="navigation">
                            <ul>
                                IF(!{LOGGED_IN}){
                                <li>
                                    <a href="#sign-in-dialog" class="popup-with-zoom-anim"><i
                                                class="icon-feather-log-in"></i> {LANG_LOGIN}</a>
                                </li>
                                <li><a href="{LINK_SIGNUP}">{LANG_REGISTER}</a></li>
                                {:IF}
                                <li><a href="{LINK_POST-AD}" class="button ripple-effect post-job">{LANG_POST_FREE_AD}</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    IF({LANG_SEL}){
                    
                    {:IF}
                    <span class="mmenu-trigger">
                <button class="hamburger hamburger--collapse" type="button">
                    <span class="hamburger-box">
                        <span class="hamburger-inner"></span>
                    </span>
                </button>
            </span>
                </div>

            </div>
        </div>

    </header>
    <div class="clearfix"></div>
    IF("{USERSTATUS}"=="0" && "{NON_ACTIVE_MSG}"=="1"){
    <div class="user-status-message">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <i class="icon-lock text-18"></i>
                    <span>{LANG_WELCOME} <strong>{USERNAME}</strong>, {LANG_GOTO_UR_EMAIL} <strong>{USEREMAIL}</strong>  {LANG_VERIFY_EMAIL_ADDRESS}</span>
                </div>
                <div class="col-lg-4">
                    <a class="button ripple-effect" rel="nofollow" target="_blank" role="button" href="http://{EMAILDOMAIN}/">{LANG_GOTO_UR_EMAIL}</a>
                    <a class="button ripple-effect gray resend_buttons{USER_ID} resend" href='javascript:void(0);' id="{USER_ID}">{LANG_RESEND_EMAIL}</a>
                    <span class='resend_count' id='resend_count{USER_ID}'></span>
                </div>
            </div>
        </div>
    </div>
    {:IF}
    <!-- Country Picker -->
    
