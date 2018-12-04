
jQuery(document).ready(function() {
    $("#btn").click(function(){
        var username = $('.username').val();
        var password = $('.password').val();
        var yzm = $('.yzm').val();
        if(username == '') {
            $('.error').fadeOut('fast', function(){
                $('.error').css('top', '27px');
            });
            $('.error').fadeIn('fast', function(){
                $('.error').parent().find('.username').focus();
            });
            return false;
        }
        if(password == '') {
            $('.error').fadeOut('fast', function(){
                $('.error').css('top', '96px');
            });
            $('.error').fadeIn('fast', function(){
                $('.error').parent().find('.password').focus();
            });
            return false;
        }
        if(yzm == '') {
            $('.error').fadeOut('fast', function(){
                $('.error').css('top', '160px');
            });
            $('.error').fadeIn('fast', function(){
                $('.error').parent().find('.yzm').focus();
            });
            return false;
        }
        $("#fmbd").submit();
    });

    $('.page-container form .username, .page-container form .password,.page-container form .yzm').keyup(function(){
        $(this).parent().find('.error').fadeOut('fast');
    });

});
