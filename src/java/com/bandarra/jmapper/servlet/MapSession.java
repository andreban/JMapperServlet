/*
 * CreateSession.java
 *
 * Created on 9 de Mar�o de 2006, 15:36
 */

package com.bandarra.jmapper.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 *
 * @author andre.bandarra
 * @version
 */
public class MapSession extends HttpServlet {
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        synchronized(session){            
            String command = request.getParameter("command");
            if (command.equals("new")){
                String mapDirectory = getServletContext().getInitParameter("map_directory");
                String tabDirectory = getServletContext().getInitParameter("tab_directory");
                String mapName = mapDirectory+request.getParameter("map_name");                 
                String tabName = tabDirectory+request.getParameter("tab_name");
                SessionData sessionData = null;
                if (request.getParameter("map_width") != null &&
                        request.getParameter("map_height") != null) {
                    try{
                        int w = Integer.parseInt(request.getParameter("map_width"));
                        int h = Integer.parseInt(request.getParameter("map_height"));                    
                        sessionData = new SessionData(tabName,mapName,w,h); 
                    } catch (Exception e){
                        sessionData =new SessionData(tabName,mapName);                     
                    }
                } else {
                    sessionData =new SessionData(tabName,mapName);                     
                }
                if (request.getParameter("draw_ranges") != null &&
                        request.getParameter("draw_ranges").equals("false")){
                    sessionData.setDrawRanges(false);                    
                }                
                session.setAttribute("sessiondata",sessionData);            
            } else if (command.equals("numclasses")){
                int numClasses = 10;
                try{
                    numClasses = Integer.parseInt(request.getParameter("value"));
                } catch (NumberFormatException pe){
                    // TODO Log Error Here!!!;
                }
                SessionData sd = (SessionData) session.getAttribute("sessiondata");
                sd.setNumeroClasses(numClasses);                
            } else if (command.equals("coluna")){
                SessionData sd = (SessionData) session.getAttribute("sessiondata");
                sd.setColunaMapa(request.getParameter("value"));
            } else if (command.equals("zoom")){
                SessionData sd = (SessionData)session.getAttribute("sessiondata");
                sd.zoomIn();
            } else if (command.equals("reset")){
                SessionData sd = (SessionData)session.getAttribute("sessiondata");
                sd.reset();
            } else if (command.equals("paneast")){
                SessionData sd = (SessionData)session.getAttribute("sessiondata");
                sd.panEast();
            } else if (command.equals("panwest")){
                SessionData sd = (SessionData)session.getAttribute("sessiondata");
                sd.panWest();
            } else if (command.equals("pannorth")){
                SessionData sd = (SessionData)session.getAttribute("sessiondata");
                sd.panNorth();
            } else if (command.equals("pansouth")){
                SessionData sd = (SessionData)session.getAttribute("sessiondata");
                sd.panSouth();
            } else if (command.equals("paleta")){
                SessionData sd = (SessionData)session.getAttribute("sessiondata");
                sd.setPaleta(request.getParameter("value"));
            }  
        }

        getServletContext().getRequestDispatcher("/viewmap.jsp").forward(request,response);        
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
