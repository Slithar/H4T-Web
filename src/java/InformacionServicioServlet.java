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
public class InformacionServicioServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        String categoriaActual = (String) session.getAttribute("categoriaActual");
        String nombreServicio = request.getParameter("nombre");
        String nickProveedor = request.getParameter("nickProveedor");
        IControladorProveedores icprov = new ControladorProveedores();
        DataServicio ds = icprov.getDatosServicio(nombreServicio, nickProveedor);
        String[] datosServicio = new String[10];
        datosServicio[0] = nombreServicio;
        datosServicio[1] = ds.getDescripcionServicio();
        datosServicio[2] = nickProveedor;
        datosServicio[3] = icprov.getNombreEmpresa(nickProveedor).getNombreEmpresa();
        DataCiudad ciudadOrigen = icprov.getCiudadOrigen(nombreServicio, nickProveedor);
        datosServicio[4] = ciudadOrigen.getNombre() + ", " + ciudadOrigen.getPais();
        DataCiudad ciudadDestino = icprov.getCiudadDestino(nombreServicio, nickProveedor);
        if(ciudadDestino.getNombre().equals("No"))
            datosServicio[5] = "No corresponde";
        else
            datosServicio[5] = ciudadDestino.getNombre() + ", " + ciudadDestino.getPais();
        ArrayList<String> imagenes = icprov.rutaImagenesServicios(nombreServicio, nickProveedor);
        for(int i = 0; i < imagenes.size(); i++){
            datosServicio[6] = datosServicio[6] + imagenes.get(i) + ";";
            BufferedImage img = icprov.copiarImagenesServicio(imagenes.get(i));
            int nro = i + 1;
            String homeUsuario = System.getProperty("user.home") + "\\Documents\\NetBeansProjects\\H4T-Web\\web\\servicios\\" + nombreServicio + "-" + nickProveedor + "-" + nro + ".jpg";
            File fichero = new File(homeUsuario);
            ImageIO.write(img, "jpg", fichero);
        }
        boolean rutaEncontrada = false;
        ArrayList<DataCategoria> categorias = icprov.getCategorias(nombreServicio, nickProveedor);
        datosServicio[7] = "";
        for(int i = 0; i < categorias.size(); i++){
            datosServicio[7] = datosServicio[7] + categorias.get(i).getNombre() + ";";
            if(categorias.get(i).getNombre().equals(categoriaActual)){
                datosServicio[8] = categorias.get(i).getRutaCategoria();
                rutaEncontrada = true;
            }
        }
        
        if(!rutaEncontrada){
            datosServicio[8] = categorias.get(0).getRutaCategoria();
        }
        datosServicio[9] = String.valueOf(ds.getPrecioServicio());
        session.setAttribute("informacionServicio", datosServicio);
        response.sendRedirect("verInformacionServicio.jsp");
        
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
            Logger.getLogger(InformacionServicioServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InformacionServicioServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(InformacionServicioServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InformacionServicioServlet.class.getName()).log(Level.SEVERE, null, ex);
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
