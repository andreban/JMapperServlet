/*
 * JPEGMapper.java
 *
 * Created on March 4, 2006, 4:10 PM
 */

package com.bandarra.jmapper.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.imageio.*;

/**
 *
 * @author andreban
 * @version
 */
public class JPEGMapper extends HttpServlet {

    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {        

        HttpSession session = request.getSession(false);
        if (session != null){ 
            String type = request.getParameter("type");
            SessionData sessionData = (SessionData) session.getAttribute("sessiondata");            
            if (type != null && type.equals("jpeg")){                
                response.setContentType("image/jpeg");  
                ByteArrayOutputStream bout = new ByteArrayOutputStream();                
                ImageIO.write(sessionData.mapImage,"jpeg",bout);     
                response.setContentLength(bout.size());
                response.getOutputStream().write(bout.toByteArray());
/*                JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(response.getOutputStream());
                JPEGEncodeParam jep = JPEGCodec.getDefaultJPEGEncodeParam(sessionData.mapImage);
                jep.setQuality(1.0f,false);
                encoder.encode(sessionData.mapImage,jep);*/
            } else {//fazer png
                response.setContentType("image/png");  
                ByteArrayOutputStream bout = new ByteArrayOutputStream();                
                ImageIO.write(sessionData.mapImage,"png",bout);      
                response.setContentLength(bout.size());
                response.getOutputStream().write(bout.toByteArray());                
            }
        } else {
            response.sendError(response.SC_NOT_ACCEPTABLE);          
        }
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
