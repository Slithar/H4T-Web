/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Logica.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author usuario
 */
public class InformacionPromocionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        String nombrePromocion = request.getParameter("nombrePromocion");
        String nickProveedor = request.getParameter("nickProveedor");
        IControladorPromociones icprom = new ControladorPromociones();
        IControladorProveedores icprov = new ControladorProveedores();
        DataPromocion dp = icprom.getDataPromocion(nombrePromocion, nickProveedor);
        String[] datosPromocion = new String[6];
        datosPromocion[0] = nombrePromocion;
        datosPromocion[1] = nickProveedor;
        datosPromocion[2] = icprov.getNombreEmpresa(nickProveedor).getNombreEmpresa();
        datosPromocion[3] = String.valueOf(dp.getDescuento());
        datosPromocion[4] = String.valueOf(dp.getPrecio());
        ArrayList<DataImagen> imagenes = icprov.getImagenesProv(nickProveedor);
        if(imagenes.size() == 0){
            BufferedImage bffrimg = icprov.copiarImagenesServicio(System.getProperty("user.home") + "\\Documents\\NetBeansProjects\\help4traveling\\Nuevo\\src\\Logica\\perfiles\\perfil.png");
            String homeUsuario = System.getProperty("user.home") + "\\Documents\\NetBeansProjects\\H4T-Web\\web\\perfiles\\" + nickProveedor + "-1.jpg";
            File fichero = new File(homeUsuario);
            ImageIO.write(bffrimg, "jpg", fichero);
        }
        for(int j = 0; j < imagenes.size(); j++){
            BufferedImage bffrimg = icprov.copiarImagenesServicio(System.getProperty("user.home") + "\\Documents\\NetBeansProjects\\help4traveling\\Nuevo\\" + imagenes.get(j).getPath());
            int nro = j + 1;
            String homeUsuario = System.getProperty("user.home") + "\\Documents\\NetBeansProjects\\H4T-Web\\web\\perfiles\\" + nickProveedor + "-" + nro + ".jpg";
            File fichero = new File(homeUsuario);
            ImageIO.write(bffrimg, "jpg", fichero);
        }
        ArrayList<DataServicio> serviciosDePromocion = icprom.getServiciosPromocion(nombrePromocion, nickProveedor);
        datosPromocion[5] = "";
        for(int i = 0; i < serviciosDePromocion.size(); i++){
            datosPromocion[5] = datosPromocion[5] + serviciosDePromocion.get(i).getNombreServicio() + ";";
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("informacionPromocion", datosPromocion);
        response.sendRedirect("verInformacionPromocion.jsp");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(InformacionPromocionServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InformacionPromocionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(InformacionPromocionServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InformacionPromocionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
