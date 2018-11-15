/**
 * Created by alexz on 12.11.2018.
 */
"use strict";
$(document).ready(function () {
    $(".modalbox").fancybox();
    $("#f_contact").submit(function () {
        return false;
    });
    $("#f_send").on("click", function () {

        // тут дальнейшие действия по обработке формы
        // закрываем окно, как правило делать это нужно после обработки данных
        $("#f_contact").fadeOut("fast", function () {
            $(this).before("<p><strong>Ваше сообщение отправлено!</strong></p>");
            setTimeout("$.fancybox.close()", 1000);
        });
    });

    $('body').on('submit', '.js-auth-form', function (e) {
        e.preventDefault();
        var data = $(this).serialize();
        $.ajax({
            type: 'POST',
            url: 'ajax/user_login.php',
            data: data,
            dataType: 'json',
            success: function (response) {
                if (response.url) {
                    window.location.href = response.url;
                } else {
                    $('#err-msg').text('Неверный логин или пароль').css({
                        'color': '#de5959',
                        'background-color': '#ffe9e9'
                    });
                }

                if (response.action === 'password_remind') {
                    alert('Ссылка для восстановления пароля была отправлена вам на почту');
                    setTimeout(function () {
                        window.location.href = response.url;
                    }, 1000);
                } else {
                    $('#send-mail-message').text('Неверный адрес почты').css({
                        'color': '#de5959',
                        'background-color': '#ffe9e9'
                    });
                }
            },
            error: function (request, status, err) {
                console.log('something went wrong', status, err);
            }
        });

    });

});