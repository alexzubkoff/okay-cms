<div id="register" class="popup-tab hidden" data-tab="register">
    <p class="popup-title">Регистрация</p>
    <form action="user/register" method="post" id="auth-register" class="js-auth-form2">
        <input type="hidden" name="action" value="register">
        <div class="form-row">
            <label class="form-label">Имя</label>
            <input class="form-input" type="text" name="name" required="" maxlength="255">
        </div>
        <div class="form-row">
            <label class="form-label">Email</label>
            <input class="form-input" type="email" name="email" required="" maxlength="255">
        </div>
        <div class="form-row">
            <label class="form-label">Пароль</label>
            <input class="form-input" type="password" name="password" required="">
        </div>
        <div class="captcha"><img src="captcha/image.php?{math equation='rand(10,10000)'}"/></div>
        <input class="input_captcha" id="comment_captcha" type="text" name="captcha_code" value=""
               data-format="\d\d\d\d" data-notice="Введите капчу"/>

        <p class="alert alert-error hidden js-result"></p>
        <div class="row text-center">
            <div class="col-xs-6 col-xs-push-6 form-row text-right-xs">
                <input type="submit" class="button" name="register" value="Зарегистрироваться">
            </div>
            <div class="col-xs-6 col-xs-pull-6 form-row text-left-xs">
                <a href="#auth" rel="nofollow" class="modalbox">Уже зарегистрированы?</a>
            </div>
        </div>
        <div class="success"></div>
    </form>
</div>