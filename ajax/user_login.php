<?php
session_start();
chdir('..');
require_once('api/Okay.php');
$okay = new Okay();

if (!empty($_POST['email'])) {
    $request = new StdClass;
    $request->email = $okay->request->post('email');
    $request->password = $okay->request->post('password');
    $request->url = null;
    $request->action = $okay->request->post('action');

    if ($user_id = $okay->users->check_password($request->email, $request->password)) {
        $user = $okay->users->get_user($request->email);
        if ($user->enabled) {
            $_SESSION['user_id'] = $user_id;
            $okay->users->update_user($user_id, array('last_ip' => $_SERVER['REMOTE_ADDR']));

            // Перенаправляем пользователя на прошлую страницу, если она известна
            $request->url = $_SERVER['HTTP_REFERER'];

        } else {
            $request->url = false;
        }

    }

}

if ($request->action == 'password_remind') {
    $okay->design->assign('email', $request->email);

    // Выбираем пользователя из базы
    $user = $okay->users->get_user($request->email);
    if (!empty($user)) {
        // Генерируем секретный код и сохраняем в сессии
        $code = md5(uniqid($sokay->config->salt, true));
        $_SESSION['password_remind_code'] = $code;
        $_SESSION['password_remind_user_id'] = $user->id;

        // Отправляем письмо пользователю для восстановления пароля
        $okay->notify->email_password_remind($user->id, $code);
        $okay->design->assign('email_sent', true);
        // Перенаправляем пользователя на прошлую страницу, если она известна
        $request->url = $_SERVER['HTTP_REFERER'];
    } else {
        $okay->design->assign('error', 'user_not_found');

        $request->url = $_SERVER['HTTP_REFERER'];
    }

}


if ($okay->request->get('code')) {
    // Проверяем существование сессии
    if (!isset($_SESSION['password_remind_code']) || !isset($_SESSION['password_remind_user_id'])) {
        return false;
    }

    // Проверяем совпадение кода в сессии и в ссылке
    if ($okay->request->get('code') != $_SESSION['password_remind_code']) {
        return false;
    }

    // Выбераем пользователя из базы
    $user = $okay->users->get_user(intval($_SESSION['password_remind_user_id']));
    if (empty($user)) {
        return false;
    }

    // Залогиниваемся под пользователем и переходим в кабинет для изменения пароля
    $_SESSION['user_id'] = $user->id;
    header('Location: ' . $okay->config->root_url . '/user');
}

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");
print json_encode($request);