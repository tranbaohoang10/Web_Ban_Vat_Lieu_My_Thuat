package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.ContactDao;
import vn.edu.nlu.fit.mythuatshop.Model.Contact;

import java.util.List;

public class ContactService {
    private ContactDao contactDao;

    public ContactService() {
        this.contactDao = new ContactDao();
    }
    public List<Contact> getAllContacts() {
        return contactDao.findAll();
    }
    public void addContact(Contact contact) {
        contactDao.insert(contact);
    }
}
