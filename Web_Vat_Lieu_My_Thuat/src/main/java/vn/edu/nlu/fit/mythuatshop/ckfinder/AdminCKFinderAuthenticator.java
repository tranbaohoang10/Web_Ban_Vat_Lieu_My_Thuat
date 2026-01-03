package vn.edu.nlu.fit.mythuatshop.ckfinder;

import com.cksource.ckfinder.authentication.Authenticator;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import vn.edu.nlu.fit.mythuatshop.Model.Users;

@Component
public class AdminCKFinderAuthenticator implements Authenticator {

    @Override
    public boolean authenticate() {
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (attrs == null) return false;

        HttpServletRequest req = attrs.getRequest();
        HttpSession session = req.getSession(false);
        if (session == null) return false;

        Object obj = session.getAttribute("currentUser");
        if (!(obj instanceof Users)) return false;

        Users u = (Users) obj;
        return u.getRole() != null && u.getRole().equalsIgnoreCase("ADMIN");
    }
}
