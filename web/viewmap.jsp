<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
﻿<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="com.bandarra.jmapper.servlet.*"%>
<!--%@page import="org.bandarra.utils.*"%-->
<%@page import="java.net.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>${sessiondata.tabData.titulo1}</title>
       <script type="text/javascript">
          startList = function() {
              if (document.all&&document.getElementById) {
                  navRoot = document.getElementById("nav");
                  for (i=0; i<navRoot.childNodes.length; i++) {
                      node = navRoot.childNodes[i];
                      if (node.nodeName=="LI") {
                          node.onmouseover=function() {
                              this.className+=" over";
                          }
                          node.onmouseout=function() {
                          this.className=this.className.replace(" over", "");
                          }
                      }
                  }
              }
          }
          window.onload=startList;        
        </script>        
        <style type="text/css">
            body{
              color: #777
            }
            h2{
              border: 1px solid #ccc;
              background:#EEEEEE;
              color: #FF0000;
              text-align: center;
              width: 100%;
            }
            table{
              border: 1px solid #ccc;
              width: 150px;
              border-bottom: none;
              color: #777;  
              text-align: center;           
            }
            table.geral{
              border-bottom: 1px solid #ccc;
              width: 100%;
            }

             ul {
                margin: 0;
                padding: 0;
                list-style: none;
                width: 150px;
                border-bottom: 1px solid #ccc;  
                z-index: 1;

              }
            ul li {
                position: relative;
                z-index:1;
            }  
            li ul {
                position: absolute;
                left: 149px;
                top: 0;
                display: none;
            }    
            a{
              border:none;
              text-decoration: none;
              color: #FFFFFF;
              background: none;              
            }                  
            ul li a {
                display: block;
                text-decoration: none;
                color: #777;
                background: #fff;
                border: 1px solid #ccc;
                border-bottom: 0;

            } 
            a.nomecor{
                font-size: smaller;            
            }
            
            /* Fix IE. Hide from IE Mac \*/
            * html ul li { float: left; height: 1%; }
            * html ul li a { height: 1%; }
            /* End */   
                
            li:hover ul, li.over ul { 
                display: block;
            }               
            
            ul li a:hover{
              background: #EEEEEE;
              color:#FF0000;
            }
            table.paleta{
              border: 1px solid #ccc;            
              border-collapse: collapse;
            }
            table.paleta tr td{
              border:none;
              width:15px;
              height:20px;   
            }
            img.mapa {
            }
        </style>      
    </head>
    <body>    
      <h2>${sessiondata.tabData.titulo1} </h2>        
      <table class="geral">
      <tr><td valign="top">
        <table>
          <tr>
            <td></td>
            <td><a href="MapSession?command=pannorth"><img width="35" src="seta_cima.gif" alt="cima"/></a></td>
            <td></td>
          </tr>            
          <tr>          
            <td><a href="MapSession?command=panwest"><img width="35" src="seta_esquerda.gif" alt="esquerda"/></a></td>
            <td></td>
            <td><a href="MapSession?command=paneast"><img width="35" src="seta_direita.gif" alt="direita"/></a></td>
          </tr>            
          <tr>          
            <td></td>
            <td><a href="MapSession?command=pansouth"><img width="35" src="seta_baixo.gif" alt="baixo"/></a></td>
            <td></td>                        
          </tr>
        </table>  
        <table>
           <tr>
             <td><a href="MapSession?command=zoom"><img src="zoom.png" alt="zoom"/></a></td>
             <td><a href="MapSession?command=reset"><img src="reset.png" alt="reset"/></a></td>
           </tr>
        </table>     
 
        <ul id="nav">
            <li><a href="#">Paleta:</a>
              <ul>
                 <li> 
                 <ul> 
                   <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Verde+Roxo+2">Verde/Roxa 2</a>
                       <table class="paleta">
                       <tr>
                         <td style="background: #663399;"/>
                         <td style="background: #6666A5;"/>
                         <td style="background: #6699B2;"/>
                         <td style="background: #66B2B8;"/>
                         <td style="background: #66CCBF;"/>
                         <td style="background: #66E5C5;"/>                         
                         <td style="background: #66FFCC;"/>                         
                         <td style="background: #9FFFDF;"/>                         
                         <td style="background: #C5FFEB;"/>                         
                         <td style="background: #D8FFF8;"/>                                                                                                    
                       </tr>
                       </table>                        
                   </li>
                   <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Amarela+2">Amarela 2</a>
                       <table class="paleta">
                       <tr>
                         <td style="background: #FFFFB2;"/>
                         <td style="background: #FFFF79;"/>
                         <td style="background: #FFE040;"/>
                         <td style="background: #FFC200;"/>
                         <td style="background: #FF9933;"/>
                         <td style="background: #FF6633;"/>                         
                         <td style="background: #CC6633;"/>                         
                         <td style="background: #CC3300;"/>                         
                         <td style="background: #990000;"/>                         
                         <td style="background: #663300;"/>                                                                                                    
                       </tr>
                       </table>                                           
                   </li>                   
                   <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Azul+2">Azul 2</a>
                       <table class="paleta">
                       <tr>
                          <td style="background: #00009F;"/>
                          <td style="background: #0000BF;"/>
                          <td style="background: #0000DF;"/>
                          <td style="background: #0000FF;"/>
                          <td style="background: #3F3FFF;"/>
                          <td style="background: #5F5FFF;"/>
                          <td style="background: #7F7FFF;"/>
                          <td style="background: #9F9FFF;"/>
                          <td style="background: #BFBFFF;"/>
                          <td style="background: #DFDFFF;"/>
                       </tr>
                       </table>                   
                   </li>    
                   <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Preta+e+Branca+2">Preta/Branca 2</a>
                       <table class="paleta">
                       <tr>
                         <td style="background: #606060;"/>                            
                         <td style="background: #707070;"/>                         
                         <td style="background: #808080;"/>                         
                         <td style="background: #909090;"/>                         
                         <td style="background: #A0A0A0;"/>                         
                         <td style="background: #B0B0B0;"/>
                         <td style="background: #C0C0C0;"/>
                         <td style="background: #D0D0D0;"/>
                         <td style="background: #E0E0E0;"/>                         
                         <td style="background: #F0F0F0;"/>                         
                       </tr>
                       </table>                                    
                   </li>    
                   <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Rosa+2">Rosa 2</a>
                       <table class="paleta">
                       <tr>
                          <td style="background: #9F0000;"/>
                          <td style="background: #BF0000;"/>
                          <td style="background: #DF0000;"/>
                          <td style="background: #FF0000;"/>
                          <td style="background: #FF3F3F;"/>
                          <td style="background: #FF5F5F;"/>
                          <td style="background: #FF7F7F;"/>
                          <td style="background: #FF9F9F;"/>
                          <td style="background: #FFBFBF;"/>
                          <td style="background: #FFDFDF;"/>
                       </tr>
                       </table>                                      
                   </li>       
                   <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Verde+e+Amarela+2">Verde/Amarela 2</a>
                       <table class="paleta">
                       <tr>
                          <td style="background: #FFFFB2;"/>
                          <td style="background: #FFFF79;"/>
                          <td style="background: #DFE58C;"/>
                          <td style="background: #BFD67F;"/>
                          <td style="background: #9FB272;"/>
                          <td style="background: #7F9966;"/>
                          <td style="background: #5F7F59;"/>
                          <td style="background: #3F664C;"/>
                          <td style="background: #1F4C3F;"/>
                          <td style="background: #003333;"/>
                       </tr>
                       </table>                   
                   </li>
                   <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Vermelha+2">Vermelha 2</a>
                       <table class="paleta">
                       <tr>
                          <td style="background: #FA0000;"/>
                          <td style="background: #EB0000;"/>
                          <td style="background: #DC0000;"/>
                          <td style="background: #CD0000;"/>
                          <td style="background: #BE0000;"/>
                          <td style="background: #AF0000;"/>
                          <td style="background: #A00000;"/>
                          <td style="background: #910000;"/>
                          <td style="background: #820000;"/>
                          <td style="background: #730000;"/>
                       </tr>
                       </table>                   
                   </li>                                                                               
                 </ul>                 
                 <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Verde+Roxo+1">Verde/Roxa 1</a>
                       <table class="paleta">
                       <tr>
                         <td style="background: #D8FFF8;"/>
                         <td style="background: #C5FFEB;"/>
                         <td style="background: #9FFFDF;"/>
                         <td style="background: #66FFCC;"/>
                         <td style="background: #66E5C5;"/>
                         <td style="background: #66CCBF;"/>                         
                         <td style="background: #66B2B8;"/>                         
                         <td style="background: #6699B2;"/>                         
                         <td style="background: #6666A5;"/>                         
                         <td style="background: #663399;"/>                                                                                                    
                       </tr>
                       </table>                                  
                 </li>                 
                 <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Amarela+1">Amarela 1</a>
                      <table  class="paleta">
                      <tr>
                         <td style="background: #663300;"/>
                         <td style="background: #990000;"/>
                         <td style="background: #CC3300;"/>
                         <td style="background: #CC6633;"/>
                         <td style="background: #FF6633;"/>
                         <td style="background: #FF9933;"/>
                         <td style="background: #FFC200;"/>
                         <td style="background: #FFE040;"/>
                         <td style="background: #FFFF79;"/>
                         <td style="background: #FFFFB2;"/>
                      </tr>
                      </table>                 
                 </li>                 
                 <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Azul+1">Azul 1</a>
                       <table  class="paleta">
                       <tr>
                          <td style="background: #DFDFFF;"/>
                          <td style="background: #BFBFFF;"/>
                          <td style="background: #9F9FFF;"/>
                          <td style="background: #7F7FFF;"/>
                          <td style="background: #5F5FFF;"/>
                          <td style="background: #3F3FFF;"/>
                          <td style="background: #0000FF;"/>
                          <td style="background: #0000DF;"/>
                          <td style="background: #0000BF;"/>
                          <td style="background: #00009F;"/>
                       </tr>
                       </table>                 
                 </li>                 
                 <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Preta+e+Branca+1">Preta/Branca 1</a>
                       <table  class="paleta">
                       <tr>
                         <td style="background: #F0F0F0;"/>
                         <td style="background: #E0E0E0;"/>
                         <td style="background: #D0D0D0;"/>
                         <td style="background: #C0C0C0;"/>
                         <td style="background: #B0B0B0;"/>
                         <td style="background: #A0A0A0;"/>                         
                         <td style="background: #909090;"/>                         
                         <td style="background: #808080;"/>                         
                         <td style="background: #707070;"/>                         
                         <td style="background: #606060;"/>                                                                                                    
                       </tr>
                       </table>                 
                 </li>                 
                 <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Rosa+1">Rosa 1</a>
                       <table  class="paleta">
                       <tr>
                          <td style="background: #FFDFDF;"/>
                          <td style="background: #FFBFBF;"/>
                          <td style="background: #FF9F9F;"/>
                          <td style="background: #FF7F7F;"/>
                          <td style="background: #FF5F5F;"/>
                          <td style="background: #FF3F3F;"/>
                          <td style="background: #FF0000;"/>
                          <td style="background: #DF0000;"/>
                          <td style="background: #BF0000;"/>
                          <td style="background: #9F0000;"/>
                       </tr>
                       </table>                 
                 </li>                 
                 <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Verde+e+Amarela+1">Verde/Amarela 1</a>
                       <table  class="paleta">
                       <tr>
                          <td style="background: #003333;"/>
                          <td style="background: #1F4C3F;"/>
                          <td style="background: #3F664C;"/>
                          <td style="background: #5F7F59;"/>
                          <td style="background: #7F9966;"/>
                          <td style="background: #9FB272;"/>
                          <td style="background: #BFD67F;"/>
                          <td style="background: #DFE58C;"/>
                          <td style="background: #FFFF79;"/>
                          <td style="background: #FFFFB2;"/>
                       </tr>
                       </table>                 
                 </li>                 
                 <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Vermelha+1">Vermelha 1</a>
                       <table  class="paleta">
                       <tr>
                          <td style="background: #730000;"/>
                          <td style="background: #820000;"/>
                          <td style="background: #910000;"/>
                          <td style="background: #A00000;"/>
                          <td style="background: #AF0000;"/>
                          <td style="background: #BE0000;"/>
                          <td style="background: #CD0000;"/>
                          <td style="background: #DC0000;"/>
                          <td style="background: #EB0000;"/>
                          <td style="background: #FA0000;"/>
                       </tr>
                       </table>                 
                 </li>                                                                                                                                                                                           
                 <li><a class="nomecor" href="MapSession?command=paleta&amp;value=Colorida">Colorida</a>
                       <table  class="paleta">
                       <tr>
                          <td style="background: #FFFF00;"/>
                          <td style="background: #404040;"/>
                          <td style="background: #C0C0C0;"/>
                          <td style="background: #FFAFAF;"/>
                          <td style="background: #FF0000;"/>
                          <td style="background: #808080;"/>
                          <td style="background: #00FFFF;"/>
                          <td style="background: #00FF00;"/>
                          <td style="background: #FF00FF;"/>
                          <td style="background: #0000FF;"/>
                       </tr>
                       </table>                 
                 </li>                                   
               </ul>
            </li>           
            <li><a href="#">Qtd Classes</a>
               <ul>
                 <li><a href="MapSession?command=numclasses&amp;value=2">2</a></li>
                 <li><a href="MapSession?command=numclasses&amp;value=3">3</a></li>
                 <li><a href="MapSession?command=numclasses&amp;value=4">4</a></li>
                 <li><a href="MapSession?command=numclasses&amp;value=5">5</a></li>                                                                    
                 <li><a href="MapSession?command=numclasses&amp;value=6">6</a></li>
                 <li><a href="MapSession?command=numclasses&amp;value=7">7</a></li>
                 <li><a href="MapSession?command=numclasses&amp;value=8">8</a></li>
                 <li><a href="MapSession?command=numclasses&amp;value=9">9</a></li>
                 <li><a href="MapSession?command=numclasses&amp;value=10">10</a></li>                                                                                     
               </ul>
            </li>   
            <li><a href="#">Coluna</a>
               <ul>
               <c:forEach var="nome" items="${sessiondata.tabData.nomeColunas}" >
                    <li><a href="MapSession?command=coluna&amp;value=${nome}">${nome}</a></li>                   
               </c:forEach>                         
               </ul>
            </li>               
            
        </ul> 
            
        </td>
        <td>   
        <img class="mapa" src="JPEGMapper" alt="Mapa"> 
        </td></tr>
      </table>  
    </body>
</html>
