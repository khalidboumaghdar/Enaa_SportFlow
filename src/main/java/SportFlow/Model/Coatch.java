package SportFlow.Model;

public class Coatch extends User{
    String specialisation;

    public Coatch(String nom, String prenom, String email, String specialisation) {
        super(nom, prenom, email);
        this.specialisation = specialisation;
    }
    public Coatch(int id ,String nom,String specialisation) {
        super(id, nom);
        this.specialisation = specialisation;
    }

    public String getSpecialisation() {
        return specialisation;
    }

    public void setSpecialisation(String specialisation) {
        this.specialisation = specialisation;
    }

    @Override
    public String toString() {
        return "Coatch{" +super.toString() + ", specialisation='" + specialisation + '\'' + '}';

    }
}
