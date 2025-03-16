package SportFlow.Model;

public class Member extends User{
    String Sport;
    int Age;

    public Member(String nom, String prenom, String email, String sport, int age) {
        super(nom, prenom, email);
        Sport = sport;
        Age = age;
    }

    public Member(int id, String sport, int age) {
        super(id);
        Sport = sport;
        Age = age;
    }

    public Member(int id, String nom, String email, String password, String role) {
        super(id, nom, email, password, role);
    }

    public Member(int id, String nom, String email, String sport, int age) {
        super(id, nom, email);
        Sport = sport;
        Age = age;
    }


    public Member(String email, String password) {
        super(email, password);
    }

    public Member() {}
    public Member(String nom, String email, String password) {
        super(nom, email, password);
    }

    public String getSport() {
        return Sport;
    }

    public void setSport(String sport) {
        Sport = sport;
    }

    public int getAge() {
        return Age;
    }

    public void setAge(int age) {
        Age = age;
    }

    @Override
    public String toString() {
        return "Member{" +
                "Sport='" + Sport + '\'' +
                ", Age=" + Age +super.toString()+
                '}';
    }
}
