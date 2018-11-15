<div id="auth" class="popup-tab" data-tab="login">
    <p class="popup-title">Вход в личный кабинет</p>
    <form action="#" method="post" id="auth-login" class="js-auth-form">
        <input type="hidden" name="action" value="login">
        <div class="form-row">
            <label class="form-label">Email</label>
            <input class="form-input" type="email" name="email" required="" maxlength="255">
        </div>
        <div class="form-row">
            <label class="form-label">Пароль</label>
            <input class="form-input" type="password" name="password" required="">
            <small class="long-link">
                <a href="#password_remind" rel="nofollow" class="modalbox" class="js-tab-toggle"
                   data-target="password_remind">Забыли пароль?</a>
            </small>
        </div>
        <p id="err-msg"></p>
        <div class="row text-center">
            <div class="col-xs-6 col-xs-push-6 form-row text-right-xs">
                <input id="enter-btn" type="submit" class="button" name="login" value="Войти">
            </div>
            <div class="btn">
                <a href="#register" rel="nofollow" class="modalbox" data-target="register">Зарегистрироваться</a>
            </div>
        </div>
        <div class="success"></div>
        {if $error}
            <div class="message_error">
                {if $error == 'login_incorrect'}Неверный логин или пароль
                {elseif $error == 'user_disabled'}Ваш аккаунт еще не активирован.
                {else}{$error}{/if}
            </div>
        {/if}
    </form>
</div>
