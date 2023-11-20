package com.web.accompany.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.web.accompany.model.dto.AccompanyDTO;
import com.web.accompany.service.AccompanyServiceKH;

/**
 * Servlet implementation class AccompanyCoordinateServlet
 */
@WebServlet("/accompany/accompanycoordinatelist.do")
public class AccompanyCoordinateListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccompanyCoordinateListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String coordinate=request.getParameter("coordinate");
		List<AccompanyDTO> accompanys=new AccompanyServiceKH().selectAccompanyByCoordinate(coordinate);
		request.setAttribute("accompanys", accompanys);
		request.setAttribute("coordinate", coordinate);
		request.getRequestDispatcher("/views/accompany/accompanycoordinatelist.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
