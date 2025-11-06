package model;

import java.net.URL;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class ShainDAO {

    private EntityManagerFactory emf;

    public ShainDAO() {
        // persistence.xml がどこからロードされているか確認
        URL resource = Thread.currentThread()
            .getContextClassLoader()
            .getResource("META-INF/persistence.xml");
        System.out.println(">>> persistence.xml loaded from: " + resource);

        emf = Persistence.createEntityManagerFactory("IH13AXX_JV31_29_05_PU");
    }

    /**
     * 全件検索
     * @return 社員データ
     */
    public List<Shain> findAll() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT s FROM Shain s", Shain.class).getResultList();
        } finally {
            em.close();
        }
    }
}
