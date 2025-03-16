package SportFlow.Model;

import java.sql.Time;
import java.sql.Date;

public class Seance {
    int member;
    int coatch;
    Date date;
    Time heure;

    public Seance(int member, int coatch, Date date, Time heure) {
        this.member = member;
        this.coatch = coatch;
        this.date = date;
        this.heure = heure;
    }

    public int getMember() {
        return member;
    }

    public void setMember(int member) {
        this.member = member;
    }

    public int getCoatch() {
        return coatch;
    }

    public void setCoatch(int coatch) {
        this.coatch = coatch;
    }

    public java.sql.Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getHeure() {
        return heure;
    }

    public void setHeure(Time heure) {
        this.heure = heure;
    }

    @Override
    public String toString() {
        return "Seance{" +
                "member=" + member +
                ", coatch=" + coatch +
                ", date=" + date +
                ", heure=" + heure +
                '}';
    }
}
