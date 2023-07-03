package com.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Autowired
    AuthInterceptor1 authInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        LocaleChangeInterceptor li = new LocaleChangeInterceptor();
        registry.addInterceptor(authInterceptor) .addPathPatterns("/account/edit",
                "/account/chgpwd", "/order/**", "/admin/**")
                .excludePathPatterns("/assets/**", "/admin/home/index");;
    }
}
