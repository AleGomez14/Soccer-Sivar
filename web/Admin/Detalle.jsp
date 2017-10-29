<%-- 
    Document   : detalle
    Created on : Oct 22, 2017, 3:26:17 PM
    Author     : Ventura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.modelo.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento Detalle</title>
        <meta charset="utf-8">
        <link rel="shortcut icon" href="../Imagenes/2.jpg"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <link rel="stylesheet" href="../bootstrap-3.3.6-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/tables.css" />
        <script Language='JavaScript'>
            function cargar(id, juga, jugado, p, e, a, penal, llegada, gole, cor)
            {
                document.frmDetalle.id.value = id;
                document.frmDetalle.cJuga.value = juga;
                document.frmDetalle.Jugador.value = jugado;
                document.frmDetalle.posesion.value = p;
                document.frmDetalle.expulsados.value = e;
                document.frmDetalle.amonestados.value = a;
                document.frmDetalle.penaltis.value = penal;
                document.frmDetalle.llegada.value = llegada;
                document.frmDetalle.goleador.value = gole;
                document.frmDetalle.corner.value = cor;
            }
        </script>
        <%
            if (request.getAttribute("valor") != null) {%>
        <script>
            alert('<%= request.getAttribute("valor")%>');
        </script>
        <%
            }
        %>
    <header>
        <nav class="navbar navbar-inverse navbar-fixed-top">

            <div class="conteiner-fluid">
                <div class="navabr-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-1">
                        <span class="sr-only">Menu</span>
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="navbar-1">
                    <ul class="nav navbar-nav">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="#"><font color="white">SIVAR LIGA</font></a>
                        </div>
                        <li><a href="Arbitro.jsp">Arbitros</a>
                        </li>
                        <li><a href="Entrenador.jsp">Entrenadores</a>
                        </li>
                        <li><a href="#">Equipo</a>
                        </li>
                        <li><a href="Incidencias.jsp">Incidencias</a>
                        </li>
                        <li><a href="detallePartido.jsp">Detalle de Partidos</a>
                        </li>
                        <li><a href="jugador.jsp">Jugadores</a>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right" >
                        <li><a href="../index.jsp?cerrar=true"><span class="glyphicon glyphicon-log-in"></span><font> Cerrar Sesion</font></a></li>
                    </ul>
                </div>     
            </div>    
        </nav>    
    </header>
</head>
<%
    CrudDetalle cdt = new CrudDetalle();
%>
<body>
    <br/><br/><br/>
    <div class="well ">
        <div class="container">
            <form action="operacionesDetalles" method="get" name="frmDetalle" class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-xs-3" >Codigo Detalle:</label>
                    <div class="col-xs-6">
                        <%
                            CrudDetalle obj = new CrudDetalle();
                            Object n = obj.contarDeta(obj);
                        %>
                        <input type="text" class="form-control" name="id" value="<%=n%>" placeholder="Ingrese codigo  Detalle" required>
                    </div>
                </div>
                    <div class="form-group" hidden="" >
                    <label for="sel1" class="control-label col-xs-3">codigo de Jugador</label>
                    <div class="col-xs-6">
                        <%
                            CrudDetalle obj1 = new CrudDetalle();
                            Object m = obj1.contarDeta(obj);
                        %>
                        <input type="text" class="form-control" name="cJuga" value="<%=m%>" placeholder="Ingrese codigo  Detalle" required>
                    </div>
                </div>
                <div class="form-group input-group" >
                    <label for="sel1" class="control-label col-xs-2">Mejor jugador</label>
                    <div class="col-xs-4" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <select class="form-control" id="sel1" name="Jugador">
                            <%
                                List<Jugador> lj1 = cdt.viewJuga();
                                for (Jugador ju : lj1) {
                            %>
                            <option value="<%=ju.getIdJugador()%>"><%=ju.getNombre()%></option>
                            <%}%>
                        </select>
                    </div>

                    <label for="sel1" class="control-label col-xs-2">Posecion de Balon</label>
                    <div class="col-xs-4"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <select class="form-control" id="sel1" name="posesion">
                            <%
                                List<Jugador> lj2 = cdt.viewJuga();
                                for (Jugador ju : lj2) {
                            %>
                            <option value="<%=ju.getIdJugador()%>"><%=ju.getNombre()%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="form-group" >
                    <label for="sel1" class="control-label col-xs-3">Goleador</label>
                    <div class="col-xs-6"> 
                        <select class="form-control" id="sel1" name="goleador">
                            <%
                                List<Jugador> lj3 = cdt.viewJuga();
                                for (Jugador ju : lj3) {
                            %>
                            <option value="<%=ju.getIdJugador()%>"><%=ju.getNombre()%></option>
                            <%}%>
                        </select>
                    </div>
                </div>

                <div class="form-group input-group" >
                    <label for="sel1" class="control-label col-xs-2">Numero de expulsados</label>
                    <div class="col-xs-4"> 
                        <input type="number" class="form-control" name="expulsados" value="" placeholder="Ingrese Numero  Expulsados" required>
                    </div>
                    <label for="sel1" class="control-label col-xs-2">Numero de Amonestado</label>
                    <div class="col-xs-4"> 
                        <input type="number" class="form-control" name="amonestados" value="" placeholder="Ingrese Numero  Amonestados" required>
                    </div>
                </div>
                <div class="form-group input-group" >
                    <label for="sel1" class="control-label col-xs-2">Numero de Penaltis</label>
                    <div class="col-xs-4"> 
                        <input type="number" class="form-control" name="penaltis" value="" placeholder="Ingrese Numero Penaltis" required>
                        &nbsp;&nbsp;&nbsp;</div>
                    <label for="sel1" class="control-label col-xs-2">Numero de LLega a Meta</label>
                    <div class="col-xs-4"> 
                        <input type="number" class="form-control" name="llegada" value="" placeholder="Ingrese de LLegadas a Meta" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-xs-3" >Cant. de Corner</label>
                    <div class="col-xs-6">
                        <input type="number" class="form-control" name="corner" value="" placeholder="Ingrese codigo  Detalle" required>
                    </div>
                </div>
        </div>

    </div>
    <div class="row">
        <div class="col-md-100">
            <center><button class="btn btn-lg btn-primary" type="submit" name="insertar" value="insertar">Insertar</button>
                <button class="btn btn-lg btn-success" type="submit" name="modificar" value="modificar" onclick="return confirm('Esta Seguro que Desea Modificar?');">Modificar</button>
                <button class="btn btn-lg btn-danger" type="submit" name="eliminar" value="eliminar" onclick="return confirm('Esta Seguro que Desea Eliminar');">Eliminar</button>
                <button class="btn btn-lg btn-info" type="reset" value="Limpiar">Limpiar</button></center>
        </div>      
    </div></form>
<hr>
<center>
    <table  border="1" class="table table-striped table-bordered table-hover table-condensed">

        <tr>
            <th class="danger">Codigo Detalle</th>
            <th class="danger" >Codigo Jugador</th>
            <th class="danger">Mejor Jugador</th>
            <th class="danger">Pesesion de Balon</th>
            <th class="danger">Goleador</th>
            <th class="danger">N° Expulsados</th>
            <th class="danger">N° de Amonestados</th>
            <th class="danger">Cant. Penaltis</th>
            <th class="danger">Llegadas a Metas</th>
            <th class="danger">Cant. Corner</th>
            <th class="danger">Seleccionar</th>
        </tr>
        <%
            List<DetallePartido> ldp = cdt.view();
            for (DetallePartido dp : ldp) {
        %>
        <tr>
            <th><%=dp.getIdDetalle()%></th>
            <th ><%=dp.getIdJugador()%></th>
            <th><%=dp.getMejorJuga()%></th>
            <th><%=dp.getPosesionBalon()%></th>
            <th><%=dp.getGoleador()%></th>
            <th><%=dp.getNumExpul()%></th>
            <th><%=dp.getNumAmo()%></th>
            <th><%=dp.getCatPenal()%></th>
            <th><%=dp.getLlegaMeta()%></th>
            <th><%=dp.getCorner()%></th>
            <td><a href="javascript:cargar(<%=dp.getIdDetalle()%>,
                   '<%=dp.getIdJugador()%>',
                   '<%=dp.getMejorJuga()%>',
                   '<%=dp.getPosesionBalon()%>',
                   '<%=dp.getGoleador()%>',
                   '<%=dp.getNumExpul()%>',
                   '<%=dp.getNumAmo()%>',
                   '<%=dp.getCatPenal()%>',
                   '<%=dp.getLlegaMeta()%>',
                   '<%=dp.getCorner()%>')">Seleccionar</a></td>
        </tr>
        </tr>
        <%}%>
        </tbody>
    </table></center>

</body>
</html>