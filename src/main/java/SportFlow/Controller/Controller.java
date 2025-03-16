package SportFlow.Controller;

import SportFlow.DAO.Dao;
import SportFlow.Model.Coatch;
import SportFlow.Model.Member;
import SportFlow.Model.Seance;
import SportFlow.Model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;

@WebServlet("/")
public class Controller extends HttpServlet {
    public Dao dao;
    public void init() {
        dao = new Dao();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
       try {
           switch (action) {
               case "/Register":
                   Register(request, response);
                   break;
                   case "/AddMember":
                       AddMembers(request, response);
                       break;
                       case "/Entrineur":
                           Entrineur(request, response);
                           break;
                   case "/Member":
                       Members(request, response);
                       break;
                   case "/Login":
                       CheckLogin(request, response);
                       break;
               case "/ADDSEANCE":
                   AddSeance(request, response);
                   break;
                   case "/delete":
                       deleteMemmbers(request, response);
                       break;
               default:
                   SportFlow(request,response);
                   break;
           }
       }catch (Exception e) {
           e.printStackTrace();
       }
    }
    private void SportFlow(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Coatch> coatchList = dao.SelectAllCoache();
        request.setAttribute("coatchList", coatchList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("SportFlow.jsp");

        dispatcher.forward(request, response);

    }
    public void Entrineur(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("Entraineur.jsp");
        dispatcher.forward(request, response);

    }
    public void Members(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ServletException {
        List<Member> memberList = dao.SelectAllMembers();
        List<User> userList = dao.SelectAllUsers();
        int totalMembers = dao.SelectMemberCount();
        request.setAttribute("memberList", memberList);
        request.setAttribute("totalMembers", totalMembers);
        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Member.jsp");
        dispatcher.forward(request, response);
    }
    private void Register(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String pass = request.getParameter("motpass");
User user = new Member(nom, email, pass);
dao.InsertUser(user);
response.sendRedirect("./");

    }
    private void deleteMemmbers(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteMembers(id);
        response.sendRedirect("./Member");

    }
    public void AddMembers(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException {
        int id_user = Integer.parseInt(request.getParameter("id_user"));
        String sport = request.getParameter("sport");
        int age = Integer.parseInt(request.getParameter("age"));
        Member member = new Member(id_user, sport, age);
        dao.insertMembers(member);
        response.sendRedirect("./Member");
    }
    public void AddSeance(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("Connection.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        int id_member = user.getId();
        if(id_member == 0){
            System.out.println("id_member: " + id_member);
        }




        int entrineur = Integer.parseInt(request.getParameter("entrineur"));
        Date date = Date.valueOf(request.getParameter("date"));

        String heurString = request.getParameter("heur");

        if (!isValidTimeFormat(heurString)) {
            response.sendRedirect("ErrorPage.jsp");
            return;
        }

        Time heur = Time.valueOf(heurString);

        Seance seance = new Seance(id_member, entrineur, date, heur);
        dao.insertSeance(seance);

        response.sendRedirect("./");
    }

    private boolean isValidTimeFormat(String time) {
        String regex = "^([01]?[0-9]|2[0-3]):([0-5]?[0-9]):([0-5]?[0-9])$";
        return time.matches(regex);
    }






    private void CheckLogin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String email = request.getParameter("email");
        String motpass = request.getParameter("motpass");

        System.out.println("Login Attempt: Email = " + email + ", Password = " + motpass);

        User user = new Member(email, motpass);
        User loggedInUser = dao.checkLogin(user);

        if (loggedInUser != null) {
            System.out.println("Login Successful: " + loggedInUser.getEmail());
            HttpSession session = request.getSession();
            session.setAttribute("user", loggedInUser);
            response.sendRedirect("./");
        } else {
            System.out.println("Login Failed! Redirecting to Register.");
            response.sendRedirect("/Erorr");
        }
    }


}
