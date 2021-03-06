<?php
/**
 * \Controller\Admin\LoginController.php
 * LoginController.php
 *
 * Login controller
 *
 * @author      Nguyen Duy <nguyenducduy.it@gmail.com>
 * @since       2014-12-19
 * @category    Fly
 *
 */

namespace Controller\Admin;

use Fly\BaseController as FlyController;

class LoginController extends FlyController
{
    public function indexAction()
    {
        $redirectUrl = $this->dispatcher->getParam('redirect');
        $formData = [];
        $cookie = false;
        $formData['femail'] = $this->request->getPost('femail', null, '');
        $formData['fpassword'] = $this->request->getPost('fpassword', null, '');
        $formData['fcookie'] = $this->request->getPost('fcookie', null, false);

        if ($this->request->hasPost('fsubmit')) {
            if ($this->security->checkToken()) {
                if (isset($formData['fcookie']) && $formData['fcookie'] == 'remember-me') {
                    $cookie = (boolean) true;
                }

                $identity = $this->authentication->check(
                    (string) $formData['femail'],
                    (string) $formData['fpassword'],
                    $cookie,
                    true);

                if ($identity == true) {
                    if ($redirectUrl != null) {
                        $this->response->redirect($redirectUrl);
                    } else {
                        $this->response->redirect('admin/dashboard');
                    }
                }
            }
        }

        $this->tag->prependTitle('Login');
        $this->view->setVars([
            'formData' => $formData
        ]);
    }
}