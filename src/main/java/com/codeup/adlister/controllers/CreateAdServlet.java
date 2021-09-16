package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.AdForm;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        creates a blank ad
        AdForm blankAd = new AdForm();
        HttpSession session = request.getSession();

//        sets ad
        if(session.getAttribute("ad") == null){
            session.setAttribute("ad", blankAd);
        }else{
            AdForm ad = (AdForm) session.getAttribute("ad");
            request.setAttribute("ad", ad);
        }


        if (session.getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        if(request.getParameter("error") != null){
            request.setAttribute("wasAnError", "error");
        }

        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        boolean inputHasErrors = title.isEmpty()
                || description.isEmpty();


        if(inputHasErrors){
            AdForm ad = new AdForm(title, description);
            request.getSession().setAttribute("ad", ad);
            response.sendRedirect("/ads/create?error=error");
            return;
        }

        User user = (User) request.getSession().getAttribute("user");
        Ad ad = new Ad(
            user.getId(),
            request.getParameter("title"),
            request.getParameter("description")
        );
        DaoFactory.getAdsDao().insert(ad);
        response.sendRedirect("/ads");
    }
}
