<div id="password_remind" class="popup-tab hidden" data-tab="password_remind">
    <p class="popup-title">Напомнить пароль</p>
    <form action="#" method="post" id="auth-password-remind" class="js-auth-form">
        <input type="hidden" name="action" value="password_remind">
        <div class="form-row">
            <label class="form-label">Email</label>
            <input class="form-input" type="email" name="email" required="">
        </div>
        <p id="send-mail-message" class="alert alert-error hidden js-result"></p>
        <div class="row text-center">
            <div class="col-xs-6 col-xs-push-6 form-row text-right-xs">
                <input type="submit" class="btn" value="Напомнить">
            </div>
            <div class="col-xs-6 col-xs-pull-6 form-row text-left-xs hidden">
                <span class="btn btn-light js-tab-toggle" data-target="login">Войти</span>
            </div>
        </div>
        <div class="success success-remind-pass"><span></span></div>
    </form>
</div>