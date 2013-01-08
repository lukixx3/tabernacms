<?php
/**
 * Class for change the current theme
 * @author Denys Yackushev
 * @package RADCMS
 */
class controller_system_changetheme extends rad_controller
{
    function __construct()
    {
        if($this->request('t')) {
            if( file_exists(THEMESPATH.$this->request('t').'/description.txt') ) {
                rad_session::setVar('theme',$this->request('t'));
            }
        } else {
            rad_session::setVar('theme', $this->config('theme.default'));
        }
        if( isset($_SERVER['HTTP_REFERER']) ) {
            $this->redirect( $_SERVER['HTTP_REFERER'] );
        } else {
            $this->redirect( $this->makeURL('alias='.$this->config('defaultAlias')) );
        }
    }
}//class