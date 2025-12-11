package vn.edu.nlu.fit.mythuatshop.Dao;

public interface DaoInterface <T> {
    public int insert(T t);

    public int update(T t);

    public int delete(T id);
    public T findByName(String name);
}
