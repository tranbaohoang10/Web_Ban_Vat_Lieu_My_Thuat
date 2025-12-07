package vn.edu.nlu.fit.mythuatshop.Service;

import vn.edu.nlu.fit.mythuatshop.Dao.SliderShowDao;
import vn.edu.nlu.fit.mythuatshop.Model.SliderShow;

import java.util.List;

public class SliderShowService {
    private final SliderShowDao sliderShowDao;

    public SliderShowService() {
        this.sliderShowDao = new SliderShowDao();
    }
    public List<SliderShow> getSliderShow() {
        return sliderShowDao.getSliderShowAll();
    }
}
