package SportFlow.DAO;

import SportFlow.Database.DBConnection;
import SportFlow.Model.Coatch;
import SportFlow.Model.Member;
import SportFlow.Model.Seance;
import SportFlow.Model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static SportFlow.Database.DBConnection.getConnection;

public class Dao {
        private static final String Insert_User = "insert into User(nom,email,password) values(?,?,?)";
        private static final String SELECT_LOGIN = "SELECT nom,email,password,role FROM User WHERE email = ? AND password = ?";
        private static final String INSERT_SEANCE="Insert into Seance(date,heur,id_member,id_Coache) values(?,?,?,?) ";
        private static final String INSERT_MEMBER="Insert into Members(user_id,sport,Age) values(?,?,?) ";
        private static final String Select_all_Coache = "Select User.id,User.nom,Coache.specialite from User inner join Coache on Coache.user_id=User.id;";
        private static final String SELECT_ALL_MEMBERS="select * from User inner join Members on Members.user_id=User.id";
        private static final String SELECT_All_User = "select * from User ";
        private static final String SELECT_Count_Statistic = "select count(Members.id) AS TOTALCount from User inner join Members on Members.user_id=User.id";
        private static final String DELETE_Members="delete from Members where user_id=?";

        public void InsertUser(User user) {

                try (Connection connection = getConnection();
                     PreparedStatement preparedStatement = connection.prepareStatement(Insert_User, Statement.RETURN_GENERATED_KEYS)) {

                        preparedStatement.setString(1, user.getNom());
                        preparedStatement.setString(2, user.getEmail());
                        preparedStatement.setString(3, user.getPassword());

                        int affectedRows = preparedStatement.executeUpdate();

                        if (affectedRows > 0) {
                                ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
                                if (generatedKeys.next()) {
                                        user.setId(generatedKeys.getInt(1));
                                }
                                System.out.println(user.getId());
                        }

                } catch (SQLException e) {
                        System.err.println("Error inserting user: " + e.getMessage());
                }
        }
        public int SelectMemberCount() {
                int count = 0;

                try (Connection connection = getConnection();
                     PreparedStatement preparedStatement = connection.prepareStatement(SELECT_Count_Statistic);
                     ResultSet rs = preparedStatement.executeQuery()) {

                        if (rs.next()) {
                                count = rs.getInt("TOTALCount");
                        }

                } catch (SQLException e) {
                        e.printStackTrace();
                }

                return count;
        }
        public List<Coatch> SelectAllCoache() {
                List<Coatch> coatches = new ArrayList<>();
                try (Connection connection = getConnection();
                     PreparedStatement preparedStatement = connection.prepareStatement(Select_all_Coache);
                     ResultSet rs = preparedStatement.executeQuery()) {
                        while (rs.next()) {
                                int id = rs.getInt("id");
                                String nom = rs.getString("nom");
                                String specialite = rs.getString("specialite");
                                coatches.add(new Coatch(id,nom,specialite));

                        }
                } catch (SQLException e) {
                        e.printStackTrace();
                }
                System.out.println(coatches);

                return coatches;
        }
        public List<Member> SelectAllMembers() {
                List<Member> members = new ArrayList<>();
                try (Connection connection = getConnection();
                     PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MEMBERS);
                     ResultSet rs = preparedStatement.executeQuery()) {
                        while (rs.next()) {
                                int id = rs.getInt("id");
                                String nom = rs.getString("nom");
                                String email = rs.getString("email");
                                String sport = rs.getString("sport");
                                int age = rs.getInt("age");
                                members.add(new Member(id,nom,email,sport,age));


                        }
                } catch (SQLException e) {
                        e.printStackTrace();
                }
                System.out.println(members);

                return members;
        }
        public boolean deleteMembers(int id) {
                boolean rowDeleted = false;

                try (Connection connection = getConnection();
                     PreparedStatement preparedStatement = connection.prepareStatement(DELETE_Members)) {

                        System.out.println("Deleting member with ID: " + id); // Debugging

                        preparedStatement.setInt(1, id);

                        int rowsAffected = preparedStatement.executeUpdate();
                        System.out.println("Rows affected: " + rowsAffected); // Debugging

                        rowDeleted = rowsAffected > 0;

                } catch (SQLException e) {
                        e.printStackTrace();
                }

                return rowDeleted;
        }

        public List<User> SelectAllUsers() {
                List<User> users = new ArrayList<>();
                try (Connection connection = getConnection();
                     PreparedStatement preparedStatement = connection.prepareStatement(SELECT_All_User);
                     ResultSet rs = preparedStatement.executeQuery()) {

                        while (rs.next()) {
                                int id = rs.getInt("id");
                                String nom = rs.getString("nom");
                                String email = rs.getString("email");
                                String password = rs.getString("password");
                                String role = rs.getString("role");

                                User user = new Member(id, nom, email, password, role);
                                users.add(user);
                        }
                } catch (SQLException e) {
                        e.printStackTrace();
                }

                System.out.println(users);

                return users;
        }



        public static void insertSeance(Seance seance) throws SQLException {
                try (Connection connection =getConnection();
                     PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SEANCE)) {

                        preparedStatement.setDate(1, seance.getDate());
                        preparedStatement.setTime(2, seance.getHeure());
                        preparedStatement.setInt(3, seance.getMember());
                        preparedStatement.setInt(4, seance.getCoatch());

                        preparedStatement.executeUpdate();
                }
        }
        public static void insertMembers(Member member) throws SQLException {
                try (Connection connection =getConnection();
                     PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MEMBER)) {

                        preparedStatement.setInt(1, member.getId());
                        preparedStatement.setString(2, member.getSport());
                        preparedStatement.setInt(3, member.getAge());

                        preparedStatement.executeUpdate();
                }
        }
        public User checkLogin(User user) {
                User loggedInUser = null;

                try (Connection connection = getConnection();
                     PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LOGIN)) {

                        preparedStatement.setString(1, user.getEmail());
                        preparedStatement.setString(2, user.getPassword());

                        System.out.println("Executing Query: " + preparedStatement.toString());

                        try (ResultSet rs = preparedStatement.executeQuery()) {
                                if (rs.next()) {
                                        System.out.println("User Found: " + rs.getString("email"));

                                        loggedInUser = new Member(
                                                rs.getString("email"),
                                                rs.getString("password")
                                        );
                                        loggedInUser.setNom(rs.getString("nom"));
                                        loggedInUser.setRole(rs.getString("role"));
                                } else {
                                        System.out.println("No user found with given credentials.");
                                }
                        }
                } catch (SQLException e) {
                        e.printStackTrace();
                }

                return loggedInUser;
        }



}
