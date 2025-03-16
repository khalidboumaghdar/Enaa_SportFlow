package SportFlow.Security;

import SportFlow.Model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebFilter({"/Seance.jsp", "/Seance"})
public class SeanceFilter implements Filter  {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        HttpSession session = request.getSession(false);

        // Check if session exists and is not null
        if (session != null) {
            // Retrieve the user object from the session
            User user = (User) session.getAttribute("user");

            // Check if user is logged in and role is "Membres"
            String role = (String) session.getAttribute("role");
            System.out.println(role);

            if ("Membres".equals(role)) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                // Forward to the 404 page if the user doesn't have the correct role
                RequestDispatcher dispatcher = request.getRequestDispatcher("404.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            // Handle the case where there is no session (session expired or user not logged in)
            RequestDispatcher dispatcher = request.getRequestDispatcher("404.jsp");
            dispatcher.forward(request, response);
        }
    }
}

