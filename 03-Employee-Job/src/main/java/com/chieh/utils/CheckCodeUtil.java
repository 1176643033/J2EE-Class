package com.chieh.utils;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet( "/CheckCodeUtil")
public class CheckCodeUtil extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*创建验证码*/
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(200, 100,4,30);
        /*输出到浏览器同时保存到seesion中供给后面验证*/
        HttpSession session=request.getSession();
        session.setAttribute("code",lineCaptcha.getCode());
        lineCaptcha.write(response.getOutputStream());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
