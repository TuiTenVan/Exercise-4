package com.javaweb.security;

import com.javaweb.constant.SystemConstant;
import com.javaweb.security.utils.SecurityUtils;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Setter
@Getter
@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException {
        String targetUrl = determineTargetUrl(authentication);
        if (response.isCommitted()) {
            System.out.println("Can't redirect");
            return;
        }
        redirectStrategy.sendRedirect(request, response, targetUrl);
    }

    public String determineTargetUrl(Authentication authentication) {
        String url = "";
        List<String> roles = SecurityUtils.getAuthorities();
//        if (isUser(roles)) {
//            url = SystemConstant.HOME;
//        } else if (isAdmin(roles)) {
//            url = SystemConstant.ADMIN_HOME;
//        }
//        return url;
        if (isUser(roles)) {
            url = SystemConstant.HOME;
        } else if (isAdmin(roles)) {
            url = SystemConstant.ADMIN_HOME;
        }
        return url;
    }

    private boolean isAdmin(List<String> roles) {
        return roles.contains(SystemConstant.STAFF_ROLE) || roles.contains(SystemConstant.MANAGER_ROLE);
    }

    private boolean isUser(List<String> roles) {
        return roles.contains(SystemConstant.USER_ROLE);
    }
}
