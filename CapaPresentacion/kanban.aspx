<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="kanban.aspx.cs" Inherits="CapaPresentacion.kanban" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Assets/css/StyleSheet2.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        
 <div class="container d-flex border-bottom my-4">
         <div>
             <h5>Oportunidades</h5>
         </div>
 </div>

        <div class="mx-4 mb-5 d-flex justify-content-end ">
            <button id="btn+oportunidad" class="btn btn-warning fw-bold" data-bs-toggle="modal" data-bs-target="#todo_form" type="button">
                Agregar Oportunidad
            </button>
        </div>
        
      
        <div class="modal fade" id="todo_form" tabindex="-1" aria-labelledby="todoModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                       
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="text" id="todo_input" class="form-control mb-2" />
                        
                     
                        <button type="button" class="btn btn-success btn-block" id="todo_submit">Agregar oportunidad</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container mt-4">
            <div class="row mx-auto"> 
                <div class="col-md status mb-3 my-0" id="no_status">
                    <h2 class="borde1" >Nuevo Contacto</h2>
                </div>
                <div class="col-md status mb-3 my-0">
                    <h2 class="borde2" >Cliente Potencial</h2>
                </div>
                <div class="col-md status mb-3 my-0">
                    <h2 class="borde3">Nueva Reservacion</h2>
                </div>
                <div class="col-md status mb-3 my-0">
                    <h2 class="borde4">Cliente Atendido</h2>
                </div>
                
            </div>
        </div>

        <div id="overlay" class="d-none"></div>
    </form>

    <script src="Assets/js/Kscript.js"></script>
</asp:Content>
