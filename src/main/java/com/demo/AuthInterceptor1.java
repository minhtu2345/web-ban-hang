package com.demo;

import com.demo.model.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class AuthInterceptor1
    implements HandlerInterceptor {

    @Autowired
    HttpSession session;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        Account user = (Account) session.getAttribute("user"); // lấy từ session
        String error = "";
        if(user == null) { // chưa đăng nhập
            error = "Please login!";
        }
// không đúng vai trò
        else if(!user.isAdmin() && uri.startsWith("/admin/")) {
            error = "Access denied!";
        }
//        if(error.length() > 0) { // có lỗi
//            session.setAttribute("security-uri", uri);
//            response.sendRedirect("/account/login?error=" + error);
//            return false;
//        }
        return true;
    }

}
