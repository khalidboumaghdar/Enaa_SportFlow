package SportFlow.Model;

public abstract class User {
    private int id;
    private String nom;
    private String email;
    private String password;
    private String role;

    public User(int id, String nom, String email, String password, String role) {
        this.id = id;
        this.nom = nom;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public User(int id) {
        this.id = id;
    }

    public User(int id, String nom, String email) {
        this.id = id;
        this.nom = nom;
        this.email = email;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public User(String nom) {
        this.nom = nom;
    }

    public User(){}

    public User(int id, String nom, String email, String password) {
        this.id = id;
        this.nom = nom;
        this.email = email;
        this.password = password;
    }

    public User(String nom, String email, String password) {
        this.nom = nom;
        this.email = email;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", role='" + role + '\'' +
                '}';
    }
}
