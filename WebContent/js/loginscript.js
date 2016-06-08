$(document).ready(function () {
    // 验证码点击事件,更新验证码
    $("img[name='safecode_img']").click(function (event) {
        $(this).attr("src", contextPath + "/safecode/create_sc?K=" + Math.random());
    });
    $("img[name='safecode_img']").click();//界面加载完成时就点击一次图片
 
    /**
     * 前端登陆验证
     */
    var message_tips = $("span[name='loginTips']"); // 获得提示文本对象
    //用户登陆前端验证
    var username_input = $("input[name='username']");
    username_input.blur(function (event) {
        checkUserName();
    });
    username_input.focus(function (event) {
        message_tips.html("登录验证");
        message_tips.css("color","black");
    });
 
    //用户名验证的方法
    function checkUserName() {
        var username = username_input.val();
        if (username == "" || username == null) {
            message_tips.html("用户名不能为空！");
            message_tips.css("color","red");
            return false;
        }
        if (username.length > 12) {
            message_tips.html("用户名不多于12个字节！");
            message_tips.css("color","red");
            return false;
        }
        return true;
    }
 
    // 密码前端检测
    var password_input = $("input[name='password']");
    password_input.blur(function (event) {
        checkPassword();
    });
    password_input.focus(function (event) {
        message_tips.html("登录验证");
        message_tips.css("color","black");
    });
 
    //登陆的密码验证
 
    function checkPassword() {
        var password = $("input[name='password']").val();
        if (password == "" || password == null) {
            message_tips.html("密码不能为空！");
            message_tips.css("color","red");
            return false;
        }
        if (password.length < 6 || password.length > 16) {
            message_tips.html("密码长度为6到16位字母数字组合！");
            message_tips.css("color","red");
            return false;
        }
        return true;
    }
 
    //验证码ajax检测
    var ok_validate_code = false; //验证码是否已经验证正确
    var validate_code_input = $("input[name=safecode]");
    validate_code_input.blur(function (event) {
        var validate_code = $(this).val();
        if (validate_code == "" || validate_code == null) {
            message_tips.html("验证码不能为空！");
            message_tips.css("color","red");
            return false;
        }
        $.ajax({
            type: "post",
            url: contextPath + "/safecode/check_sc",
            data: "safecode=" + validate_code,
            dataType: "text",
            success: function (data) {
                if (data == "false") {
                    message_tips.html("验证码不正确！");
                    message_tips.css("color","red");
                    return false;
                } else {
                	message_tips.css("color","green");
                    message_tips.html("验证码正确！");
                    ok_validate_code = true;
                    return false;
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
                return false;
            }
        });
    });
    validate_code_input.focus(function (event) {
        message_tips.html("");
        message_tips.css("color","green");
        ok_validate_code = false;
    });
 
    //登陆按钮点击事件
    $("form").submit(function () {
        if (checkUserName() && checkPassword() && ok_validate_code){
            $.ajax({
                type: "post",
                url: contextPath + "/user/login",
                data:{username:username_input.val(),password:password_input.val()},
                dataType: "text",
                success: function (data) {
                    if (data == "false") {
                        message_tips.html("用户名或密码错误！");
                        $("img[name='safecode_img']").click();
                        message_tips.css("color","red");
                        return false;
                    } else {
                    	message_tips.html("登录成功！正在跳转页面.......");
                    	message_tips.css("color","green");
                    	setTimeout(function () {
                    		 window.location="./page/main.jsp";
                    	}, 1500); //页面刷新
                    	return false;
                    }
                },
                error: function (XMLHttpRequest, textStatus,errorThrown) {
                    alert(errorThrown);
                    return false;
                }
            });
          }
        return false;
    });
});