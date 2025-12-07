package vn.edu.nlu.fit.mythuatshop.Dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.nlu.fit.mythuatshop.Model.SliderShow;

import java.util.List;

public class SliderShowDao {
    public final Jdbi jdbi;
    public SliderShowDao() {
        this.jdbi = JDBIConnector.getJdbi();
    }
    public List<SliderShow> getSliderShowAll(){
        String sql = "SELECT id, title, thumbnail, status, indexOrder, linkTo " +
                "FROM slidershows WHERE status = 1 "+
                "ORDER BY indexOrder;";

        return jdbi.withHandle(handle ->handle.createQuery(sql).mapToBean(SliderShow.class).list()) ;
    }
}
