package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.nlu.fit.mythuatshop.Model.Contact;

import java.util.List;

public class ContactDao {
    final Jdbi jdbi ;

    public ContactDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }
    public List<Contact> findAll() {
        String sql = "SELECT id,userID,fullName,email,phoneNumber,message,status,createAt FROM contacts ";
        return jdbi.withHandle(h -> h.createQuery(sql).mapToBean(Contact.class).list());
    }
    public void insert(Contact contact) {
        String sql = "INSERT INTO contacts(userID,fullName,email,phoneNumber,message) "
        + "VALUES (:userId,:fullName,:email,:phoneNumber,:message)";
        jdbi.useHandle(handle -> handle.createUpdate(sql).bindBean(contact).execute());
    }
}
