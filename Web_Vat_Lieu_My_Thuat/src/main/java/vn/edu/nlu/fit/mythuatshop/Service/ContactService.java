package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.ContactDao;
import vn.edu.nlu.fit.mythuatshop.Model.Contact;
import vn.edu.nlu.fit.mythuatshop.Util.EmailUtil;

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

    public boolean deleteContact(int id) {
        return contactDao.deleteById(id);
    }

    public boolean replyContact(int contactId, String subject, String replyMessage) {
        Contact c = contactDao.findById(contactId);
        if (c == null || c.getEmail() == null || c.getEmail().isBlank()) return false;

        // gửi mail
        EmailUtil.sendHtml(c.getEmail(), subject, replyMessage);

        // cập nhật trạng thái
        return contactDao.updateStatus(contactId, "Đã phản hồi");
    }

}
