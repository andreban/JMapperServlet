/*
 * SessionData.java
 *
 * Created on 9 de Marco de 2006, 15:30
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.bandarra.jmapper.servlet;
import com.bandarra.jmapper.*;
import java.awt.image.BufferedImage;
import java.net.URL;
import java.net.URLConnection;
import org.bandarra.tabulacao.*;
import org.bandarra.map.*;
import org.bandarra.jmapper.*;
import java.util.*;
import java.io.*;
import java.awt.*;
/**
 *
 * @author andre.bandarra
 */
public class SessionData {
    private Data mapData;
    private MapDrawer mapDrawer;
    private String tabName;
    private String mapName;
    private TabData tabData;
    private TabDataColorChooser tabDataColorChooser;
    private RangesDrawer rangesDrawer;
    BufferedImage mapImage;
    private static TreeMap tmNomeMap = new TreeMap();
    private boolean drawRanges = true;
    private int mapWidth = 320;
    private int mapHeight = 200;
    
    public TabData getTabData(){
        return tabData;
    }
    private Data getMapData(String nomeMapa) throws IOException{
        Data mapData = (Data)tmNomeMap.get(nomeMapa);
        if (mapData != null){
            return mapData;
        }
        URL url = new URL(nomeMapa);
        URLConnection urlc = url.openConnection();
        mapData = new MapFileReader(new DataInputStream(
                urlc.getInputStream())).getData();
        tmNomeMap.put(nomeMapa,mapData);
        return mapData;
    }  
    public void setDrawRanges(boolean b){
        drawRanges = b;
        if (drawRanges){
            mapDrawer.setSize((int)(mapWidth*0.75f),mapHeight);
        } else {
            mapDrawer.setSize(mapWidth,mapHeight);                
        }            
        drawMap();
    }
    private void drawMap(){
        mapImage = new BufferedImage(mapWidth,mapHeight,BufferedImage.TYPE_INT_RGB);        
        Graphics g = mapImage.createGraphics();
        g.setColor(Color.WHITE);
        g.fillRect(0,0,mapWidth,mapHeight);
        mapDrawer.drawMap(g);
        if (drawRanges){
            rangesDrawer.draw(g);                       
        }
    }
    public void setSize(int width, int height){
        mapDrawer.setSize(mapWidth, mapHeight);
        drawMap();
    }
    public void setColunaMapa(String nomeColuna){
        if (tabData != null){            
            for (int i=0; i < tabData.getNomeColunas().length; i++){
                if (tabData.getNomeColunas()[i].equals(nomeColuna)){
                    setColunaMapa(i);
                    break;
                }
            }
        }
    }
    public int getColunaMapa(){
        return tabDataColorChooser.getIdxColunaMapa();
    }
    public void setColunaMapa(int colunaMapa){
        if (tabDataColorChooser != null) {
            if (tabData != null && colunaMapa >= 0 && 
                    colunaMapa <tabData.getNomeColunas().length ){
                tabDataColorChooser.setIdxColunaMapa(colunaMapa);
                drawMap();
            }
        }
    }
    public void setNumeroClasses(int numeroClasses){
        if (tabDataColorChooser != null && numeroClasses > 1 && numeroClasses < 11 ){
            tabDataColorChooser.setNumeroClasses(numeroClasses);
            drawMap();
        }
    }
    public SessionData(String tabName, String mapName, int width, int height) throws IOException {
        this.mapWidth  = width;
        this.mapHeight = height;
        mapDrawer = new SimpleMapDrawer();
        URL url = new URL(tabName);
        URLConnection urlc = url.openConnection();
        tabData = new TabWinReader(new BufferedReader(new InputStreamReader(
                urlc.getInputStream(),"ISO-8859-1"))).getTabData();                        
        tabDataColorChooser = new TabDataColorChooser(tabData);
        tabDataColorChooser.setNumeroClasses(10);
        tabDataColorChooser.setIdxColunaMapa(0);        
        mapDrawer.setMapData(getMapData(mapName));        
        mapDrawer.setColorChooser(tabDataColorChooser);                   
        rangesDrawer = new RangesDrawer(tabDataColorChooser);

        int a = (int)(mapWidth * 0.75f);
        mapDrawer.setSize(a,mapHeight);                                
        rangesDrawer.setSize(new Rectangle(a,0,mapWidth-a,mapHeight));        
        drawMap();        
    }
    
    /** Creates a new instance of SessionData */
    public SessionData(String tabName, String mapName) throws IOException {
        this(tabName, mapName,640,480);
    }
    public void reset(){
        mapDrawer.reset();
        drawMap();
    }
    public void zoomIn(){
        Rectangle rect = new Rectangle(mapDrawer.getWidth()/4,
                mapDrawer.getHeight()/4,
                mapDrawer.getWidth()-mapDrawer.getWidth()/2,
                mapDrawer.getHeight()-mapDrawer.getHeight()/2);
        mapDrawer.zoom(rect);
        drawMap();
    }
    public void panWest(){
        mapDrawer.pan(mapDrawer.getWidth()/4,0);
        drawMap();        
    }
    public void panEast(){
        mapDrawer.pan(mapDrawer.getWidth()/4*-1,0);        
        drawMap();        
    }
    public void panNorth(){
        mapDrawer.pan(0,mapDrawer.getHeight()/4);                
        drawMap();        
    }
    public void panSouth(){
        mapDrawer.pan(0,mapDrawer.getHeight()/4*-1);                        
        drawMap();        
    }

    public void setPaleta(String nomePaleta){
        if (nomePaleta != null){
            if (nomePaleta.equals("Verde Roxo 1")){
                tabDataColorChooser.setPaleta(Paletas.Cores.VERDE_ROXO_1.getCores());                
            } else if (nomePaleta.equals("Verde Roxo 2")){
                tabDataColorChooser.setPaleta(Paletas.Cores.VERDE_ROXO_2.getCores());                
            } else if (nomePaleta.equals("Amarela 1")){
                tabDataColorChooser.setPaleta(Paletas.Cores.AMARELA_1.getCores());                
            } else if (nomePaleta.equals("Amarela 2")){
                tabDataColorChooser.setPaleta(Paletas.Cores.AMARELA_2.getCores());                
            } else if (nomePaleta.equals("Azul 1")){
                tabDataColorChooser.setPaleta(Paletas.Cores.AZUL_1.getCores());                
            } else if (nomePaleta.equals("Azul 2")){
                tabDataColorChooser.setPaleta(Paletas.Cores.AZUL_2.getCores());                
            } else if (nomePaleta.equals("Preta e Branca 1")){
                tabDataColorChooser.setPaleta(Paletas.Cores.PB_1.getCores());                
            } else if (nomePaleta.equals("Preta e Branca 2")){
                tabDataColorChooser.setPaleta(Paletas.Cores.PB_2.getCores());                
            } else if (nomePaleta.equals("Rosa 1")){
                tabDataColorChooser.setPaleta(Paletas.Cores.ROSA_1.getCores());                
            } else if (nomePaleta.equals("Rosa 2")){
                tabDataColorChooser.setPaleta(Paletas.Cores.ROSA_2.getCores());                                
            } else if (nomePaleta.equals("Verde e Amarela 1")){
                tabDataColorChooser.setPaleta(Paletas.Cores.VERDE_AMARELA_1.getCores());                                
            } else if (nomePaleta.equals("Verde e Amarela 2")){
                tabDataColorChooser.setPaleta(Paletas.Cores.VERDE_AMARELA_2.getCores());                                
            } else if (nomePaleta.equals("Vermelha 1")){
                tabDataColorChooser.setPaleta(Paletas.Cores.VERMELHA_1.getCores());                                
            } else if (nomePaleta.equals("Vermelha 2")){
                tabDataColorChooser.setPaleta(Paletas.Cores.VERMELHA_2.getCores());                                
            } else if (nomePaleta.equals("Colorida")){
                tabDataColorChooser.setPaleta(Paletas.Cores.COLORIDA.getCores());                                
            }
            drawMap();                        
        }
    }
    
}
