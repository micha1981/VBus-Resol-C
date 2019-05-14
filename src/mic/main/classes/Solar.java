package mic.main.classes;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Solar
 */
@WebServlet("/Solar")
public class Solar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Solar() {
		super();

	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		EntityManagerFactory emf = Persistence.createEntityManagerFactory("xxx");
		EntityManager em = emf.createEntityManager();
		Query q = em.createQuery("SELECT s FROM SolarDB s ORDER BY s.id DESC").setMaxResults(1440);

		List<SolarDB> db = new ArrayList<SolarDB>();
		db = q.getResultList();
		
		
		
		request.setAttribute("sollar", db);
		



		

		RequestDispatcher rq = request.getRequestDispatcher("solar.jsp");

		rq.include(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
