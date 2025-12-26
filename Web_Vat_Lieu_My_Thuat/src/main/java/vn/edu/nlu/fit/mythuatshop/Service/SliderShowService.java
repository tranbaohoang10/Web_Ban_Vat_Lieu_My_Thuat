package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.SliderShowDao;
import vn.edu.nlu.fit.mythuatshop.Model.SliderShow;

import java.util.List;
import java.util.Optional;

public class SliderShowService {
    private final SliderShowDao sliderShowDao;

    public SliderShowService() {
        this.sliderShowDao = new SliderShowDao();
    }

    // ===== FRONTEND =====
    public List<SliderShow> getSliderShow() {
        return sliderShowDao.getSliderShowAll();
    }

    // ===== ADMIN: list/search/paging =====
    public int countByKeyword(String keyword) {
        return sliderShowDao.countByKeyword(keyword);
    }

    public List<SliderShow> findPageByKeyword(String keyword, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return sliderShowDao.findPageByKeyword(keyword, offset, pageSize);
    }

    // ===== ADMIN: detail =====
    public Optional<SliderShow> findById(int id) {
        return sliderShowDao.findById(id);
    }

    // ===== ADMIN: validate =====
    public boolean existsIndexOrder(int indexOrder, Integer excludeId) {
        return sliderShowDao.existsIndexOrder(indexOrder, excludeId);
    }

    // ===== ADMIN: CRUD =====
    public int create(SliderShow s) {
        return sliderShowDao.insert(s);
    }

    public boolean update(SliderShow s) {
        return sliderShowDao.update(s) > 0;
    }

    public boolean delete(int id) {
        return sliderShowDao.delete(id) > 0;
    }

    // ===== ADMIN: toggle status =====
    public boolean toggleStatus(int id, int currentStatus) {
        int newStatus = (currentStatus == 1) ? 0 : 1;
        return sliderShowDao.updateStatus(id, newStatus) > 0;
    }
}
